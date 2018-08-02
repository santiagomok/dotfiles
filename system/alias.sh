# ------------------------------------------------------------------------------ 
# File: alias.sh
# ------------------------------------------------------------------------------ 

# ------------------------------------------------------------------------------ 

# SHELL
alias passwd="yppasswd"
alias ls="ls --color=auto"
alias ll="ls -alh"
alias ldir="ls -l | grep \"^d\""
alias sl="ls"
alias grep="grep -in --color=auto"
alias datemd="date +%b%d"
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"

# ------------------------------------------------------------------------------ 

# PATH
# Navigating paths ., .., ..., ....
alias .="cd .."
alias ..="cd ../.."
alias ...="cd ../../.."
alias ....="cd ../../../.."
# Print each PATH entry on a separate line
alias path="echo -e ${PATH//:/\\n}"
alias dot="cd ~/dotfiles/sh"
alias lwd="cd $lwd"
alias wd="cd $wd"

# ------------------------------------------------------------------------------ 

# TMUX 
alias tm="tmux a"
alias tmc="tmux new -s"
alias tmr="tmux a -t"
alias tmk="tmux kill-session -t"
alias tmls="tmux ls"

# TOOL
alias gfs="gnome-open"
alias py="python3"
alias v="vim"
alias vi="vim"

# ------------------------------------------------------------------------------ 

# SSH
# Pipe my public key to my clipboard.
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"

# ------------------------------------------------------------------------------ 

# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
if $(gls &>/dev/null)
then
  alias ls="gls -F --color"
  alias l="gls -lAh --color"
  alias ll="gls -l --color"
  alias la='gls -A --color'
fi

# ------------------------------------------------------------------------------ 

# HT+TB Check
# /etc/snmp/scripts/htcheck.sh
# /etc/snmp/scripts/turbocheck.sh
