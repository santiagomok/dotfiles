# ------------------------------------------------------------------------------ 
# File: export.sh
# ------------------------------------------------------------------------------ 

# ------------------------------------------------------------------------------ 

export PATH="${HOME}/bin:/usr/local/bin:/usr/local/sbin:${ZSH}/bin:$PATH"
export MANPATH="/usr/local/man:/usr/local/mysql/man:/usr/local/git/man:$MANPATH"

# ------------------------------------------------------------------------------ 

# GOLANG
export GOPATH=$HOME/Code/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

