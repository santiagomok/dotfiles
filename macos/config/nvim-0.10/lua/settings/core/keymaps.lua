-- [[ Configure key mappings ]]
-- see `:help lua-vim.keymap.set`
-- require Neovim>=0.7
-- require('settings.core.globals')

opt.setglobal('mapleader', ',')
opt.setglobal('maplocalleader', ',')

-- quit
vim.keymap.set('n', '<M-q>', ':q<cr>', { desc = 'Quit' })
vim.keymap.set('n', '<M-Q><M-Q>', ':qa<cr>', { desc = 'Quit all'})
-- save
vim.keymap.set('n', '<M-w>', ':update<cr>', { desc = 'Write only changed buffers' })
vim.keymap.set('n', '<M-W>', ':wall<cr>', { desc = 'Write all', silent = false })
vim.keymap.set('n', '<M-W><M-Q>', ':wqall<cr>', { desc = 'Write all and quit', silent = false })
-- session
vim.keymap.set('n', '<leader>ws', ':mks ss.vim<cr>', { desc = 'Save session as ss.vim', silent = false})
vim.keymap.set('n', '<leader>WS', ':mks! ss.vim<cr>', { desc= 'Save and overwrite ss.vim session', silent = false})

-- Tabs
keys.map('n', '[t', vim.cmd.tabprevious, 'Navigate to previous tab page')
keys.map('n', ']t', vim.cmd.tabnext, 'Navigate to next tab page')
keys.map('n', '[1', '1gt', 'Go to tab1')
keys.map('n', '[`', 'g<Tab>', 'Go to last accessed tab')
-- keys.map('n', '[0', ':tablast<cr>', 'Go to last tab')
keys.map('n', '<leader>tt', '<C-W>T', 'Split current buffer to new tab')
keys.map('n', '<leader>TT', vim.cmd.tabclose, 'Close current tab')
-- keys.map('n', '<leader>tp', ':tabmove -1<cr>') -- move the tab page to the left
-- keys.map('n', '<leader>tn', ':tabmove +1<cr>') -- move the tab page to the right
-- keys.map('n', '<leader>t1', ':tabmove 0<cr>')  -- move the tab page to the beginning
-- keys.map('n', '<leader>t0', ':tabmove $<cr>')  -- move the tab page to the last

-- Buffers
keys.map('n', '<C-E>', "<cmd>edit #<cr>", 'Edit alternate file')
keys.map('n', '<leader>bd', "<cmd>silent %bdelete<bar>edit #<bar>bdelete #<cr>'\"", "Close all buffers but current one")
keys.map('n', '[b', 'vim.cmd.bprevious', 'Navigate to previous buffer')
keys.map('n', ']b', vim.cmd.bnext, 'Navigate to next buffer')

-- Split
vim.keymap.set('n', '<leader>ss', ':split<cr>')
vim.keymap.set('n', '<leader>vv', ':vsplit<cr>')
vim.keymap.set('n', '<C-Left>',    ':vertical resize +5<cr>')
vim.keymap.set('n', '<C-Right>',   ':vertical resize -5<cr>')
vim.keymap.set('n', '<C-Up>',      ':resize -5<cr>')
vim.keymap.set('n', '<C-Down>',    ':resize +5<cr>')

-- navigation
-- vim.keymap.set('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', {expr = true})
-- vim.keymap.set('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})

-- Bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- toggle [no]relativenumber
vim.keymap.set('n', '<M-~>', ':set rnu!<cr>', { desc = 'Toggle relativenumber.' })

-- file
keys.map('n', '<leader>fw', ':!chmod u+w %:p<cr>', 'Open file for write')

keys.map('v', '<', '<gv', 'Shit left indentation')
keys.map('v', '>', '>gv', 'Shit right indentation')
keys.map('', '<leader>a', 'ggVG', 'Select all')
keys.map('n', '<leader>V', '<c-v>', 'Vertical visual selection')

keys.map('n', '<leader>h', vim.cmd.noh, 'Clear highlighting after search')
keys.map('n', 'q', '<nop>', 'Disable recording')

keys.map({ "n", "x" }, "gy", '"+y', "Copy (+register)")
keys.map({ "n", "x" }, "gp", '"+p', "Paste after cursor (+register)")
keys.map({ "n", "x" }, "gP", '"+P', "Paste before cursor (+register)")

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


-- substitute
-- replace the current word and all its occurrences
vim.keymap.set('n', '<leader>rw', ':%s/\\<<C-r><C-w>\\>//g<left><left>')
vim.keymap.set('v', '<leader>rw', 'y:%s/<C-r>"//g<left><left>')

-- replace the current word and all its occurrences pre-fill target word
vim.keymap.set('n', '<leader>cw', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>')
vim.keymap.set('v', '<leader>cw', 'y:%s/<C-r>"/<C-r>"//g<left><left>')
