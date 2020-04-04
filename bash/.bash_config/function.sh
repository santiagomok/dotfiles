# ------------------------------------------------------------------------------ 
# File: function.sh
# ------------------------------------------------------------------------------ 

# ------------------------------------------------------------------------------ 
function _mcd() {
    mkdir -p $*
    cd $*
}

function _bcd() {
    # ${PWD##*/}: trims path up to and including the last slash
    while [[ ${PWD} != '/' && ${PWD##*/} != "$1" ]]; do cd ..; done
}

function add_to_path {
	if [ -z `echo $PATH |grep $1` ]; then
		export PATH=$2:${PATH}
	fi
}

function psgrep() {
    ps -ef | { 
        read -r;
        echo "$REPLY";
        grep --color=auto "$@"
    }
}

function du10() {
    # Show directory size sorted from largest
    # Usage: du10 dir/\* (asterisk need escape)
    du -shx $1 | sort -rh | head -10
}

# ViM
vim_term_debug() {
    vim -c "Termdebug ${1:-}"
}

# Fuzzy 
# fd - cd to selected directory
#function fd() {
#  local dir
#  dir=$(find ${1:-.} -path '*/\.*' -prune \
#                  -o -type d -print 2> /dev/null | fzf +m) &&
#  cd "$dir"
#}

# v - open files in ~/.viminfo
v() {
  local files
  files=$(grep '^>' ~/.viminfo | cut -c3- |
          while read line; do
            [ -f "${line/\~/$HOME}" ] && echo "$line"
          done | fzf-tmux -d -m -q "$*" -1) && $EDITOR ${files//\~/$HOME}
}

# ftags - search ctags
_fzf_tags() {
  local line
  [ -e tags ] &&
  line=$(
    awk 'BEGIN { FS="\t" } !/^!/ {print toupper($4)"\t"$1"\t"$2"\t"$3}' tags | \
    cut -c1-$COLUMNS | fzf --nth=2 --tiebreak=begin \
  ) && $EDITOR $(cut -f3 <<< "$line") -c "set nocst" \
                                      -c "silent tag $(cut -f2 <<< "$line")"
}

_fzf_change_dir() {
    local dir
    dir=$(fd --type d --hidden --follow --exclude .git . ${1:-.} 2> /dev/null | fzf -i --preview 'tree -C {} | head -200') \
    && cd $dir
}

# fuzzy grep with ripgrep
_fzf_grep_edit_file() {
    local file
    # $1 +$2: filename + line-number
    file="$(rg --no-heading --vimgrep $@ | fzf -0 -1 | awk -F: '{print $1 " +" $2}')"
    if [[ -n $file ]]; then
        $EDITOR $file
    fi
}

# editor open with fuzzy find
_fzf_find_edit_file() {
    local file
    file="$(fd --type f ${1:-.} ${2:-.} | fzf --multi --exit-0 --select-1)"
    if [[ -n $file ]]; then
        VIMRUNTIME= nvim -p $file
    fi
}

# Modified version where you can press
#   - CTRL-O to open with `open` command,
#   - CTRL-E or Enter key to open with the $EDITOR
fo() {
  local out file key
  IFS=$'\n' read -d '' -r -a out < <(fzf-tmux --query="$1" --exit-0 --expect=ctrl-o,ctrl-e)
  key=${out[0]}
  file=${out[1]}
  if [ -n "$file" ]; then
    if [ "$key" = ctrl-o ]; then
      open "$file"
    else
      ${EDITOR:-vim} "$file"
    fi
  fi
}

_fzf_switch_tmux_session() {
  local session
  session=$(tmux list-sessions -F "#{session_name}" | \
    fzf --height 40% --reverse --query="$1" --select-1 --exit-0) &&
  tmux switch-client -t "$session"
}

# Open FZF to select session
_fzf_tmux_select_session() {
  [[ -n "$TMUX" ]] && change="switch-client" || change="attach-session"
  if [ $1 ]; then
     tmux $change -t "$1" 2>/dev/null || (tmux new-session -d -s $1 && tmux $change -t "$1"); return
  fi
  session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --exit-0) &&  tmux $change -t "$session" || echo "No sessions found."
}


# Display compact log list in fuzzy finder
fzf_git_log() {
    git ll --color=always "$@" \
    | fzf --ansi --no-sort --height 100% \
          --preview "echo {} | grep -o '[a-f0-9]\{7\}' | head -1 |
                       xargs -I@ sh -c 'git show --color=always @'"
}

fzf_log() {
  hash=$(git log --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |  fzf | awk '{print $1}')
  echo $hash | xclip
  git showtool $hash
}

_nvim_gdb_start() {
    local debug_bin=$1 
    v +'GdbStart gdb -q $debug_bin'
}
