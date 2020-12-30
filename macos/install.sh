#!/usr/bin/env bash

SRC=$HOME/local/dev/dotfiles

ln -svf $SRC/macos/config 	$HOME/.config
ln -svf $SRC/macos/zshrc 	$HOME/.zshrc
ln -svf $SRC/macos/nvimrc 	$HOME/.vimrc
ln -svf $HOME/.config/vim  	$HOME/.vim
ln -svf $SRC/macos/.tmux.conf 	$HOME/.tmux.conf
