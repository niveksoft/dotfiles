# Framework Install

[Archwiki](https://wiki.archlinux.org/title/Framework_Laptop_13_(AMD_Ryzen_7040_Series)) 
## Display color profile

Import icc profile using color manager in the gnome control center.

```sh
cd "$HOME"/Downloads
curl -LO https://www.notebookcheck.net/uploads/tx_nbc2/BOE0CB4.icm
cd -
```

## Better speakers

Open easyeffects and select the preset to use.

```sh
sudo pacman -S --noconfirm easyeffects

# https://github.com/cab404/framework-dsp
TMP=$(mktemp -d) && \
CFG=${XDG_CONFIG_HOME:-~/.config}/easyeffects && \
mkdir -p "$CFG" && \
curl -Lo "$TMP"/fwdsp.zip https://github.com/cab404/framework-dsp/archive/refs/heads/master.zip && \
unzip -d "$TMP" "$TMP"/fwdsp.zip 'framework-dsp-master/config/*/*' && \
sed -i 's|%CFG%|'"$CFG"'|g' "$TMP"/framework-dsp-master/config/*/*.json && \
cp -rv "$TMP"/framework-dsp-master/config/* "$CFG" && \
rm -rf "$TMP"
```

## Power management

```sh
sudo pacman -S --noconfirm power-profiles-daemon && \
sudo systemctl enable power-profiles-daemon.service
```

## Wi-Fi

```sh
sudo pacman -S --noconfirm wireless-regdb iwd

# set domain
sudo sed -i 's/^#WIRELESS_REGDOM="US"/WIRELESS_REGDOM="US"/' /etc/conf.d/wireless-regdom

# use iwd as backend
echo -e "[device]\nwifi.backend=iwd" | sudo tee /etc/NetworkManager/conf.d/wifi_backend.conf

sudo systemctl restart NetworkManager
```

## Fingerprint

[Docs](https://knowledgebase.frame.work/en_us/updating-fingerprint-reader-firmware-on-linux-for-13th-gen-and-amd-ryzen-7040-series-laptops-HJrvxv_za)

```sh
sudo pacman -S --noconfirm fprint fwupd
```

## Ambient light sensor

```sh
sudo pacman -S --noconfirm iio-sensor-proxy
```
