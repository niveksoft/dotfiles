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
zsh
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

```sh
yay -S --needed --noconfirm banana-cursor-bin \
yaru
```
