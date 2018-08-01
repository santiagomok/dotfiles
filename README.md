# File: README.md
# Author: Santiago Mok (santiago.mok@gmail.com)

My personal home set-up configuration. 

## Vim 
mkdir -p ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

## Install Powerline Fonts
Source: https://github.com/powerline/fonts
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts

## ZSH
* slim-zsh: 
    - git clone --recursive https://github.com/changs/slimzsh.git ~/.slimzsh
    - add to $HOME/.zshrc --> source "$HOME/.slimzsh/slim.zsh"
    - Install fasd
        - MacOS: brew install fasd
        - Linux: https://github.com/clvv/fasd/wiki/Installing-via-Package-Managers 
* oh-my-zsh

## MacOS 
# Install iTerm2
Source: 
Color: Tango Dark
Font: Incosolata-dz for Powerline
Size: 12
