# Dotfiles
* Author: Santiago Mok (santiago.mok@gmail.com)

My personal home configuration.

## Key Bindings
### Bash
| Alias & Key | Description |
| :---: | :---  |
| fc          | Change to directory found with fzf                               |
| fe          | Search and vim edit file found with fzf                          |
| fge         | Grep for pattern and vim edit file found with fzf                |
| fs          | Switch to selected (with fzf) tmux session                       |
| rgcode      | Grep for pattern in source code {cpp,java,python,tcl,etc..}      |

### Vim
| Key | Description |
| :---: | :---  |
| Ctrl+s    | Save |
| Ctrl+h    | Switch to pane left |
| Ctrl+l    | Switch to pane: right |
| Ctrl+k    | Switch to pane: up |
| Ctrl+j    | Switch to pane: down |
| ,[        | Switch to next tab |
| ,]        | Switch to previous tab |
| Ctrl+w T  | Open new tab |
| ,/        | Start grep command |
| ,\*       | Start grep for word under cursor |
| ,a        | Select all |
| ,s        | Sort |
| <         | Shift indent left |
| >         | Shift indent right |
| ,h        | Clear highlight |
| <F9>      | Toggle NERDTree |
| <F10>     | Toggle tagbar (for ctags) |


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
