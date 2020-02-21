# MacOS

## New Device Provision
SSH keygen: [Connecting to github with SSH](https://help.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh)

Clone dotfiles
```bash
git clone git@github.com:santiagomok/dotfiles.git ~/local/dev/dotfiles
```

Install [Homebrew](https://brew.sh)
```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# Install brew bundle command
brew tap Homebrew/bundle
# Install apps
brew bundle ~/local/dev/dotfiles/macos/Brewfile

# Configure dotfiles
stow -v macos/.stow*
stow -v macos tmux git gdb
```

Install VIM Plugin 
```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall
```

# Install Powerline and Fonts
## ZSH
- Install slim-zsh: 
  - git clone --recursive https://github.com/changs/slimzsh.git ~/.slimzsh
  - add to $HOME/.zshrc --> source "~/.slimzsh/slim.zsh"
  - update vi keybinding ~/.slimzsh/keys.zsh "bindkey -v"

## Fonts
### [Powerline Fonts](https://github.com/powerline/fonts)
- clone: git clone https://github.com/powerline/fonts.git --depth=1 ~/local/theme/fonts
- install: cd fonts && ./install.sh
- clean: cd .. && rm -rf fonts
### BASE16
- git clone https://github.com/martinlindhe/base16-iterm2.git ~/local/theme/base16-iterm2

## iTerm2
Source: 
Color: base16-tomorrow-night-256
Font: Incosolata-dz for Powerline
Size: 12


## macOS defaults 
```bash
# default Shell
dscl . -read /Users/$USER UserShell
sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh

macos/set-defaults.sh
```
