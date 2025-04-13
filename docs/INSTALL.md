# Arch Linux Installation Guide: AMD Framework Laptop
## (LUKS2 FDE, LVM, GRUB, Hibernate, GNOME/Wayland)

---

## Phase 1: Pre-installation

1.  **Download Arch Linux ISO:**
    * Get the latest ISO from [https://archlinux.org/download/](https://archlinux.org/download/).

2.  **Create Bootable USB:**
    * Use `dd`, Etcher, Rufus, Ventoy, or similar to write the ISO to a USB drive.

3.  **Update Framework BIOS (Recommended):**
    * Ensure your laptop has the latest UEFI firmware from Framework support.

4.  **Boot from USB:**
    * Insert USB, power on, press boot menu key (e.g., `F12`) or BIOS key (`F2`).
    * Select the Arch Linux USB entry (ensure it's UEFI mode).

5.  **Verify Boot Mode (UEFI):**
    ```bash
    ls /sys/firmware/efi/efivars
    ```
    * *Success if directory contents are listed.*

6.  **Connect to the Internet:**
    * **WiFi (using iwd):**
        ```bash
        iwctl
        # Inside iwctl:
        # device list
        # station <device> scan
        # station <device> get-networks
        # station <device> connect "Your_SSID"  # Enter password when prompted
        # exit
        ```
    * **Ethernet:** Should connect automatically.
    * **Verify:**
        ```bash
        ping archlinux.org
        ```

7.  **Update System Clock:**
    ```bash
    timedatectl set-ntp true
    timedatectl status
    ```

---

## Phase 2: Partitioning, Encryption, and LVM Setup

1.  **Identify Target Disk:**
    * Likely `/dev/nvme0n1`. Verify with `lsblk`. Replace `<disk>` below.
    ```bash
    lsblk
    ```

2.  **Partition the Disk (using gdisk):**
    ```bash
    gdisk /dev/<disk>
    ```
    * Inside `gdisk`:
        * Delete existing partitions if needed (`d`).
        * Create **EFI System Partition (ESP)**:
            * Command: `n`, Partition: `1`, First Sector: `Default`, Last Sector: `+512M` (or `+1G`), Hex Code: `ef00`
        * Create **LUKS/LVM Partition**:
            * Command: `n`, Partition: `2`, First Sector: `Default`, Last Sector: `Default` (rest of disk), Hex Code: `8300`
        * Write changes and exit: `w`

3.  **Format the EFI Partition:**
    ```bash
    mkfs.fat -F32 /dev/<disk>p1
    ```

4.  **Setup LUKS Encryption (LUKS2):**
    * Encrypt the second partition:
        ```bash
        cryptsetup luksFormat --type luks2 /dev/<disk>p2
        ```
        * Type `YES` (uppercase), enter & verify a **strong passphrase**.
    * Open the LUKS container:
        ```bash
        cryptsetup open /dev/<disk>p2 cryptlvm
        ```
        * Enter your passphrase. Device appears at `/dev/mapper/cryptlvm`.

5.  **Setup LVM on the Decrypted Container:**
    * Create Physical Volume (PV):
        ```bash
        pvcreate /dev/mapper/cryptlvm
        ```
    * Create Volume Group (VG):
        ```bash
        vgcreate vg0 /dev/mapper/cryptlvm
        ```
    * Create Logical Volumes (LVs):
        * **Swap:** (Size >= RAM, e.g., `17G` for 16GB RAM)
            ```bash
            lvcreate -L <Your_RAM_Size_in_GiB>G vg0 -n swap
            ```
        * **Root (`/`):** (e.g., `50G`)
            ```bash
            lvcreate -L <Root_Partition_Size_in_GiB>G vg0 -n root
            ```
        * **Home (`/home`):** (Use remaining space)
            ```bash
            lvcreate -l 100%FREE vg0 -n home
            ```
    * Verify: `lvs`

6.  **Format the Logical Volumes:**
    ```bash
    mkfs.ext4 /dev/vg0/root
    mkfs.ext4 /dev/vg0/home
    mkswap /dev/vg0/swap
    ```

7.  **Mount the Filesystems:**
    ```bash
    mount /dev/vg0/root /mnt
    mount --mkdir /dev/vg0/home /mnt/home
    mount --mkdir /dev/<disk>p1 /mnt/boot
    swapon /dev/vg0/swap
    ```
    * Verify: `lsblk` or `df -h`

---

## Phase 3: Base System Installation

1.  **Install Essential Packages:**
    ```bash
    pacstrap -K /mnt base linux linux-firmware lvm2 amd-ucode grub efibootmgr neovim networkmanager bluez bluez-utils cups cups-pdf fprintd firewalld iio-sensor-proxy sudo pipewire pipewire-pulse pipewire-alsa pipewire-jack wireplumber fwupd mesa libva-mesa-driver vulkan-radeon xf86-video-amdgpu xf86-video-ati xorg-server xorg-xinit gnome gnome-tweaks htop iwd openssh smartmontools wget wireless_tools wpa_supplicant xdg-utils git less man starship stow tmux ghostty zsh
    ```

---

## Phase 4: System Configuration (Inside Chroot)

1.  **Generate fstab:**
    ```bash
    genfstab -U /mnt >> /mnt/etc/fstab
    ```
    * *Verify the contents of `/mnt/etc/fstab` (use `nano /mnt/etc/fstab`).*

2.  **Chroot into the New System:**
    ```bash
    arch-chroot /mnt
    ```

3.  **Set Time Zone:** (Replace `Canada/Mountain` with your zone from `/usr/share/zoneinfo/`)
    ```bash
    ln -sf /usr/share/zoneinfo/Canada/Mountain /etc/localtime
    hwclock --systohc
    ```

4.  **Set Locale:**
    * Edit `/etc/locale.gen` (e.g., `nano /etc/locale.gen`), uncomment `en_US.UTF-8 UTF-8` and others needed.
    * Generate locales:
        ```bash
        locale-gen
        ```
    * Set default language:
        ```bash
        echo "LANG=en_US.UTF-8" > /etc/locale.conf
        ```

5.  **Set Hostname:** (Replace `framework` with your choice)
    ```bash
    echo "framework" > /etc/hostname
    ```
    * Edit `/etc/hosts` (`nano /etc/hosts`) and add:
        ```
        127.0.0.1   localhost
        ::1         localhost
        127.0.1.1   framework.localdomain framework
        ```
        *(Adjust hostname if you changed it).*

6.  **Configure Initramfs (mkinitcpio):**
    * Edit `/etc/mkinitcpio.conf` (`nano /etc/mkinitcpio.conf`).
    * Find the `HOOKS=(...)` line. Ensure `keyboard`, `keymap`, `encrypt`, `lvm2`, `resume` are included **before** `filesystems`. Example:
        ```
        HOOKS=(base udev autodetect keyboard keymap consolefont modconf block encrypt lvm2 filesystems fsck resume)
        ```
    * Regenerate initramfs:
        ```bash
        mkinitcpio -P
        ```

7.  **Set Root Password:**
    ```bash
    passwd
    ```

8.  **Install and Configure GRUB:**
    * Find UUID of the LUKS partition (`/dev/<disk>p2`):
        ```bash
        blkid /dev/<disk>p2
        ```
        * *Copy the UUID value.*
    * Edit GRUB defaults (`nano /etc/default/grub`):
        * Modify `GRUB_CMDLINE_LINUX_DEFAULT`:
            ```
            # Replace <LUKS_PARTITION_UUID> with your actual UUID from blkid
            GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet cryptdevice=UUID=<LUKS_PARTITION_UUID>:cryptlvm root=/dev/vg0/root resume=/dev/vg0/swap amd_pstate=active"
            ```
        * Ensure crypto disk support is enabled (uncommented):
            ```
            GRUB_ENABLE_CRYPTODISK=y
            ```
    * Save the file.
    * Install GRUB:
        ```bash
        grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
        ```
    * Generate GRUB config:
        ```bash
        grub-mkconfig -o /boot/grub/grub.cfg
        ```
        * *Check output for errors and ensure it finds your kernel.*

9.  **Enable Essential Services:**
    ```bash
    systemctl enable NetworkManager
    systemctl enable gdm
    systemctl enable bluetooth
    systemctl enable firewalld
    ```

10. **Create User Account:** (Replace `<username>` with yours)
    ```bash
    useradd -m -G wheel <username>
    passwd <username>
    ```

11. **Configure Sudo:**
    * Run `visudo`.
    * Uncomment the line: `%wheel ALL=(ALL:ALL) ALL`
    * Save and exit (`Ctrl+X`, `Y`, `Enter` in nano).

---

## Phase 5: Final Steps and Reboot

1.  **Exit Chroot:**
    ```bash
    exit
    ```

2.  **Unmount Filesystems:**
    ```bash
    umount -R /mnt
    ```

3.  **Deactivate LVM and LUKS:**
    ```bash
    swapoff /dev/vg0/swap
    lvchange -an vg0
    cryptsetup close cryptlvm
    ```

4.  **Reboot:**
    ```bash
    reboot
    ```
    * *Remove the installation USB drive.*

---

## Phase 6: Post-installation

1.  **First Boot:**
    * Select Arch Linux in GRUB.
    * Enter your LUKS passphrase when prompted.
    * Log in at the GDM screen with your user account (`<username>`).

2.  **Verify Session (GNOME/Wayland):**
    * Go to Settings -> About. "Windowing System" should show "Wayland".

3.  **Check Network:** Ensure internet connection is active.

4.  **Update System:**
    ```bash
    sudo pacman -Syu
    ```

5.  **Enroll Fingerprint:**
    * Settings -> Users -> Fingerprint Login.

6.  **Test Hibernate:**
    ```bash
    systemctl hibernate
    ```
    * System powers off. Power on, enter LUKS passphrase, check if session restored.

7.  **Check Firmware Updates:**
    ```bash
    sudo fwupdmgr get-devices
    sudo fwupdmgr refresh --force
    sudo fwupdmgr get-updates
    # If updates available:
    # sudo fwupdmgr update
    ```

8.  **Further Customization:**
    * Install needed applications via `pacman`.
    * Consult the Arch Wiki ([https://wiki.archlinux.org/](https://wiki.archlinux.org/)) and Framework Laptop page ([https://wiki.archlinux.org/title/Framework_Laptop_13](https://wiki.archlinux.org/title/Framework_Laptop_13)) for more tweaks.

---
