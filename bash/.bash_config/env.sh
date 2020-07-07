# ------------------------------------------------------------------------------ 
# File: env.sh
# ------------------------------------------------------------------------------ 

# ------------------------------------------------------------------------------ 

# Color Table
OB='\['
CB='\]'
RED="${OB}\033[0;31m${CB}"
GREEN="${OB}\033[0;32m${CB}"
YELLOW="${OB}\033[0;33m${CB}"
BLUE="${OB}\033[0;34m${CB}"
WHITE="${OB}\033[0;97m${CB}"
LIGHT_BLUE="${OB}\033[1;94m${CB}"
LIGHT_CYAN="${OB}\033[0;96m${CB}"
NC="${OB}\033[0m${CB}"
rarrow='→' # 2192

set TERM=xterm-256color

# Trim workdir path (\w) in PS1 to last 'n' path  dir
if [ "$PLATFORM" = Darwin ]; then
    PS1="${WHITE}\h${NC} | ${LIGHT_BLUE}\w${NC}\n"
    if [ "$(id -u)" = "0" ]; then
        PS1+="${RED}\u${NC} | "
    fi

    #if [ -f /usr/local/etc/bash_completion.d/git-prompt.sh ]; then
      # GIT_PROMPT_PATH="/usr/local/etc/bash_completion.d/git-prompt.sh"
    # elif [ -f /etc/bash_completion.d/git-prompt ]; then
      # GIT_PROMPT_PATH="/etc/bash_completion.d/git-prompt"
    # else
      # GIT_PROMPT_PATH="/usr/share/git-core/contrib/completion/git-prompt.sh"
    # fi
    # GIT_PS1_SHOWUPSTREAM="auto"
    # GIT_PS1_SHOWSTASHSTATE=1
    # . $GIT_PROMPT_PATH
    #PS1+="\$(__git_ps1) "

    PS1+="${rarrow} "
    export PS1
else
    PS1="${WHITE}\h | \w${NC}\n"
    PS1+="${rarrow} "
fi

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

#function title {
#	export PS1
#	echo -en "\033]2;$1\007"
#}

# Powerline
#python_repository_root="/usr/local/lib/python3.6/dist-packages"
#if [[ -r $python_repository_root/powerline/bindings/bash/powerline.sh ]]; then
#    . $python_repository_root/powerline/bindings/bash/powerline.sh
#fi

# Bash completion
if [ "$PLATFORM" = Darwin ]; then
    [ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion 
elif [ "$PLATFORM" = Linux ]; then
    if [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    elif [ -f ${HOME}/.local/etc/profile.d/bash_completion.sh ]; then
        . ${HOME}/.local/etc/profile.d/bash_completion.sh
    fi
    
    if [ -f /etc/redhat-release ]; then
        shopt -s autocd # cd when typing a directory name
        shopt -s dirspell # fix directory name typos
        shopt -s cdspell # auto-fix directory name typos
        # shopt -s direxpand # auto-expand directory globs
    fi
fi

shopt -s checkwinsize # auto resize window size
shopt -s nocaseglob # case-insensitive globbing
#shopt -s globstar # **/*.txt globstar recursive pattern in file and directory expansions
shopt -s histappend # append to bash history file, rather than overwrite

export HISTCONTROL='erasedups:ignoreboth'
export HISTSIZE=5000
export HISTFILESIZE=5000
export HISTTIMEFORMAT="%Y/%m/%d %H:%M:%S:"
bind Space:magic-space # !!<SPACE> expand to last command
