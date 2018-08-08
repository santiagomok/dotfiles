# ------------------------------------------------------------------------------ 
# File: env.sh
# ------------------------------------------------------------------------------ 

# ------------------------------------------------------------------------------ 

# Color Table
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
WHITE='\033[0;97m'
LIGHT_BLUE='\033[0;94m'
LIGHT_BLUE_BG='\033[0;104m'
NC='\033[0m'

# Trim workdir path (\w) in PS1 to last 'n' path  dir
#PROMPT_DIRTRIM=3
export PS1="${GREEN}\h${NC}: ${BLUE}\w${NC}\n\$ "
#if [ "$PLATFORM" = Linux ]; then
#  PS1="\[\e[1;38m\]\u\[\e[1;34m\]@\[\e[1;31m\]\h\[\e[1;30m\]:"
#  PS1="$PS1\[\e[0;38m\]\w\[\e[1;35m\]> \[\e[0m\]"
#else
#  ### git-prompt
#  __git_ps1() { :;}
#  if [ -e ~/.git-prompt.sh ]; then
#    source ~/.git-prompt.sh
#  fi
#  PS1='\[\e[34m\]\u\[\e[1;32m\]@\[\e[0;33m\]\h\[\e[35m\]:\[\e[m\]\w\[\e[1;30m\]$(__git_ps1)\[\e[1;31m\]> \[\e[0m\]'
#fi

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
