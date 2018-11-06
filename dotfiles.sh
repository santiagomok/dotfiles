#!/usr/bin/env bash

# Adapted from https://github.com/mihaliak/dotfiles/blob/master/bin/dotfiles

BIN_NAME=$(basename "$0")
COMMAND_NAME=$1
SUB_COMMAND_NAME=$2

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

# Get dotfiles dir (so run this script from anywhere)
export DOTFILES_DIR 
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )"

sub_help () {
    echo -e "Usage: ${YELLOW}$BIN_NAME <command>${NC}"
    echo
    echo "Commands:"
    echo "   help             This help message"
    echo "   update           Update packages and pkg managers (OS, brew, node, npm, yarn, commposer)"
    echo "   clean            Clean up caches (brew, npm, yarn, composer)"
    echo "   install          Create symbolic links, install applications"
    echo "   symlink          Create symbolic link to rc files (bashrc, vimrc, tmux.conf)"
    echo "   brew             Run brew script"
}

sub_install () {
    {DOTFILES}/install/linux.sh
    {DOTFILES}/install/vim.sh
    echo -e "${GREEN} Success! Install command finished.${NC}"
}

sub_update () {
    sudo softwareupdate -i -a
    nvm install --lts --latest-npm # install last lts node instance
    brew update
    brew upgrade
    echo -e "${GREEN} Success! Update command finished.${NC}"
}

sub_clean () {
    brew cleanup
    brew cask cleanup
    echo -e "${GREEN} Success! Clean command finished.${NC}"
}

sub_symlink () {
    . "$DOTFILES_DIR/install/symlink.sh
    echo -e "${GREEN} Success! Symbolic links created.${NC}"
}

sub_install() {
}

sub_defaults () {
    . "$DOTFILES_DIR/macos/defaults.sh"
    echo -e "${GREEN} Success! MacOS defaults command finished.${NC}"
}

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
