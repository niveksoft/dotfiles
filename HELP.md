# Help

## Grub configuration is broken after an update

Boot only shows a screen for grub command line.

```
# select boot partition
set root=(hd0,1)

# load the linux kernel and use our root partition
linux /vmlinuz-linux cryptdevice=/dev/nvme0n1p2:cryptroot root=/dev/mapper/cryptroot rw rootflags=subvol=@ init=/usr/lib/systemd/systemd

# load initframfs so we can mount root file system
initrd /initramfs-linux.img

# start the boot process
boot
```

Finally when you've successfully login. Regenerate grub configuration.

```sh
sudo grub-mkconfig -o /boot/grub/grub.cfg
```
