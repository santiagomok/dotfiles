#!/usr/bin/env bash
# ------------------------------------------------------------------------------ 
# File: setup.sh
# ------------------------------------------------------------------------------ 

# basepath
# Create base paths (e.g. ~/local/bin ~/.config)"
# ------------------------------------------------------------------------------
function _mkdir() {
  local path 
  path=$1
  [[ ! -d $path ]] \
    && echo "... mkdir $path" \
    && mkdir -p $path
}

DEVELOPER_PATH=$HOME/Developer
_mkdir $DEVELOPER_PATH
_mkdir $HOME/.local/bin
_mkdir $HOME/.local/share/man

# Install XCode Command Line Tools
# xcode-select --install

# Install [Homebrew](https://brew.sh)
# Check for Homebrew
if test ! $(which brew) 
then
  echo "... install Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
# bash, zsh, git, gh, curl, neovim, vim, coreutils
# brew bundle 

# set default Shell
dscl . -read /Users/$USER UserShell
# sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh

# Generate SSH key and add to github
## SSH keygen: [Connecting to github with SSH](https://help.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh)

# Clone dotfiles
[[ ! -d $DEVELOPER_PATH/dotfiles ]]  \
  && echo "... git clone santiagomok/dotfiles.git --> $DEVELOPER_PATH/dotfiles" \
  && git clone git@github.com:santiagomok/dotfiles.git $DEVELOPER_PATH/dotfiles

[[ ! -h $HOME/.config ]]  \
  && ln -svf ~/Developer/dotfiles/macos/config $HOME/.config
# ~/Developer/dotfiles/bin/run.sh link

# Zsh
## Clone slimzsh
[[ ! -d $HOME/.config/slimzsh ]]  \
  && echo "... git clone changs/slimzsh.git --> ~/.config/slimzsh" \
  && git clone --recursive https://github.com/changs/slimzsh.git ~/.config/slimzsh
## update vi keybinding ~/.config/slimzsh/keys.zsh "bindkey -v"

# Configure neovim
## Clone neovim packer plugin manager
PACKER_PATH=$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim
[[ ! -d $PACKER_PATH ]] \
  && echo "... git clone wbthomason/packer.nvim --> $PACKER_PATH" \
  && git clone --depth 1 https://github.com/wbthomason/packer.nvim $PACKER_PATH

# VimPlug
# curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# vim +PlugInstall

# Terminal Editor

# Fonts
## [Source Code Pro](https://fonts.google.com/specimen/Source+Code+Pro)

## [Powerline Fonts](https://github.com/powerline/fonts)
## clone: git clone https://github.com/powerline/fonts.git --depth=1 ~/local/theme/fonts
## install: cd fonts && ./install.sh
## clean: cd .. && rm -rf fonts

# Install config files
# macos/install.sh
