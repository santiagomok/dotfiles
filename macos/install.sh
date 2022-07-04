#!/usr/bin/env bash
# ------------------------------------------------------------------------------ 
# File: install.sh
# ------------------------------------------------------------------------------ 

# ------------------------------------------------------------------------------ 
BIN_NAME=$(basename "$0")
COMMAND_NAME=$1

SCRIPT_PATH=$( greadlink -f ${BASH_SOURCE[0]} || readlink -f ${BASH_SOURCE[0]} )
SCRIPT_DIR=$(dirname $SCRIPT_PATH)
echo "$SCRIPT_DIR"

# source normalize_path.sh
# BIN_DIR=$(normalize_path ${SCRIPT_DIR}/../bin)
source $HOME/local/bin/link.sh

# ------------------------------------------------------------------------------ 
sub_help () {
    echo -e "Usage: ${YELLOW}$BIN_NAME <command> [name]${NC}"
    echo
    echo "Commands:"
    echo "  help            This help message"
    echo "  config          Link config files (e.g. ~/.zshrc -> ~/.config/zsh/zshrc)"
    echo 
    echo "Paths:"
    echo "  SCRIPT_DIR      $SCRIPT_DIR"
    echo
}

# ------------------------------------------------------------------------------ 
sub_config () {
    _link_to $HOME/.config/zsh/zshrc              $HOME/.zshrc
    _link_to $HOME/.config/tmux/tmux.conf         $HOME/.tmux.conf
    _link_to $HOME/.config/vim                    $HOME/.vim
    _link_to $HOME/.config/vim/vimrc              $HOME/.vimrc
    _link_to $HOME/.config/ssh                    $HOME/.ssh
    _link_to $HOME/.config/lldb/lldbinit          $HOME/.lldbinit
    _link_to $HOME/.config/git/gitconfig          $HOME/.gitconfig
    _link_to $HOME/.config/git/gitignore          $HOME/.gitignore

# _link_to /System/Volumes/Data/mnt/SynologyDS $HOME/
}

# ------------------------------------------------------------------------------ 

# Test ssh connection over id_ed25519
# ssh $USER@mac -i /home/$USER/.ssh/id_ed25519 -o PasswordAuthentication=no -vv


# ------------------------------------------------------------------------------ 
case $COMMAND_NAME in
    "" | "-h" | "--help")
        sub_help
        ;;
    *)
        shift
        sub_${COMMAND_NAME} $@
        if [ $? = 127 ]; then
            echo -e "${RED} Error: '$COMMAND_NAME' is an unknown command or has errors.${NC}" >&2
            sub_help
            exit 1
        fi
        ;;
esac
