local keymap = require 'lib.utils'.keymap
local Plug = vim.fn['plug#']

Plug('ngemily/vim-vp4')

keymap('n', '<leader>e', ':Vp4Edit<cr>')
keymap('n', '<leader>R', ':Vp4Revert<cr>')
keymap('n', '<leader>p4', ':Vp4')
