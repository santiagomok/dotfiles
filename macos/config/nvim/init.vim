set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
let $NVIM_CONFIG_DIR = expand('$HOME/.config/nvim')

if has('nvim-0.5')
    source $NVIM_CONFIG_DIR/nightly.vim
lua << EOF
require('init_common')
EOF
else
    source $HOME/.vimrc
endif


