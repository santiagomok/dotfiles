# ------------------------------------------------------------------------------ 
# File: export.sh
# ------------------------------------------------------------------------------ 

# ------------------------------------------------------------------------------ 
export HL="${HOME}/.local"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_HOME="$HL/share"

export PATH="$HL/bin:/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="${HOME}/.yarn/bin:${HOME}/.config/yarn/global/node_modules/.bin:$PATH"
export MANPATH="$HL/share/man:/usr/local/man:/usr/local/mysql/man:/usr/local/git/man:$MANPATH"

# ------------------------------------------------------------------------------ 

# EDITOR 
export EDITOR=nvim
export VISUAL=$EDITOR
export TERM=xterm-256color
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# ------------------------------------------------------------------------------ 

# GOLANG
if [ "$PLATFORM" = Linux ]; then
    export GOPATH="$HL/lib/go/packages"
    export GOROOT="$HL/go"
fi
export PATH="$PATH:$GOROOT/bin:${GOPATH}"

# RUST
export CARGO_HOME="$HL"
export RUSTUP_HOME="$HL"

# ------------------------------------------------------------------------------ 

# FZF
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
export FZF_DEFAULT_COMMAND='fd --type f --type d --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse-list --border'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

if [ -x ${HOME}/.vim/plugged/fzf.vim/bin/preview.sh ]; then
    export FZF_CTRL_T_OPTS="--preview '${HOME}/.vim/plugged/fzf.vim/bin/preview.sh {} | head -200'"
fi
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview' --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort' --header 'Press CTRL-Y to copy command into clipboard' --border"

# ------------------------------------------------------------------------------ 

