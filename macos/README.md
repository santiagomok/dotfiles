# MacOS

## New Device Provision
- Instal homebrew
- Install pre-requesite app
- Clone and Configure dotfiles
- Install optional app

## ZSH
- Install slim-zsh: 
  - git clone --recursive https://github.com/changs/slimzsh.git ~/.slimzsh
  - add to $HOME/.zshrc --> source "$HOME/.slimzsh/slim.zsh"
  - update vi keybinding ~/.slimzsh/keys.zsh "bindkey -v"

- Install fasd
  - MacOS: brew install fasd
  - Linux: https://github.com/clvv/fasd/wiki/Installing-via-Package-Managers 

### Default Shell
```bash
dscl . -read /Users/$USER UserShell
sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh
```

## iTerm2
Source: 
Color: Tango Dark
Font: Incosolata-dz for Powerline
Size: 12

