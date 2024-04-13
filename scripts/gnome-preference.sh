#!/bin/sh

# A script to setup my gnome preferences using dconf

# Any command that fails will stop the script.
# Each command executed is printed to the console to trace the execution.
set -ex

### Sound ###

# Sounds
dconf write /org/gnome/desktop/sound/event-sounds false

### Power ###

# Power Saving
dconf write /org/gnome/desktop/session/idle-delay "uint32 900"
dconf write /org/gnome/settings-daemon/plugins/power/sleep-inactive-ac-timeout 1800

# General
dconf write /org/gnome/settings-daemon/plugins/power/power-button-action "'suspend'"

### Multitasking ###

# Workspaces
dconf write /org/gnome/mutter/dynamic-workspaces false

# Multi-Monitor
dconf write /org/gnome/mutter/workspaces-only-on-primary true

### Appearance ###

# Style
dconf write /org/gnome/desktop/interface/color-scheme "'prefer-dark'"

# Background Picture
dconf write /org/gnome/desktop/background/picture-uri "'file:///usr/share/backgrounds/gnome/neogeo-l.jxl'"
dconf write /org/gnome/desktop/background/picture-uri-dark "'file:///usr/share/backgrounds/gnome/neogeo-d.jxl'"
dconf write /org/gnome/desktop/background/primary-color "'#e18477'"
dconf write /org/gnome/desktop/screensaver/picture-uri "'file:///usr/share/backgrounds/gnome/neogeo-l.jxl'"
dconf write /org/gnome/desktop/screensaver/primary-color "'#e18477'"

### Keyboard ###

# Shortcuts

## Accessibility
dconf write /org/gnome/settings-daemon/plugins/media-keys/screenreader "@as []"
dconf write /org/gnome/settings-daemon/plugins/media-keys/magnifier "@as []"
dconf write /org/gnome/settings-daemon/plugins/media-keys/magnifier-zoom-in "@as []"
dconf write /org/gnome/settings-daemon/plugins/media-keys/magnifier-zoom-out "@as []"

## Launchers
dconf write /org/gnome/settings-daemon/plugins/media-keys/home "@as ['<Super>f']"
dconf write /org/gnome/settings-daemon/plugins/media-keys/calculator "@as []"
dconf write /org/gnome/settings-daemon/plugins/media-keys/email "@as []"
dconf write /org/gnome/settings-daemon/plugins/media-keys/help "@as []"
dconf write /org/gnome/settings-daemon/plugins/media-keys/www "@as ['<Super>b']"
dconf write /org/gnome/settings-daemon/plugins/media-keys/search "@as []"
dconf write /org/gnome/settings-daemon/plugins/media-keys/control-center "@as []"

## Move, resize, and swap windows
dconf write /org/gnome/shell/extensions/pop-shell/tile-enter "@as ['<Super>e']"

## Navigate applications and windows
dconf write /org/gnome/shell/extensions/pop-shell/activate-launcher "@as ['<Super>d']"

## Navigation
dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-last "@as []"
dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-1 "@as ['<Shift><Super>1']"
dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-2 "@as ['<Shift><Super>2']"
dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-3 "@as ['<Shift><Super>3']"
dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-4 "@as ['<Shift><Super>4']"
dconf write /org/gnome/shell/keybindings/show-screenshot-ui "@as []"
dconf write /org/gnome/desktop/wm/keybindings/switch-applications "@as []"
dconf write /org/gnome/desktop/wm/keybindings/switch-applications-backward "@as []"
dconf write /org/gnome/desktop/wm/keybindings/switch-panels "@as []"
dconf write /org/gnome/desktop/wm/keybindings/switch-panels-backward "@as []"
dconf write /org/gnome/desktop/wm/keybindings/cycle-panels "@as []"
dconf write /org/gnome/desktop/wm/keybindings/cycle-panels-backward "@as []"
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-last "@as []"
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-1 "@as ['<Super>1']"
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-2 "@as ['<Super>2']"
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-3 "@as ['<Super>3']"
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-4 "@as ['<Super>4']"
dconf write /org/gnome/desktop/wm/keybindings/cycle-windows "@as []"
dconf write /org/gnome/desktop/wm/keybindings/cycle-windows-backward "@as []"
dconf write /org/gnome/desktop/wm/keybindings/cycle-group "@as []"
dconf write /org/gnome/desktop/wm/keybindings/cycle-group-backward "@as []"
dconf write /org/gnome/desktop/wm/keybindings/switch-group "@as []"
dconf write /org/gnome/desktop/wm/keybindings/switch-group-backward "@as []"

## Screenshots
dconf write /org/gnome/shell/keybindings/show-screenshot-ui "@as ['<Shift><Super>4']"
dconf write /org/gnome/shell/keybindings/show-screen-recording-ui "@as ['<Shift><Super>5']"

## System
dconf write /org/gnome/settings-daemon/plugins/media-keys/screensaver "@as []"
dconf write /org/gnome/settings-daemon/plugins/media-keys/logout "@as []"

## Windows
dconf write /org/gnome/desktop/wm/keybindings/close "@as ['<Super>q']"
dconf write /org/gnome/desktop/wm/keybindings/close "@as ['<Super>q']"
dconf write /org/gnome/desktop/wm/keybindings/begin-move "@as []"
dconf write /org/gnome/desktop/wm/keybindings/begin-resize "@as []"
dconf write /org/gnome/mutter/keybindings/toggle-tiled-left "@as []"
dconf write /org/gnome/mutter/keybindings/toggle-tiled-right "@as []"

## Custom
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/binding "'<Super>t'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/command "'wezterm'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/name "'Wezterm'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings "@as ['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']"

### Extensions ###
dconf write /org/gnome/shell/disable-user-extensions false

dconf write /org/gnome/shell/enabled-extensions "@as ['system-monitor@gnome-shell-extensions.gcampax.github.com', 'user-theme@gnome-shell-extensions.gcampax.github.com', 'pop-shell@system76.com', 'drive-menu@gnome-shell-extensions.gcampax.github.com', 'dash-to-dock@micxgx.gmail.com']"

# Pop Shell
dconf write /org/gnome/shell/extensions/pop-shell/tile-by-default true
dconf write /org/gnome/shell/extensions/pop-shell/activate-hint true
dconf write /org/gnome/shell/extensions/pop-shell/activate-hint-border-radius 5
dconf write /org/gnome/shell/extensions/pop-shell/fullscreen-launcher true
dconf write /org/gnome/shell/extensions/pop-shell/hint-color-rgba "'rgb(124, 189, 232)'"
dconf write /org/gnome/shell/extensions/pop-shell/gap-outer "uint32 3"
dconf write /org/gnome/shell/extensions/pop-shell/gap-inner "uint32 3"
dconf write /org/gnome/shell/extensions/pop-shell/fullscreen-launcher true

# Dash to Dock
dconf write /org/gnome/shell/extensions/dash-to-dock/dash-max-icon-size 40
dconf write /org/gnome/shell/extensions/dash-to-dock/autohide false
dconf write /org/gnome/shell/extensions/dash-to-dock/intellihide false
dconf write /org/gnome/shell/extensions/dash-to-dock/hot-keys false
dconf write /org/gnome/shell/extensions/dash-to-dock/custom-theme-shrink true
dconf write /org/gnome/shell/extensions/dash-to-dock/disable-overview-on-startup true
dconf write /org/gnome/shell/extensions/dash-to-dock/apply-custom-theme true
