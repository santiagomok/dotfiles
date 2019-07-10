# ------------------------------------------------------------------------------ 
# File: export.zsh
# ------------------------------------------------------------------------------ 

# ------------------------------------------------------------------------------ 

export PATH="${HOME}/.local/bin:/usr/local/bin:/usr/local/sbin:$PATH"
export MANPATH="${HOME}/.local/share/man:/usr/local/man:/usr/local/mysql/man:/usr/local/git/man:$MANPATH"

# ------------------------------------------------------------------------------ 

# EDITOR 
export EDITOR=vim
export VISUAL=$EDITOR
export TERM=xterm-256color
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# ------------------------------------------------------------------------------ 

# GOLANG
export GOPATH=${HOME}/Dev/go
export GOROOT=/usr/local/opt/go/libexec
export PATH="$PATH:$GOROOT/bin:${GOPATH}"

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

