# ------------------------------------------------------------------------------ 
# File: alias.zsh
# ------------------------------------------------------------------------------ 
#
# ------------------------------------------------------------------------------ 
# RC editing
alias brc="$EDITOR ${HOME}/.bashrc"
alias grc="$EDITOR ${HOME}/.gitconfig"
alias tmrc="$EDITOR ${HOME}/.tmux.conf" 
alias wrc="$EDITOR ${XDG_CONFIG_HOME}/wezterm/wezterm.lua"
alias zrc="$EDITOR ${XDG_CONFIG_HOME}/zsh/alias.zsh" 

# ------------------------------------------------------------------------------ 
# ls -> lsd
alias l='lsd --group-directories-first'
alias ls='lsd'
alias l1='l --oneline'
alias ll='l --long --all --header'
alias lld='ll --only-dirs'
alias llr='ll --recurse'
alias llg='ll --git'
alias llh="ll | rg -e '->'"
alias tree='lsd --tree'

alias less="bat"
alias cat="bat --paging=never"

# ------------------------------------------------------------------------------ 
# SHELL

alias datemd="date +%b%d"
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"
alias py="python3"
alias du="du -csh $@ | sort -h"

# GREP
alias grep="grep --color=auto"
alias rg="rg --line-number --no-heading --ignore-case"
alias rgc="rg -i -n -t{c,cpp,make,java,py,tcl,json,perl,protobuf,sh,swig,xml}"

# ------------------------------------------------------------------------------ 
# PATH
alias cc='cd ${XDG_CONFIG_HOME}'
alias ct='cd ${HOME}/Developer/tutorial'
alias cw='cd ${HOME}/Developer'
alias c.='cd ${HOME}/Developer/dotfiles'
alias j="_fzf_fasd_change_dir"
alias fcd="_fzf_change_dir"
alias mcd="_mcd"
alias bcd="_bcd"
alias b.="cd .."
alias b..="cd ../.."
alias b...="cd ../../.."

# Print each PATH entry on a separate line
alias path="echo ${PATH} | tr -s ':' '\n' | uniq" 
alias manpath="manpath | tr -s ':' '\n' | uniq"

# ------------------------------------------------------------------------------ 
# G++/CLANG/MAKE
alias m="g++ -std=c++17"
alias mc="clang++ -std=c++17"
alias mk="make -j"

# TMUX 
alias tm="tmux new-session -ADs main"
alias tmr="tmux a -t"
alias tmk="tmux kill-session -t"
alias tmls="tmux ls"
alias ftm="_fzf_switch_tmux_session"
# alias tmc="tmux -2 new -s"

# GIT
alias gv="lazygit"
alias g="git"
alias ga="git add"
alias gdi="git difftool"
alias gs="git status"
alias gr="git remote -v"
alias gll='_fzf_git_log'

# VIM
alias v="nvim"
alias vf="_fzf_find_edit_file"
alias vrg="_fzf_grep_edit_file"
alias vgdb="_nvim_gdb_start"
alias v0="v --noplugin"
alias vc="nvim ~/.config/nvim/init.lua"
alias vi="vim"
# alias v0="vim -u NONE"
# alias vdebug="vim_term_debug"

# Init zoxide and alias to ji if exists
(( $+commands[zoxide] )) && eval "$(zoxide init zsh --cmd j)"
(( $+commands[zoxide] )) && alias ja="zoxide add"

# CMAKE
alias export_cc_var="export CC=`which gcc`; export CXX=`which g++`"

# List all files larger than a given size (e.g. llfs +10k)
alias llfs='find_by_size(){ find . -type f -size "$1" -exec ls --color --classify --human-readable -l {} \; ; }; find_by_size'

# download audio only
alias ytda="youtube-dl -i --extract-audio --audio-format mp3"
alias ytdaf="youtube-dl -i --extract-audio --audio-format mp3 -a"
# ------------------------------------------------------------------------------ 

