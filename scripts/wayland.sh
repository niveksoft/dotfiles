#!/bin/sh

# A script to setup wayland on a new archinstall for Gnome

# Any command that fails will stop the script.
# Each command executed is printed to the console to trace the execution.
set -ex

if [ "$EUID" -ne 0 ]; then
  echo "Please run this script with sudo."
  exit 1
fi

# Enable nvidia services as their needed for the NVIDIA driver to use Wayland
systemctl enable nvidia-suspend
systemctl enable nvidia-resume
systemctl enable nvidia-hibernate

directory="/etc/modprobe.d"

if [ -f "$directory/nvidia.conf" ]; then
  mv "$directory/nvidia.conf" "$directory/nvidia.conf.bak"
fi

echo 'options nvidia "NVreg_PreserveVideoMemoryAllocations=1"' > "$directory/nvidia.conf"
