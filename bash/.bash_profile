# ------------------------------------------------------------------------------ 
# File: bash_profile
# ------------------------------------------------------------------------------ 


set TERM=xterm-256color

# Base16 Shell
# git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
# BASE16_SHELL="$HOME/.config/base16-shell/"
# [ -n "$PS1" ] && \
#     [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
#         source "$BASE16_SHELL/profile_helper.sh"
        
#base16_default-dark
# base16_helios

# ~/.bashrc should source ~/.system/bashrc if exists
if [ -f "${HOME}/.bashrc" ]; then
    source  "${HOME}/.bashrc";
fi

[ -r "${HOME}/.inputrc" ] && bind -f "${HOME}/.inputrc";
