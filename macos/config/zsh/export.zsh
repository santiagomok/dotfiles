# ------------------------------------------------------------------------------ 
# File: export.zsh
# ------------------------------------------------------------------------------ 

# ------------------------------------------------------------------------------ 

# XDG_CONFIG_HOME (linux to macOS)
# https://stackoverflow.com/questions/3373948/equivalents-of-xdg-config-home-and-xdg-data-home-on-mac-os-x
export HOME_LOCAL="$HOME/.local"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_HOME="$HOME_LOCAL/share"

export PATH="$HOME_LOCAL/bin:/opt/homebrew/bin:$PATH"
export MANPATH="$HOME_LOCAL/share/man:`manpath`"

# ------------------------------------------------------------------------------ 

# EDITOR 
export EDITOR=nvim
export VISUAL=$EDITOR
# export TERM=xterm-256color
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# ------------------------------------------------------------------------------ 

# Go
export GOPATH="$HOME_LOCAL"

# Rust
export RUSTUP_HOME="$HOME_LOCAL"
export CARGO_HOME="$HOME_LOCAL"

# Qt
export PATH="$PATH:$(brew --prefix)/opt/qt/bin"
export LDFLAGS="-L/usr/local/opt/qt/lib"
export CPPFLAGS="-I/usr/local/opt/qt/include"
export PKG_CONFIG_PATH="/usr/local/opt/qt/lib/pkgconfig"


# ------------------------------------------------------------------------------ 

# FZF
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
export FZF_DEFAULT_COMMAND='fd --type f --type d --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse-list --border'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
if [ -x ${HOME}/.vim/bundle/fzf.vim/bin/preview.sh ]; then
    export FZF_CTRL_T_OPTS="--preview '${HOME}/.vim/bundle/fzf.vim/bin/preview.sh {} | head -200'"
fi
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview' --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort' --header 'Press CTRL-Y to copy command into clipboard' --border"

# ------------------------------------------------------------------------------ 

