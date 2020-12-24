# git clone --recursive https://github.com/changs/slimzsh.git ~/.slimzsh
[ -f $HOME/.slimzsh/slim.zsh ]      && source "$HOME/.slimzsh/slim.zsh"
[ -f $HOME/.fzf.zsh ]               && source $HOME/.fzf.zsh

# exit() {
# # TMUX override builtin exit() function 
    # if [[ -z $TMUX ]]; then
        # builtin exit
        # return 
    # fi

    # panes=$(tmux list-panes | wc -l)
    # windows=$(tmux list-windows | wc -l)
    # count=$(($panes + $windows - 1))
    # if [ $count -eq 1 ]; then
        # tmux detach
    # else
        # builtin exit
    # fi
# }

# Local config
config_path="${HOME}/.zsh_config"

fpath=( "$config_path/function" $fpath )
autoload -Uz $config_path/function/**/* 

[ -f $config_path/export.zsh ]      && source "$config_path/export.zsh"
[ -f $config_path/alias.zsh ]       && source "$config_path/alias.zsh"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
