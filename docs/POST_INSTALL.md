# Post Install Setup

## Paru

```sh
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/paru-bin.git
cd paru-bin
makepkg -sic
```

## Missing packages

```sh
sudo pacman -S --needed fzf ghostty git less man neovim starship stow tmux zsh
```

## Plymouth

```sh
paru -S --needed plymouth plymouth-theme-arch-os

sudo tee /etc/plymouth/plymouthd.conf > /dev/null << EOF
[Daemon]
Theme=arch-os
ShowDelay=0
EOF

sudo mkinitpcio -P
```

## Chaotic AUR

[Guide](https://aur.chaotic.cx/docs)

## Better rm

```sh
paru -S --needed safe-rm trash-cli
```

## Fonts

```sh
sudo pacman -S --needed noto-fonts noto-fonts-cjk noto-fonts-emoji ttf-nerd-fonts-symbols ttf-ubuntu-font-family
```

## Clipboard

```sh
sudo pacman -S --needed wl-clipboard mailcap xdg-utils
# wl-paste --primary --watch wl-copy
```

## Firewall

```sh
sudo pacman -S --needed firewalld
sudo systemctl enable --now firewalld
```

## Encryption

If you chose to add encryption, the default iteration time is quite long.

```sh
sudo cryptsetup luksChangeKey /dev/nvme0n1p2 --iter-time 1000
```

## Bluetooth

Bluetooth is not enabled by default.

```sh
sudo systemctl enable --now bluetooth
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

sudo systemctl enable --now reflector.timer
```

## Printer

[Guide](https://discovery.endeavouros.com/network/printers/2021/03/#network-printer)

```sh
sudo pacman -Sy cups cups-pdf

# avahi for local discovery
sudo systemctl enable --now avahi-daemon
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
paru -S --needed gnome-shell-extension-just-perfection-desktop gnome-shell-extension-space-bar-git gnome-shell-extension-pop-shell-git
```

## Themes

Use `gdm-settings` to apply theme to the login screen.

```sh
paru -S --needed gdm-settings banana-cursor-bin
```

Setup input sources in gdm screen.

```sh
sudo localectl set-x11-keymap us,us pc104 dvorak, grp:win_space_toggle
```

## Nautilus

[Guide](https://github.com/Stunkymonkey/nautilus-open-any-terminal)

```sh
paru -S --needed nautilus-open-any-terminal
```

## SSH

Configure sshd to only accept authentication key login.

Add authorized users public key to `authorized_keys`.

```sh
# enable ssh server in machine
sudo systemctl enable --now sshd

# allow ssh
sudo firewall-cmd --zone=home --add-service=ssh --permanent
sudo firewall-cmd --reload

# avahi for local discovery
sudo systemctl enable --now avahi-daemon
```

## Docker

```sh
sudo pacman -S --needed docker
sudo systemctl enable --now docker
sudo systemctl enable --now containerd
sudo usermod -aG docker $USER

paru -S --needed lazydocker
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
paru -S --needed xdg-terminal-exec
stow --target="$HOME" xdg
```

