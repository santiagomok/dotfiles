local keymap = require 'lib.utils'.keymap

vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- windows, tabs
keymap('n', '<leader>WW', ':wqall<cr>')
keymap('n', '<leader>QQ', ':qall<cr>')
keymap('n', '<leader>TT', '<cmd>tabclose<cr>')
keymap('n', '<leader>tt', '<cmd>tabnew<cr>')

-- tab navigation
-- see plugins/bufferline.lua
-- keymap('n', '<A-{>', '<cmd>tabprevious<cr>')
-- keymap('n', '<A-}>', '<cmd>tabnext<cr>')
-- keymap('n', '<leader>tp', '<cmd>tabmove -1<cr>') -- move the tab page to the left
-- keymap('n', '<leader>tn', '<cmd>tabmove +1<cr>') -- move the tab page to the right
-- keymap('n', '<leader>t1', '<cmd>tabmove 0<cr>')  -- move the tab page to the beginning
-- keymap('n', '<leader>t0', '<cmd>tabmove $<cr>')  -- move the tab page to the last

--keymap('n', '<leader>vrc' ':tabnew \"stdpath(\'config\').\'/plug.vim\'\"<cr>')

-- Split
keymap('n', '<leader>ws', ':split<cr>')
keymap('n', '<leader>vs', ':vsplit<cr>')
keymap('n', '<C-Left>',    ':vertical resize -5<CR>')
keymap('n', '<C-Right>',   ':vertical resize +5<CR>')
keymap('n', '<C-Up>',      ':resize -5<CR>')
keymap('n', '<C-Down>',    ':resize +5<CR>')

-- buffers navigation
keymap('n', '<leader>bn',   ':bnext<CR>')
keymap('n', '<leader>bp',   ':bprevious<CR>')

-- save
keymap('n', '<leader>w', '<cmd>update<cr>')
keymap('n', '<leader>wa', '<cmd>wa<cr>')
keymap('n', '<leader>ss', '<cmd>mks ss.vim<cr>')
keymap('n', '<leader>SS', '<cmd>mks! ss.vim<cr>')

-- navigation
keymap('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', {expr = true})
keymap('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})

-- Bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
keymap('n', '<C-h>', '<C-w>h')
keymap('n', '<C-j>', '<C-w>j')
keymap('n', '<C-k>', '<C-w>k')
keymap('n', '<C-l>', '<C-w>l')
-- keymap('n', 'wh', '<C-w>h')
-- keymap('n', 'wj', '<C-w>j')
-- keymap('n', 'wk', '<C-w>k')
-- keymap('n', 'wl', '<C-w>l')

-- file
keymap('n', '<leader>fw', '<cmd>!chmod u+w %:p<cr>')

-- floaterm
keymap('n', '<leader>mm', '<cmd>FloatermSend make DEBUG=1 -j8<cr>')
keymap('n', '<leader>MM', '<cmd>FloatermSend make clean && make DEBUG=1 -j8<cr>')

keymap('v', '<', '<gv')  -- shit left indentation
keymap('v', '>', '>gv')  -- shit right indentation
keymap('', '<leader>a', 'ggVG')  -- select all
keymap('n', '<leader>V', '<c-v>') -- vertical visual selection

keymap('n', '<leader>h', ':noh<cr>', {silent = true}) -- remove highlighting after search
keymap('n', 'q', '<nop>') -- disable recording

-- date
keymap('n', '<leader>dt', 'a<C-R>=strftime(\'%m/%d/%Y\')<cr><esc>')

-- sort
keymap('v', '<leader>st', ':sort<cr>')

-- Insert Mode
-- Exit insert-mode
-- imap <leader>i <Esc>
-- Ctrl-e jump to the end of line in insert mode
keymap('i', '<C-e>', '<C-o>$')

-- Insert quotes words separated by comma (AB,BC,CD -> "AB","BC","CD")
keymap('n', '<leader>riq', ':%s/\\([^,]\\+\\)/"\\1"/g')


-- substitute
-- replace the current word and all its occurrences
keymap('n', '<leader>rw', ':%s/\\<<C-r><C-w>\\>//g<left><left>')
keymap('v', '<leader>rw', 'y:%s/<C-r>"//g<left><left>')

-- replace the current word and all its occurrences pre-fill target word
keymap('n', '<leader>cw', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>')
keymap('v', '<leader>cw', 'y:%s/<C-r>"/<C-r>"//g<left><left>')
