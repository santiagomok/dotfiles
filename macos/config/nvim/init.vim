set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
let $NVIM_CONFIG_DIR = expand('$HOME/.config/nvim')

source $NVIM_CONFIG_DIR/plugins.vim
lua require('init_common')


