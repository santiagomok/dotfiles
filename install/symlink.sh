#!/usr/bin/env bash

BIN_NAME=$(basename "$0")

export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd)"

[ ! -d ${HOME}/.vim ] && mkdir ${HOME}/.vim
[ ! -d ${HOME}/.tmux ] && mkdir ${HOME}/.tmux

echo "[ -f ${HOME}/.system/bashrc ] && . ${HOME}/.system/bashrc" >> ~/.bashrc
#ln -svf ${DOTFILES_DIR}/system/bash_profile ${HOME}/.bash_profile
#ln -svf ${DOTFILES_DIR}/system/bashrc ${HOME}/.bashrc
ln -svf ${DOTFILES_DIR}/system 			${HOME}/.system
ln -svf ${DOTFILES_DIR}/vim/vimrc 		${HOME}/.vimrc
ln -svf ${DOTFILES_DIR}/vim/plugin 		${HOME}/.vim/plugin
ln -svf ${DOTFILES_DIR}/vim/ftplugin 		${HOME}/.vim/ftplugin
ln -svf ${DOTFILES_DIR}/tmux/tmux.conf 		${HOME}/.tmux.conf
ln -svf ${DOTFILES_DIR}/tmux/theme_iceberg.conf ${HOME}/.tmux/theme_iceberg.conf
ln -svf ${DOTFILES_DIR}/git/gitconfig		${HOME}/.gitconfig
ln -svf ${DOTFILES_DIR}/git/gitignore		${HOME}/.gitignore
