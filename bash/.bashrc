# ------------------------------------------------------------------------------ 
# File: bashrc
# ------------------------------------------------------------------------------ 

export PLATFORM=$(uname -s) # Switch for Macos and Linux
# ------------------------------------------------------------------------------ 

set -o vi

script_path="${HOME}/.bash_config"

[ -f "${script_path}/env.sh" ] && source "${script_path}/env.sh";
[ -f "${script_path}/function.sh" ] && source "${script_path}/function.sh";
[ -f "${script_path}/export.sh" ] && source "${script_path}/export.sh";
[ -f "${script_path}/alias.sh" ] && source "${script_path}/alias.sh";
[ -f "${HOME}/.fzf.bash" ] && source "${HOME}/.fzf.bash";

