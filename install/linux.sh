#!/usr/bin/env bash

PREFIX="$HOME/.local"
[ ! -d ${PREFIX} ] && mkdir -p ${PREFIX}
export PATH=${PRFIX}:${PATH}

BIN_NAME=$(basename "$0")
COMMAND_NAME=$1

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

sub_help () {
    echo -e "Usage: ${YELLOW}$BIN_NAME <command>${NC}"
    echo
    echo "Commands:"
    echo "   help             This help message"
    echo "   update           Update packages and pkg managers (OS, brew, node, npm, yarn, commposer)"
    echo "   clean            Clean up caches (brew, npm, yarn, composer)"
    echo "   all              Install all packages"
}

sub_tree() {
    # The project page of linux "tree" command is located at http://mama.indstate.edu/users/ice/tree
    TEMP_DIR="${PREFIX}/.tmp/tree"; mkdir -p $TEMP_DIR

    wget -nc -O $TEMP_DIR/tree.tgz "http://mama.indstate.edu/users/ice/tree/src/tree-1.7.0.tgz"
    tar -xvzf $TEMP_DIR/tree.tgz -C $TEMP_DIR --strip-components 1

    cd $TEMP_DIR
    make
    mkdir -p "${PREFIX}/bin"
    mv -v tree "${PREFIX}/bin"

    # Clean-up temp
    rm -rvf $TEMP_DIR
}

sub_rust() {
    export CARGO_HOME=${PREFIX}
    export RUSTUP_HOME=${PREFIX}

    curl https://sh.rustup.rs -sSf | sh -s -- --verbose -y
}

sub_fd() {
    # Source: https://github.com/sharkdp/fd
    echo -e "${YELLOW}Installing fd ...${NC}"
    cargo install fd-find
    echo -e "${GREEN}... Success!${NC}"
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
