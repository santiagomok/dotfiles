# ------------------------------------------------------------------------------ 
# File: export.zsh
# ------------------------------------------------------------------------------ 

# ------------------------------------------------------------------------------ 

# XDG_CONFIG_HOME (linux to macOS)
# https://stackoverflow.com/questions/3373948/equivalents-of-xdg-config-home-and-xdg-data-home-on-mac-os-x
export HOME_LOCAL="$HOME/.local"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_HOME="$HOME_LOCAL/share"

export PATH="$HOME_LOCAL/bin:/opt/homebrew/bin:$PATH"
export MANPATH="$HOME_LOCAL/share/man:`manpath`"

# ------------------------------------------------------------------------------ 

# EDITOR 
export EDITOR=nvim
export VISUAL=$EDITOR
# export TERM=xterm-256color
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# ------------------------------------------------------------------------------ 
# Cpp
export BOOST_ROOT=$(brew --prefix boost)
export FMT_ROOT=$(brew --prefix fmt)
export LLVM_ROOT=$(brew --prefix llvm)
export CPLUS_INCLUDE_PATH="$BOOST_ROOT/include:$FMT_ROOT/include:$LLVM_ROOT/include:$CPLUS_INCLUDE_PATH"
# To use the bundled libc++ please add the following LDFLAGS:
# For compilers to find llvm you may need to set:
# export LDFLAGS="-L${LLVM_ROOT}/lib:${LLVM_ROOT}/lib/c++ -Wl,-rpath,${LLVM_ROOT}/lib/c++"
#
# If you need to have llvm first in your PATH, run:
export PATH="$LLVM_ROOT/bin:$PATH"

# Qt
# export PATH="$PATH:$(brew --prefix qt)/bin"
# export LDFLAGS="-L/usr/local/opt/qt/lib"
# export CPPFLAGS="-I/usr/local/opt/qt/include"
# export PKG_CONFIG_PATH="/usr/local/opt/qt/lib/pkgconfig"

# Go
export GOPATH="$HOME_LOCAL"

# Rust
export RUSTUP_HOME="$HOME_LOCAL"
export CARGO_HOME="$HOME_LOCAL"

# ------------------------------------------------------------------------------ 

# FZF
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
export FZF_ALT_C_OPTS="--preview 'bat -n --color=always {}'"
# export FZF_DEFAULT_COMMAND='fd --type f --type d --hidden --follow --exclude .git'
export FZF_DEFAULT_COMMAND='rg --files --hidden'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse-list --border'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS="
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"
# CTRL-/ to toggle small preview window to see the full command
# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"

# ------------------------------------------------------------------------------ 

