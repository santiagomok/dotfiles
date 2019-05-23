#!/usr/bin/env bash

install_plugin() {
    [ ! -d ${HOME}/.vim/bundle ] && mkdir -p ${HOME}/.vim/bundle
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim 
    vim +PluginInstall +qall
}

install_plugin
