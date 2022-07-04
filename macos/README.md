# MacOS



## macOS defaults 
```bash
# default Shell
dscl . -read /Users/$USER UserShell
sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh

macos/set-defaults.sh
```


