local utils = require('utils')

-- windows, tabs
utils.map('n', '<C-w><C-q>', '<cmd>qa<cr>')
-- tab navigation
utils.map('n', '<leader>tt', '<cmd>tabnew<cr>')
utils.map('n', '<leader>TT', '<cmd>tabclose<cr>')
utils.map('n', '<A-{>', '<cmd>tabprevious<cr>')
utils.map('n', '<A-}>', '<cmd>tabnext<cr>')
utils.map('n', '<leader>tp', '<cmd>tabmove -1<cr>') -- move the tab page to the left
utils.map('n', '<leader>tn', '<cmd>tabmove +1<cr>') -- move the tab page to the right
utils.map('n', '<leader>t1', '<cmd>tabmove 0<cr>')  -- move the tab page to the beginning
utils.map('n', '<leader>t0', '<cmd>tabmove $<cr>')  -- move the tab page to the last

-- save
utils.map('n', '<leader>w', '<cmd>update<cr>')
utils.map('n', '<leader>ww', '<cmd>wa<cr>')
utils.map('n', '<leader>ss', '<cmd>mks ss.vim<cr>')
utils.map('n', '<leader>SS', '<cmd>mks! ss.vim<cr>')

-- help
utils.map('n', '<F1>', '<cmd>Helptags<cr>')
utils.map('n', '<F2>', '<cmd>Maps<cr>')
utils.map('n', '<leader>H', '<cmd>History<cr>')

-- navigation
utils.map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', {expr = true})
utils.map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})

-- file
utils.map('n', '<leader>fw', '<cmd>!chmod u+w %:p<cr>')

-- floaterm
utils.map('n', '<leader>mm', '<cmd>FloatermSend make DEBUG=1 -j8<cr>')
utils.map('n', '<leader>MM', '<cmd>FloatermSend make clean && make DEBUG=1 -j8<cr>')
