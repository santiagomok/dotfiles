#!/usr/bin/env bash

# source normalize_path.sh

# BIN_NAME=$(basename "$0")
# COMMAND_NAME=$1

# Reference: https://stackoverflow.com/questions/59895/how-to-get-the-source-directory-of-a-bash-script-from-within-the-script-itself/246128#246128
SCRIPT_PATH=$( greadlink -f ${BASH_SOURCE[0]} || readlink -f ${BASH_SOURCE[0]} )
# echo $SCRIPT_PATH

SCRIPT_DIR=$(dirname $SCRIPT_PATH)
# echo SCRIPT_DIR: $SCRIPT_DIR

# BIN_DIR=$(normalize_path ${SCRIPT_DIR}/../bin)
source $SCRIPT_DIR/../bin/link.sh

# function _link_to() {
    # local target
    # local link_name
    # target=$1
    # link_name=$2
    # [[ -h $link_name ]] && rm -vf $link_name && echo -e "  |___ link removed ... OK" 
    # [[ ! -h $link_name ]] && ln -svf $target $link_name && echo -e "  |___ link ... OK"
# }

# [[ ! -d $HOME/.local/bin ]]          && mkdir -p "$HOME/.local/bin" && echo "mkdir $HOME/.local/bin ... OK" 
# [[ ! -d $HOME/.local/share/man ]]    && mkdir -p "$HOME/.local/share/man" && echo "mkdir $HOME/.local/share/man ... OK"

# _link_to /System/Volumes/Data/mnt/SynologyDS $HOME/

# _link_to $SRC/config                          $HOME/.config

sub_config () {
    # _link_to $HOME/.config/zsh/zshrc              $HOME/.zshrc
    # _link_to $HOME/.config/tmux/tmux.conf         $HOME/.tmux.conf
    # _link_to $HOME/.config/vim                    $HOME/.vim
    # _link_to $HOME/.config/vim/vimrc              $HOME/.vimrc
    # _link_to $HOME/.config/ssh                    $HOME/.ssh
    # _link_to $HOME/.config/lldb/lldbinit            $HOME/.lldbinit
    _link_to $HOME/.config/git/gitconfig            $HOME/.gitconfig
    _link_to $HOME/.config/git/gitignore            $HOME/.gitignore
}

sub_help () {
    echo -e "Usage: ${YELLOW}${SCRIPT_DIR}/$BIN_NAME <command> [name]${NC}"
    echo
    echo "Commands:"
    echo "  help            This help message"
    echo "  basepath        Link base paths (e.g. ~/.local ~/.config)"
    echo "  config          Link config files (e.g. ~/.zshrc -> ~/.config/zsh/zshrc)"
    echo
}

# sub_make () {
    # _link_to ${QUARTUS_SCRIPT_DIR}/makefile.gmake $@
# }

case $COMMAND_NAME in
    "" | "-h" | "--help")
        sub_help
        ;;
    *)
        shift
        sub_${COMMAND_NAME} $@
        if [ $? = 127 ]; then
            echo -e "${RED} Error: '$COMMAND_NAME' is not a known command or has errors.${NC}" >&2
            sub_help
            exit 1
        fi
        ;;
esac
