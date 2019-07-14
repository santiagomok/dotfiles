# ------------------------------------------------------------------------------ 
# File: alias.zsh
# ------------------------------------------------------------------------------ 

# ------------------------------------------------------------------------------ 
# SHELL
alias ll="ls -alh"
alias lsd="ls -alF  | grep -e '^d'"
alias lsl="ls -alF | grep -e '->'"
alias lsh="ls -ald .*"
alias grep="grep --color=auto"
alias datemd="date +%b%d"
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"
alias l="less"
alias py="python3"

# ------------------------------------------------------------------------------ 
# PATH
alias fcd="_fzf_change_dir"
alias mcd="_mcd"
alias bcd="_bcd"
alias ..="cd .."
alias ..2="../.."
alias ..3="../../.."

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
alias ftm="_fzf_switch_tmux_session"

# GIT
alias g="git"
alias ga="git add"
alias gs="git status"
alias gr="git remote -v"
alias gll='_fzf_git_log'

# VIM
alias vi="vim"
alias vi_plugin_install="source ${HOME}/github.com/santiagomok/dotfiles/install/vim.sh"
alias vrg="_fzf_grep_edit_file"
alias v0="vim -u NONE"
alias vdebug="vim_term_debug"

# RIPGREP
alias rg="rg --line-number --no-heading --ignore-case"
alias rgcode="rg -i -n -t{c,cpp,make,java,py,tcl,json,perl,protobuf,sh,swig,xml}"

# CMAKE
alias export_cc_var="export CC=`which gcc`; export CXX=`which g++`"

# List all files larger than a given size (e.g. llfs +10k)
alias llfs='find_by_size(){ find . -type f -size "$1" -exec ls --color --classify --human-readable -l {} \; ; }; find_by_size'

# download audio only
alias ytda="youtube-dl -i --extract-audio --audio-format mp3"
alias ytdaf="youtube-dl -i --extract-audio --audio-format mp3 -a"
# ------------------------------------------------------------------------------ 

# SSH
# Pipe my public key to my clipboard.
alias cb="pbcopy"
alias pubkey="more ~/.ssh/id_rsa.pub | cb | echo '=> Public key copied to pasteboard.'"

# ------------------------------------------------------------------------------ 

