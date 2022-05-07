local keymap = require 'lib.utils'.keymap

vim.g['fzf_action'] = {
    ['ctrl-t'] = 'tab split',
    ['ctrl-s'] = 'vsplit',
    ['ctrl-x'] = 'split'
}

keymap('n', '<F1>', ':Helptags<cr>')
keymap('n', '<F2>', ':Maps<cr>')
keymap('n', '<leader>B', ':Buffers<CR>')
keymap('n', '<leader>H', ':History<cr>')
keymap('n', '<leader>F',  ':Files<CR>')
keymap('n', '<leader>ff', ':Files ../')

vim.cmd([[
    nmap <leader>/ <Plug>RgRawSearch
    vmap <leader>/ <Plug>RgRawVisualSelection
    nmap <leader>* <Plug>RgRawWordUnderCursor
    if executable("rg")
        set grepprg=rg\ --vimgrep\ --smart-case\ --hidden
        set grepformat=%f:%l:%c:%m
    endif
]])
