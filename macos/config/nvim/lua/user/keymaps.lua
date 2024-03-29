-- [[ Configure key mappings ]]
-- see `:help lua-vim.keymap.set`
-- require Neovim>=0.7
-- local vim.keymap.set = require 'lib.utils'.vim.keymap.set

vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- quit
vim.keymap.set('n', '<leader>q', ':q<cr>',    { desc = 'Quit' })
vim.keymap.set('n', '<leader>Q', ':qa<cr>',   { desc = 'Quit all'})
-- save
vim.keymap.set('n', '<leader>w', ':update<cr>', { desc = 'Write only changed buffers' })
vim.keymap.set('n', '<leader>W', ':wall<cr>',   { desc = 'Write all', silent = false })
vim.keymap.set('n', '<leader>WQ', ':wqall<cr>', { desc = 'Write all and quit', silent = false })
-- session
vim.keymap.set('n', '<leader>ws', ':mks ss.vim<cr>',  { desc = 'Save session as ss.vim', silent = false})
vim.keymap.set('n', '<leader>WS', ':mks! ss.vim<cr>', { desc= 'Save and overwrite ss.vim session', silent = false})

-- tab navigation
-- vim.keymap.set('n', '<M-{>', ':tabprevious<cr>')
-- vim.keymap.set('n', '<M-}>', ':tabnext<cr>')
vim.keymap.set('n', '<M-1>', '1gt', { desc = 'Go to tab1' })
vim.keymap.set('n', '<M-2>', '2gt', { desc = 'Go to tab2' })
vim.keymap.set('n', '<M-3>', '3gt', { desc = 'Go to tab3' })
vim.keymap.set('n', '<M-4>', '4gt', { desc = 'Go to tab4' })
vim.keymap.set('n', '<M-5>', '5gt', { desc = 'Go to tab5' })
vim.keymap.set('n', '<M-0>', ':tablast<cr>', { desc = 'Go to last tab' })
vim.keymap.set('n', '<M-`>', 'g<Tab>', { desc = 'Go to last accessed tab' })
vim.keymap.set('n', '<leader>tt', '<C-W>T', { desc = 'Split current buffer to new tab' })
vim.keymap.set('n', '<leader>TT', ':tabclose<cr>', { desc = 'Close current tab' })
vim.keymap.set('n', '<leader>tp', ':tabmove -1<cr>') -- move the tab page to the left
vim.keymap.set('n', '<leader>tn', ':tabmove +1<cr>') -- move the tab page to the right
vim.keymap.set('n', '<leader>t1', ':tabmove 0<cr>')  -- move the tab page to the beginning
vim.keymap.set('n', '<leader>t0', ':tabmove $<cr>')  -- move the tab page to the last

-- buffers navigation
vim.keymap.set('n', '<M-[>',   ':bprevious<cr>',  { desc = 'Go to previous buffer' })
vim.keymap.set('n', '<M-]>',   ':bnext<cr>',      { desc = 'Go to next buffer' })

-- Split
vim.keymap.set('n', '<leader>ss', ':split<cr>')
vim.keymap.set('n', '<leader>vv', ':vsplit<cr>')
vim.keymap.set('n', '<C-Left>',    ':vertical resize +5<cr>')
vim.keymap.set('n', '<C-Right>',   ':vertical resize -5<cr>')
vim.keymap.set('n', '<C-Up>',      ':resize -5<cr>')
vim.keymap.set('n', '<C-Down>',    ':resize +5<cr>')

-- navigation
vim.keymap.set('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', {expr = true})
vim.keymap.set('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})

-- Bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- toggle [no]relativenumber
vim.keymap.set('n', '<M-~>', ':set rnu!<cr>', { desc = 'Toggle relativenumber.' })

-- file
vim.keymap.set('n', '<leader>fw', ':!chmod u+w %:p<cr>')

vim.keymap.set('v', '<', '<gv')  -- shit left indentation
vim.keymap.set('v', '>', '>gv')  -- shit right indentation
vim.keymap.set('', '<leader>a', 'ggVG')  -- select all
vim.keymap.set('n', '<leader>V', '<c-v>') -- vertical visual selection

vim.keymap.set({'n', 'v'}, '<leader>h', ':noh<cr>', { desc = 'Clear highlighting after search'})
vim.keymap.set('n', 'q', '<nop>', { desc = 'Disable recording' })

-- date
vim.keymap.set('n', '<leader>dt', 'a<C-R>=strftime(\'%m/%d/%Y\')<cr><esc>')

-- sort
vim.keymap.set('v', '<leader>st', ':sort<cr>')

-- Insert Mode
-- Exit insert-mode
-- imap <leader>i <Esc>
-- Ctrl-e jump to the end of line in insert mode
vim.keymap.set('i', '<C-e>', '<C-o>$')

-- Insert quotes words separated by comma (AB,BC,CD -> "AB","BC","CD")
vim.keymap.set('n', '<leader>riq', ':%s/\\([^,]\\+\\)/"\\1"/g')
-- tpope/surround.vim
vim.keymap.set('n', '<leader>""', 'ysiw"', { desc = 'Add double-quote surrounding word', remap = true })
vim.keymap.set('n', "<leader>''", "ysiw'", { desc = 'Add single-quote surrounding word', remap = true })

-- substitute
-- replace the current word and all its occurrences
vim.keymap.set('n', '<leader>rw', ':%s/\\<<C-r><C-w>\\>//g<left><left>')
vim.keymap.set('v', '<leader>rw', 'y:%s/<C-r>"//g<left><left>')

-- replace the current word and all its occurrences pre-fill target word
vim.keymap.set('n', '<leader>cw', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>')
vim.keymap.set('v', '<leader>cw', 'y:%s/<C-r>"/<C-r>"//g<left><left>')

-- vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

