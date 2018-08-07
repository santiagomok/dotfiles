#!/bin/sh
PREFIX="$HOME/.local/"

install_tree() {
    # The project page of linux "tree" command is located at http://mama.indstate.edu/users/ice/tree
    TMP_TREE_DIR="$HOME/.tmp/tree"; mkdir -p $TMP_TREE_DIR

    wget -nc -O $TMP_TREE_DIR/tree.tgz "http://mama.indstate.edu/users/ice/tree/src/tree-1.7.0.tgz"
    tar -xvzf $TMP_TREE_DIR/tree.tgz -C $TMP_TREE_DIR --strip-components 1

    cd $TMP_TREE_DIR
    make
    mkdir -p "$PREFIX/bin"
    mv -v tree "$PREFIX/bin"
    # Maybe $PREFIX/bin was added to $PATH, if you run the wookayin/dotfiles script
    # echo "export PATH=$PREFIX/bin:$PATH"

    # Clean-up temp
    rm -rvf $TMP_TREE_DIR
}

install_tree
