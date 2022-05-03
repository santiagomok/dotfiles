local keymap = require 'lib.utils'.keymap
local Plug = vim.fn['plug#']

Plug('voldikss/vim-floaterm')

vim.g['floaterm_keymap_new'] = '<leader>fn'
vim.g['floaterm_keymap_toggle'] = '<leader>fm'
vim.g['floaterm_keymap_prev'] = '<leader>f{'
vim.g['floaterm_keymap_next'] = '<leader>f}'

Plug('szw/vim-maximizer')
vim.g['maximizer_default_mapping_key'] = '<F6>'
