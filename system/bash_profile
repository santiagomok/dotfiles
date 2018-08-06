# ------------------------------------------------------------------------------ 
# File: bash_profile
# ------------------------------------------------------------------------------ 

# ~/.bashrc should source ~/.system/bashrc if exists
if [ -f "${HOME}/.bashrc" ]; then
    source  "${HOME}/.bashrc";
elif [ -f "${HOME}/.system/bashrc" ] ; then
    source "${HOME}/.system/bashrc";
fi

[ -r "${HOME}/.inputrc" ] && bind -f "${HOME}/.inputrc";
