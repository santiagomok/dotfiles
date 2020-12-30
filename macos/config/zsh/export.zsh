# ------------------------------------------------------------------------------ 
# File: export.zsh
# ------------------------------------------------------------------------------ 

# ------------------------------------------------------------------------------ 

export LOCALPATH="$HOME/.local"
export PATH="$LOCALPATH/bin:/usr/local/bin:/usr/local/sbin:$PATH"
export MANPATH="LOCALPATH/share/man:$MANPATH"

# ------------------------------------------------------------------------------ 

# EDITOR 
export EDITOR=nvim
export VISUAL=$EDITOR
export TERM=xterm-256color
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# ------------------------------------------------------------------------------ 

# GO-LANG
export GOPATH="$LOCALPATH/go"
export GOROOT="$(brew --prefix)/opt/go/libexec"
export PATH="$PATH:$GOROOT/bin:$GOPATH"

# Rust
export RUSTUP_HOME="$LOCALPATH"
export CARGO_HOME="$LOCALPATH"
export PATH="$PATH:$CARGO_HOME/bin"

#Qt
export PATH="$PATH:$(brew --prefix)/opt/qt/bin"

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

