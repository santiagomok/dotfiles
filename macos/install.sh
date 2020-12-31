#!/usr/bin/env bash

# Reference: https://stackoverflow.com/questions/59895/how-to-get-the-source-directory-of-a-bash-script-from-within-the-script-itself/246128#246128
SCRIPT_PATH=$( greadlink -f ${BASH_SOURCE[0]} || readlink -f ${BASH_SOURCE[0]} )
# echo $SCRIPT_PATH

# SRC: $HOME/local/dev/dotfiles/macos
SRC=$(dirname $SCRIPT_PATH)
echo SRC: $SRC

function _link_to() {
    local target
    local link_name
    target=$1
    link_name=$2
    [[ -h $link_name ]] && rm -vf $link_name && echo -e "  |___ link removed ... OK" 
    ln -svf $target $link_name && echo -e "  |___ link ... OK"
}

[[ ! -d $HOME/local/bin ]]          && mkdir -p "$HOME/local/bin" && echo "mkdir $HOME/local/bin ... OK" 
[[ ! -d $HOME/local/share/man ]]    && mkdir -p "$HOME/local/share/man" && echo "mkdir $HOME/local/share/man ... OK"

# _link_to $SRC/macos/config       $HOME/.config
# _link_to $SRC/macos/zshrc        $HOME/.zshrc
# _link_to $SRC/macos/nvimrc       $HOME/.vimrc
# _link_to $SRC/macos/tmux.conf    $HOME/.tmux.conf
# _link_to $SRC/../git/gitconfig   $HOME/.gitconfig
# _link_to $SRC/../git/gitignore   $HOME/.gitignore

# _link_to $HOME/.config/vim       $HOME/.vim
_link_to $HOME/.config/ssh       $HOME/.ssh
