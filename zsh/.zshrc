# Install modules without git
# zstyle ':zim:zmodule' use 'degit'

ZIM_HOME=$HOME/.cache/zim

# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
      https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
fi

# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi

# Fixes issue with fzf bindings getting overriden by vi-mode
function zvm_after_init() {
  fzf_bindings="/usr/share/fzf/key-bindings.zsh"
  if [ -f "$fzf_bindings" ]; then
    source "$fzf_bindings"
  fi
}

source ${ZIM_HOME}/init.zsh

alias yayf="yay -Slq | fzf --multi --preview 'yay -Sii {1}' --preview-window=down:75% | xargs -ro yay -Sope"

open() {
  xdg-open "$@" >/dev/null 2>&1 &
}
