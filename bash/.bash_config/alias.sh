# ------------------------------------------------------------------------------ 
# File: alias.sh
# ------------------------------------------------------------------------------ 

# ------------------------------------------------------------------------------ 

# Colored ls
# if [ -x /usr/bin/dircolors ]; then
    # eval "`dircolors -b`"
    # alias ls='ls --color=auto'
    # alias ll="ls --color=always -alh"
# fi


# RC editing
alias brc="v ${HOME}/.bashrc"
alias tmrc="v ${HOME}/.tmux.conf" 
alias vrc="v ${XDG_CONFIG_HOME}/nvim/plug.vim" 

# ls -> exa
alias l='exa'
alias ls='exa'
alias l1='exa -1'
alias ll='exa -l'
alias lld='exa -l -d'
alias tree='exa -T'
# alias sl="ls"
# alias lsd="ls -l  | grep -e '^d'"
# alias lsl="ls -al | grep -e '->'"
# alias lsh="ls -ald .*"

alias less="bat"
alias cat="bat --paging=never"

# SHELL
alias passwd="yppasswd"
alias datemd="date +%b%d"
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"
alias hc="history -c"
alias py="python3"

# GREP
alias grep="grep -in --color=auto"
alias rg="rg --line-number --no-heading --ignore-case"
alias rgdev="rg -i -n -t{c,cpp,make,java,py,tcl,json,perl,protobuf,sh,swig,xml}"

# ------------------------------------------------------------------------------ 

# PATH
alias fcd="_fzf_change_dir"
alias mcd="_mcd"
alias bcd="_bcd"
alias b.="cd .."
alias b..="cd ../.."
alias b...="cd ../../.."

# Print each PATH entry on a separate line
alias path="echo ${PATH} | tr -s ':' '\n' | uniq" 
alias manpath="echo ${MANPATH} | tr -s ':' '\n' | uniq"

# ------------------------------------------------------------------------------ 

# TMUX 
alias tm="tmux new-session -ADs main"
alias tmr="tmux a -t"
alias tmk="tmux kill-session -t"
alias tmls="tmux ls"
alias ftm="_fzf_switch_tmux_session"

# TOOL
alias g="git"
alias ga="git add"
alias gci="git commit -m"
alias gdi="git difftool"
alias gl="git pull"
alias gp="git push"
alias gpp="git push; git pull"
alias gr="git remote -v"
alias gs="git status"

alias gfs="gnome-open"

# ViM
alias v="$EDITOR"
alias vd="$EDITOR -d"
alias vf="_fzf_find_edit_file"
alias vrg="_fzf_grep_edit_file"
alias vgdb="_nvim_gdb_start"
alias v0="$EDITOR --noplugin"
alias vi="vim"
# alias vi_plugin_install="source ${HOME}/github.com/santiagomok/dotfiles/install/vim.sh"
# alias v0="vim -u NONE"
# alias vdebug="vim_term_debug"

# CMake
alias export_cc_var="export CC=`which gcc`; export CXX=`which g++`"

# List all files larger than a given size (e.g. llfs +10k)
alias llfs='find_by_size(){ find . -type f -size "$1" -exec ls --color --classify --human-readable -l {} \; ; }; find_by_size'

alias gll='fzf_git_log'
# ------------------------------------------------------------------------------ 

# Clipboard
alias cb="xclip -selection clipboard"
# SSH: pipe my public key to my clipboard.
alias cp_pubkey="more ~/.ssh/id_rsa.pub | cb | echo '=> Public key copied to pasteboard.'"
alias cpd='echo -en `pwd`/ | xclip -selection clipboard'

# ------------------------------------------------------------------------------ 

# ------------------------------------------------------------------------------ 

# HT+TB Check
# /etc/snmp/scripts/htcheck.sh
# /etc/snmp/scripts/turbocheck.sh
