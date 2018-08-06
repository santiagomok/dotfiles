# ------------------------------------------------------------------------------ 
# File: export.sh
# ------------------------------------------------------------------------------ 

# ------------------------------------------------------------------------------ 

export PATH="${HOME}/bin:${HOME}/.local/bin:/usr/local/bin:/usr/local/sbin:${ZSH}/bin:$PATH"
export MANPATH="/usr/local/man:/usr/local/mysql/man:/usr/local/git/man:$MANPATH"

# ------------------------------------------------------------------------------ 

# EDITOR 
export EDITOR=vim
export VISUAL=$EDITOR
export TERM=xterm-256color
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# ------------------------------------------------------------------------------ 

# GOLANG
export GOPATH=$HOME/Code/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# ------------------------------------------------------------------------------ 

# FZF
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND='fd --type f --type d --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse-list --border'
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview' --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort' --header 'Press CTRL-Y to copy command into clipboard' --border"
if [ -x ${HOME}/.vim/bundle/fzf.vim/bin/preview.rb ]; then
    export FZF_CTRL_T_OPTS="--preview '${HOME}/.vim/bundle/fzf.vim/bin/preview.rb {} | head -200'"
fi

# ------------------------------------------------------------------------------ 

# RUST
export CARGO_HOME="${HOME}/.local"
export RUSTUP_HOME="${HOME}/.local"

