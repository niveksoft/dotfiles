#!/usr/bin/env bash
STOW_OPTIONS=("-nv" "--restow" "-t" "$HOME")

PACKAGES=("bash" "ghostty" "git" "nvim" "paru" "ssh" "starship" "tmux" "xdg" "zsh")

if [[ "$#" -eq 1 ]]; then
  if [[ "$1" == "--apply" ]]; then
    STOW_OPTIONS=("-v" "--restow" "-t" "$HOME")
  fi
fi

if ! command -v stow &>/dev/null; then
  echo "$(which stow)"
  exit 1
fi

for package in "${PACKAGES[@]}"; do
  echo "PACKAGE: $package"
  stow "${STOW_OPTIONS[@]}" "$package"
  echo ""
done
