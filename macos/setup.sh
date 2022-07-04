# File: setup.sh

# Install XCode Command Line Tools
# xcode-select --install

# Install [Homebrew](https://brew.sh)
# bash, zsh, git, gh, curl, neovim, vim, coreutils
# Check for Homebrew
if test ! $(which brew) 
then
  echo "... Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
# brew bundle ~/local/dev/dotfiles/macos/Brewfile

# Generate SSH key and add to github
## SSH keygen: [Connecting to github with SSH](https://help.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh)

# Clone dotfiles
git clone git@github.com:santiagomok/dotfiles.git ~/Developer/dotfiles
# ~/Developer/dotfiles/bin/run.sh link

# Zsh
## Clone slimzsh
git clone --recursive https://github.com/changs/slimzsh.git ~/.config/slimzsh

## add to $HOME/.zshrc -> source "~/.config/slimzsh/slim.zsh"
## update vi keybinding ~/.config/slimzsh/keys.zsh "bindkey -v"

# Configure neovim
## Clone neovim packer plugin manager
packer_nvim='~/.local/share/nvim/site/pack/packer/start/packer.nvim'
[[ ! -d $packer_nvim ]] \
  && echo   echo "... Installing Neovim Packer Plugin Manager" \
  && git clone --depth 1 https://github.com/wbthomason/packer.nvim ${packer_nvim}

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
