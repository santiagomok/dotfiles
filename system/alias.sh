# ------------------------------------------------------------------------------ 
# File: alias.sh
# ------------------------------------------------------------------------------ 

# ------------------------------------------------------------------------------ 

# Colored ls
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    alias ll="ls --color=always -alh"
elif [ "$PLATFORM" = Darwin ]; then
    alias ls='ls -G'
    alias ll="ls -G -alh"
fi

# SHELL
alias passwd="yppasswd"
alias lsd="ls -l  | grep -e '^d'"
alias lsl="ls -al | grep -e '->'"
alias lsh="ls -ald .*"
alias sl="ls"
alias grep="grep -in --color=auto"
alias datemd="date +%b%d"
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"
alias hc="history -c"

# ------------------------------------------------------------------------------ 

# PATH
# Navigating paths ., .., ..., ....
alias ..="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."
# Print each PATH entry on a separate line
alias path="echo ${PATH} | tr -s ':' '\n' | uniq" 
alias manpath="echo ${MANPATH} | tr -s ':' '\n' | uniq"

# ------------------------------------------------------------------------------ 

# TMUX 
alias tmux="tmux -2"
alias tm="tmux -2 a"
alias tmc="tmux -2 new -s"
alias tmr="tmux -2 a -t"
alias tmk="tmux kill-session -t"
alias tmls="tmux ls"

# TOOL
alias gfs="gnome-open"
alias g=git
alias l=less
alias py="python3"
alias vi="vim"

# List all files larger than a given size (e.g. llfs +10k)
alias llfs='find_by_size(){ find . -type f -size "$1" -exec ls --color --classify --human-readable -l {} \; ; }; find_by_size'

alias gll='fzf_git_log'

# ------------------------------------------------------------------------------ 

# SSH
# Pipe my public key to my clipboard.
alias cb="xclip"
[ "$PLATFORM" = Darwin ] && alias cb="pbcopy"
alias pubkey="more ~/.ssh/id_rsa.pub | cb | echo '=> Public key copied to pasteboard.'"

# ------------------------------------------------------------------------------ 

# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
#if $(gls &>/dev/null)
#then
#  alias ls="gls -F --color"
#  alias l="gls -lAh --color"
#  alias ll="gls -l --color"
#  alias la='gls -A --color'
#fi

# ------------------------------------------------------------------------------ 

# HT+TB Check
# /etc/snmp/scripts/htcheck.sh
# /etc/snmp/scripts/turbocheck.sh
