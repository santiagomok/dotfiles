# ------------------------------------------------------------------------------ 
# File: env.sh
# ------------------------------------------------------------------------------ 

# ------------------------------------------------------------------------------ 

# Trim workdir path (\w) in PS1 to last 'n' path  dir
PROMPT_DIRTRIM=3
export PS1="\h:\w\$ "

function title {
	export PS1
	echo -en "\033]2;$1\007"
}

# To fix terminal resize issues while command-line apps are running
# http://bugs.gentoo.org/48632
shopt -s checkwinsize

shopt -s nocaseglob # case-insensitive globbing

shopt -s histappend # append to bash history file, rather than overwrite

export HISTSIZE=1000
export HISTFILESIZE=2000
export HISTTIMEFORMAT="%Y/%m/%d %H:%M:%S:"
