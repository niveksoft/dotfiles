#!/bin/bash
set -e

write() {
    dconf write "$1" "$2"
}

# GNOME Desktop Interface
write /org/gnome/desktop/interface/accent-color "'blue'"
write /org/gnome/desktop/interface/clock-format "'12h'"
write /org/gnome/desktop/interface/color-scheme "'prefer-dark'"
write /org/gnome/desktop/interface/cursor-theme "'Banana'"
write /org/gnome/desktop/interface/enable-hot-corners "false"
write /org/gnome/desktop/interface/gtk-theme "'Yaru-blue-dark'"
write /org/gnome/desktop/interface/icon-theme "'Yaru-blue-dark'"
write /org/gnome/desktop/interface/show-battery-percentage "true"

# Session
write /org/gnome/desktop/session/idle-delay "uint32 600"

# Fonts
write /org/gnome/desktop/interface/font-name "'Ubuntu 11'"
write /org/gnome/desktop/interface/document-font-name "'Ubuntu 11'"
write /org/gnome/desktop/interface/monospace-font-name "'Ubuntu Mono 10'"

# File Chooser
write /org/gtk/settings/file-chooser/clock-format "'12h'"

# Date and Time
write /org/gnome/desktop/datetime/automatic-timezone "true"

# Background
write /org/gnome/desktop/background/picture-uri "'file:///usr/share/backgrounds/gnome/pixels-d.jxl'"
write /org/gnome/desktop/background/picture-uri-dark "'file:///usr/share/backgrounds/gnome/pixels-l.jxl'"
write /org/gnome/desktop/background/primary-color "'#967864'"

# Screensaver
write /org/gnome/desktop/screensaver/picture-uri "'file:///usr/share/backgrounds/gnome/pixels-l.jxl'"
write /org/gnome/desktop/screensaver/primary-color "'#967864'"

# Mutter
write /org/gnome/mutter/overlay-key "'Super_R'"
write /org/gnome/mutter/dynamic-workspaces "false"
write /org/gnome/mutter/edge-tiling "false"
write /org/gnome/mutter/experimental-features "['variable-refresh-rate']"
write /org/gnome/mutter/workspaces-only-on-primary "true"

# Window Manager Preferences
write /org/gnome/desktop/wm/preferences/num-workspaces "6"

# Window Manager Keybindings
write /org/gnome/desktop/wm/keybindings/activate-window-menu "['<Super>Enter']"
write /org/gnome/desktop/wm/keybindings/begin-move "@as []"
write /org/gnome/desktop/wm/keybindings/begin-resize "@as []"
write /org/gnome/desktop/wm/keybindings/close "['<Super>q']"
write /org/gnome/desktop/wm/keybindings/maximize "@as []"
write /org/gnome/desktop/wm/keybindings/move-to-workspace-1 "['<Shift><Super>1']"
write /org/gnome/desktop/wm/keybindings/move-to-workspace-2 "['<Shift><Super>2']"
write /org/gnome/desktop/wm/keybindings/move-to-workspace-3 "['<Shift><Super>3']"
write /org/gnome/desktop/wm/keybindings/move-to-workspace-4 "['<Shift><Super>4']"
write /org/gnome/desktop/wm/keybindings/move-to-workspace-5 "['<Shift><Super>5']"
write /org/gnome/desktop/wm/keybindings/move-to-workspace-6 "['<Shift><Super>6']"
write /org/gnome/desktop/wm/keybindings/move-to-workspace-7 "['<Shift><Super>7']"
write /org/gnome/desktop/wm/keybindings/move-to-workspace-8 "['<Shift><Super>8']"
write /org/gnome/desktop/wm/keybindings/move-to-workspace-9 "['<Shift><Super>9']"
write /org/gnome/desktop/wm/keybindings/move-to-workspace-left "@as []"
write /org/gnome/desktop/wm/keybindings/move-to-workspace-right "@as []"
write /org/gnome/desktop/wm/keybindings/switch-to-workspace-1 "['<Super>1']"
write /org/gnome/desktop/wm/keybindings/switch-to-workspace-2 "['<Super>2']"
write /org/gnome/desktop/wm/keybindings/switch-to-workspace-3 "['<Super>3']"
write /org/gnome/desktop/wm/keybindings/switch-to-workspace-4 "['<Super>4']"
write /org/gnome/desktop/wm/keybindings/switch-to-workspace-5 "['<Super>5']"
write /org/gnome/desktop/wm/keybindings/switch-to-workspace-6 "['<Super>6']"
write /org/gnome/desktop/wm/keybindings/switch-to-workspace-7 "['<Super>7']"
write /org/gnome/desktop/wm/keybindings/switch-to-workspace-8 "['<Super>8']"
write /org/gnome/desktop/wm/keybindings/switch-to-workspace-9 "['<Super>9']"
write /org/gnome/desktop/wm/keybindings/switch-to-workspace-last "@as []"
write /org/gnome/desktop/wm/keybindings/switch-to-workspace-left "['<Super>Left']"
write /org/gnome/desktop/wm/keybindings/switch-to-workspace-right "['<Super>Right']"
write /org/gnome/desktop/wm/keybindings/toggle-fullscreen "@as []"
write /org/gnome/desktop/wm/keybindings/toggle-maximized "@as []"
write /org/gnome/desktop/wm/keybindings/unmaximize "@as []"

# Mutter Wayland Keybindings
write /org/gnome/mutter/wayland/keybindings/restore-shortcuts "@as []"

# Shell Keybindings
write /org/gnome/shell/keybindings/focus-active-notification "@as []"
write /org/gnome/shell/keybindings/toggle-application-view "@as []"
write /org/gnome/shell/keybindings/toggle-overview "@as []"
write /org/gnome/shell/keybindings/toggle-quick-settings "@as []"

# Power
write /org/gnome/settings-daemon/plugins/power/ambient-enabled "false"

# Media Keys
write /org/gnome/settings-daemon/plugins/media-keys/logout "@as []"
write /org/gnome/settings-daemon/plugins/media-keys/screensaver "@as []"

# Terminal Application
write /org/gnome/applications/terminal/exec "'wezterm'"
write /org/gnome/applications/terminal/exec-arg "''"

# Custom Keybindings
write /org/gnome/settings-daemon/plugins/media-keys/home "['<Super>f']"
write /org/gnome/settings-daemon/plugins/media-keys/magnifier "@as []"
write /org/gnome/settings-daemon/plugins/media-keys/magnifier-zoom-in "@as []"
write /org/gnome/settings-daemon/plugins/media-keys/magnifier-zoom-out "@as []"
write /org/gnome/settings-daemon/plugins/media-keys/screenreader "@as []"
write /org/gnome/settings-daemon/plugins/media-keys/www "['<Super>b']"

write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/binding "'<Super>t'"
write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/command "'wezterm'"
write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/name "'Wezterm'"
write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings "@as ['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']"

# Shell Extensions
write /org/gnome/shell/disable-user-extensions "false"
write /org/gnome/shell/disabled-extensions "@as []"
write /org/gnome/shell/enabled-extensions "['blur-my-shell@aunetx', 'dash-to-dock@micxgx.gmail.com', 'just-perfection-desktop@just-perfection', 'space-bar@luchrioh', 'user-theme@gnome-shell-extensions.gcampax.github.com', 'pop-shell@system76.com']"

# Blur my Shell Extension Settings
write /org/gnome/shell/extensions/blur-my-shell/overview/blur "false"
write /org/gnome/shell/extensions/blur-my-shell/panel/blur "false"
write /org/gnome/shell/extensions/blur-my-shell/dash-to-dock/blur "false"

# Dash to Dock Extension Settings
write /org/gnome/shell/extensions/dash-to-dock/apply-custom-theme "false"
write /org/gnome/shell/extensions/dash-to-dock/autohide "true"
write /org/gnome/shell/extensions/dash-to-dock/custom-theme-shrink "true"
write /org/gnome/shell/extensions/dash-to-dock/dash-max-icon-size "36"
write /org/gnome/shell/extensions/dash-to-dock/disable-overview-on-startup "true"
write /org/gnome/shell/extensions/dash-to-dock/dock-position "'LEFT'"
write /org/gnome/shell/extensions/dash-to-dock/extend-height "false"
write /org/gnome/shell/extensions/dash-to-dock/hot-keys "false"
write /org/gnome/shell/extensions/dash-to-dock/intellihide "false"
write /org/gnome/shell/extensions/dash-to-dock/show-dock-urgent-notify "false"
write /org/gnome/shell/extensions/dash-to-dock/show-icons-emblems "false"
write /org/gnome/shell/extensions/dash-to-dock/show-mount-network "true"
write /org/gnome/shell/extensions/dash-to-dock/show-show-apps-button "false"
write /org/gnome/shell/extensions/dash-to-dock/show-windows-preview "false"
write /org/gnome/shell/extensions/dash-to-dock/workspace-agnostic-urgent-windows "false"

# Space Bar Extension Settings
write /org/gnome/shell/extensions/space-bar/shortcuts/enable-activate-workspace-shortcuts "true"
write /org/gnome/shell/extensions/space-bar/shortcuts/enable-move-to-workspace-shortcuts "true"

# Just Perfection Extension Settings
write /org/gnome/shell/extensions/just-perfection/theme "true"
write /org/gnome/shell/extensions/just-perfection/workspace-popup "false"

# User Theme Extension Settings
write /org/gnome/shell/extensions/user-theme/name "'Yaru-blue-dark'"

# Pop Shell Extension Settings
write /org/gnome/shell/extensions/pop-shell/active-hint "true"
write /org/gnome/shell/extensions/pop-shell/active-hint-border-radius "uint32 2"
write /org/gnome/shell/extensions/pop-shell/activate-launcher "['<Super>d']"
write /org/gnome/shell/extensions/pop-shell/fullscreen-launcher "true"
write /org/gnome/shell/extensions/pop-shell/gap-inner "uint32 1"
write /org/gnome/shell/extensions/pop-shell/gap-outer "uint32 1"
write /org/gnome/shell/extensions/pop-shell/hint-color-rgba "'rgb(0, 166, 239)'"
write /org/gnome/shell/extensions/pop-shell/pop-monitor-down "@as []"
write /org/gnome/shell/extensions/pop-shell/pop-monitor-left "@as []"
write /org/gnome/shell/extensions/pop-shell/pop-monitor-right "@as []"
write /org/gnome/shell/extensions/pop-shell/pop-monitor-up "@as []"
write /org/gnome/shell/extensions/pop-shell/pop-workspace-down "@as []"
write /org/gnome/shell/extensions/pop-shell/pop-workspace-up "@as []"
write /org/gnome/shell/extensions/pop-shell/show-title "true"
write /org/gnome/shell/extensions/pop-shell/tile-by-default "true"
write /org/gnome/shell/extensions/pop-shell/tile-enter "['<Super>e']"

# Additional Window Manager Keybindings
write /org/gnome/desktop/wm/keybindings/minimize "@as []"
