# ------------------------------------------------------------------------------ 
# File: env.sh
# ------------------------------------------------------------------------------ 

# ------------------------------------------------------------------------------ 

# Trim workdir path (\w) in PS1 to last 'n' path  dir
PROMPT_DIRTRIM=3
export BASEPS1="\h:\w\$ "
export PS1="\[\033]2;\$PERFORCE_LABEL (\$ACDS_DEST_ROOT)\007\]$BASEPS1"
export EDITOR=vim
export VISUAL=$EDITOR
export TERM=xterm-256color

function title {
	export PS1
	echo -en "\033]2;$1\007"
}

# To fix terminal resize issues while command-line apps are running
# http://bugs.gentoo.org/48632
shopt -s checkwinsize

shopt -s nocaseglob # case-insensitive globbing

shopt -s histappend # append to bash history file, rather than overwrite
