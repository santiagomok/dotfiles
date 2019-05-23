# Dotfiles
* Author: Santiago Mok (santiago.mok@gmail.com)

My personal home configuration.

# New Device Provision
- Instal homebrew
- Install pre-requesite app
- Clone and Configure dotfiles
- Install optional app

## Key Bindings
### Bash
| Alias & Key | Description |
| :---: | :---  |
| fc          | Change to directory found with fzf                               |
| fe          | Search and vim edit file found with fzf                          |
| fge         | Grep for pattern and vim edit file found with fzf                |
| fs          | Switch to selected (with fzf) tmux session                       |
| rgcode      | Grep for pattern in source code {cpp,java,python,tcl,etc..}      |

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
