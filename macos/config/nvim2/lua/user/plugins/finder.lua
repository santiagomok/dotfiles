local keymap = require 'lib.utils'.keymap
local Plug = vim.fn['plug#']

Plug('junegunn/fzf', {
    ['dir'] = '~/.fzf',
    ['do'] = './install --all'
})

Plug('junegunn/fzf.vim')

vim.g['fzf_action'] = {
    ['ctrl-t'] = 'tab split',
    ['ctrl-s'] = 'split',
    ['ctrl-i'] = 'vsplit'
}

keymap('n', '<F1>', ':Helptags<cr>')
keymap('n', '<F2>', ':Maps<cr>')
keymap('n', '<leader>B', ':Buffers<CR>')
keymap('n', '<leader>H', ':History<cr>')
keymap('n', '<leader>F',  ':Files<CR>')
keymap('n', '<leader>ff', ':Files ../')

Plug('jesseleite/vim-agriculture')

vim.cmd([[
    nmap <leader>/ <Plug>RgRawSearch
    vmap <leader>/ <Plug>RgRawVisualSelection
    nmap <leader>* <Plug>RgRawWordUnderCursor
    if executable("rg")
        set grepprg=rg\ --vimgrep\ --smart-case\ --hidden
        set grepformat=%f:%l:%c:%m
    endif
]])
