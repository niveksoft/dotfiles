# Post Install Setup

Setup steps for a new installation of archlinux with archinstall gnome desktop.

## Missing packages

```sh
sudo pacman -S --needed \
git \
github-cli \
less \
neovim \
starship \
stow \
tmux \
wezterm \
zsh \
ripgrep \
fd
```

## Yay

```sh
sudo pacman -S --needed git base-devel && \
git clone https://aur.archlinux.org/yay-bin.git && \
cd yay-bin && \
makepkg -si && \
yay -Y --gendb && \
yay -Y --devel --save
```

## Chaotic AUR

[Guide](https://aur.chaotic.cx/docs)

## Timeshift

Recover from partial upgrades. 

Open and setup for BTFRS.

```sh
yay -S --neeeded timeshift timeshift-autosnap
sudo systemctl enable cronie.service
sudo systemctl start cronie.service
```

## Grub BTRFS

[Guide](https://discovery.endeavouros.com/encrypted-installation/btrfs-with-timeshift-snapshots-on-the-grub-menu/2022/02/)

```sh
sudo pacman -S --needed grub-btrfs inotify-tools
sudo systemctl enable grub-btrfsd
sudo systemctl start grub-btrfsd
```

Manually create snapshots.

```sh
# generate entry
sudo /etc/grub.d/41_snapshots-btrfs

# regenerate config
sudo grub-mkconfig -o /boot/grub/grub.cfg
```


## Better rm

```sh
yay -S --needed --noconfirm \
safe-rm \
trash-cli-git
```

## Zshell

Install [zim](https://zimfw.sh/#install)

```sh
chsh -s "$(which zsh)" && \
yay -S zsh-zim-git
```

## Fonts

```sh
sudo pacman -S --needed noto-fonts noto-fonts-cjk noto-fonts-emoji ttf-nerd-fonts-symbols ttf-ubuntu-font-family
```

## Clipboard

```sh
sudo pacman -S --needed wl-clipboard && \
wl-paste --primary --watch wl-copy
```

## Firewall

```sh
sudo pacman -S --needed firewalld && \
sudo systemctl enable --now firewalld.service
```

## Encryption

If you chose to add encryption, the default iteration time is quite long.

```sh
sudo cryptsetup luksChangeKey /dev/nvme0n1p2 --iter-time 1000
```

## Bluetooth

Bluetooth is not enabled by default.

```sh
sudo systemctl enable bluetooth && \
sudo systemctl start bluetooth
```

## Reflector

Make sure to keep your mirrorlist updated.

```sh
sudo pacman -S --needed reflector

sudo tee /etc/xdg/reflector/reflector.conf > /dev/null << EOF
# Reflector configuration file for the systemd service.
#
# Empty lines and lines beginning with "#" are ignored. All other lines should
# contain valid reflector command-line arguments. The lines are parsed with
# Python's shlex modules so standard shell syntax should work. All arguments are
# collected into a single argument list.
#
# See "reflector --help" for details.
# Recommended Options
# Set the output path where the mirrorlist will be saved (--save).
--save /etc/pacman.d/mirrorlist
# Select the transfer protocol (--protocol).
--protocol https
# Select the country (--country).
# Consult the list of available countries with "reflector --list-countries" and
# select the countries nearest to you or the ones that you trust. For example:
--country Canada
# Use only the most recently synchronized mirrors (--latest).
--latest 5
# Sort the mirrors by synchronization time (--sort).
--sort rate
EOF

sudo systemctl enable reflector.timer && \
sudo systemctl start reflector.timer
```

## Printer

[Guide](https://discovery.endeavouros.com/network/printers/2021/03/#network-printer)

```sh
sudo pacman -Syu cups cups-pdf
sudo systemctl enable --now cups.service && \
sudo systemctl enable --now cups.socket && \
```

Edit `/etc/nsswitch.conf` and add `mdns_minimal [NOTFOUND=return]` before `resolve`

Note: make sure mdns is enabled in firewalld for `home`

```sh
sudo systemctl restart NetworkManager
```

OR add manually if the found printer doesn't work

```sh
lpadmin -p PRINTER-NAME -E -v "ipp://11.22.33.44/ipp/print" -m everywhere
```

## Unnecessary GNOME packages

```sh
sudo pacman -Runs gnome-console epiphany gnome-text-editor
```

## Gnome Extensions

```sh
yay -S --needed --noconfirm gnome-shell-extension-blur-my-shell \
gnome-shell-extension-dash-to-dock \
gnome-shell-extension-dash-to-dock \
gnome-shell-extension-just-perfection-desktop \
gnome-shell-extension-space-bar-git \
gnome-shell-extension-pop-shell-git \
```

## Themes

Use `gdm-settings` to apply theme to the login screen.

```sh
yay -S --needed --noconfirm \
gdm-settings \
banana-cursor-bin \
yaru-gnome-shell-theme \
rose-pine-gtk-theme-full
```

## Nautilus

[Guide](https://github.com/Stunkymonkey/nautilus-open-any-terminal)

```sh
yay -S --needed --noconfirm nautilus-open-any-terminal
```

## SSH

Configure sshd to only accept authentication key login.

Add authorized users public key to `authorized_keys`.

```sh
# enable ssh server in machine
sudo systemctl enable sshd
sudo systemctl start sshd

# allow ssh
sudo firewall-cmd --zone=home --add-service=ssh --permanent
sudo firewald-cmd --reload

# avahi for local discovery
sudo systemctl enable avahi-daemon
sudo systemctl start avahi-daemon
```

## Docker

```sh
sudo pacman -S --needed --noconfirm docker
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
sudo usermod -aG docker $USER

yay -S --needed --noconfirm lazydocker
```

## Utilities

```sh
yay -S --needed --noconfirm \
lazygit \
ripgrep
```

## TTS

```sh
yay -S --needed --noconfirm \
piper-tts-bin \
piper-voices-en-us
```

Copy `piper/piper-generic.conf` in `/etc/speech-dispatcher/modules`.

Update `/etc/speech-dispatcher/speechd.conf` to set below.

```sh
# set voice
DefaultVoiceType "MALE1"

# set language
DefaultLanguage "en"

# set audio output method
AudioOutputMethod "pulse"

# add module
AddModule "piper-generic" "sd_generic" "piper-generic.conf"

# set default module
DefaultModule piper-generic
```

### XDG Terminal

[Guide](https://unix.stackexchange.com/questions/707469/error-with-gtk-launch-unable-to-find-terminal-required-for-application)

Currently setup to use `ghostty`

```sh
stow --target="$HOME" xdg

yay -S --needed xdg-terminal-exec-mkhl

# or

yay -S --needed xdg-terminal-exec-git
```

