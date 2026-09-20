-- [[ Configure key mappings ]]
-- see `:help lua-keymap.set`
-- require Neovim>=0.7
-- require('core.globals')


opt.setglobal('mapleader', ',')
opt.setglobal('maplocalleader', ',')

-- quit
keymap.set('n', '<leader>q', ':q<cr>', 'Quit')
keymap.set('n', '<leader>Q', ':qa<cr>', 'Quit all')
-- save
keymap.set('n', '<leader>w', ':update<cr>', 'Write only changed buffers')
keymap.set('n', '<leader>W', ':wall<cr>',   'Write all')
keymap.set('n', '<leader>WQ', ':wqall<cr>', 'Write all and quit')
-- session
keymap.set('n', '<leader>ws', ':mks ss.vim<cr>',  'Save session as ss.vim')
keymap.set('n', '<leader>WS', ':mks! ss.vim<cr>', 'Save and overwrite ss.vim session')

-- Tabs
keymap.set('n', '[t', vim.cmd.tabprevious, 'Navigate to previous tab page')
keymap.set('n', ']t', vim.cmd.tabnext, 'Navigate to next tab page')
keymap.set('n', '[1', '1gt', 'Go to tab1')
keymap.set('n', '[`', 'g<Tab>', 'Go to last accessed tab')
-- keymap.set('n', '[0', ':tablast<cr>', 'Go to last tab')
keymap.set('n', '<leader>tt', '<C-W>T', 'Split current buffer to new tab')
keymap.set('n', '<leader>TT', vim.cmd.tabclose, 'Close current tab')
-- keymap.set('n', '<leader>tp', ':tabmove -1<cr>') -- move the tab page to the left
-- keymap.set('n', '<leader>tn', ':tabmove +1<cr>') -- move the tab page to the right
-- keymap.set('n', '<leader>t1', ':tabmove 0<cr>')  -- move the tab page to the beginning
-- keymap.set('n', '<leader>t0', ':tabmove $<cr>')  -- move the tab page to the last

-- Buffers
keymap.set('n', '<C-E>', "<cmd>edit #<cr>", 'Edit alternate file')
keymap.set('n', '<leader>bd', "<cmd>silent %bdelete<bar>edit #<bar>bdelete #<cr>'\"", "Close all buffers but current one")
keymap.set('n', '[b', vim.cmd.bprevious, 'Navigate to previous buffer')
keymap.set('n', ']b', vim.cmd.bnext,    'Navigate to next buffer')

-- Split
keymap.set('n', '<leader>ss', ':split<cr>')
keymap.set('n', '<leader>vv', ':vsplit<cr>')
keymap.set('n', '<C-Left>',    ':vertical resize +5<cr>')
keymap.set('n', '<C-Right>',   ':vertical resize -5<cr>')
keymap.set('n', '<C-Up>',      ':resize -5<cr>')
keymap.set('n', '<C-Down>',    ':resize +5<cr>')

-- navigation
-- keymap.set('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', {expr = true})
-- keymap.set('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})

-- Bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
keymap.set('n', '<C-h>', '<C-w>h')
keymap.set('n', '<C-j>', '<C-w>j')
keymap.set('n', '<C-k>', '<C-w>k')
keymap.set('n', '<C-l>', '<C-w>l')

-- toggle [no]relativenumber
keymap.set('n', '<M-~>', ':set rnu!<cr>', 'Toggle relativenumber.')

-- file
keymap.set('n', '<leader>fw', ':!chmod u+w %:p<cr>', 'Open file for write')

keymap.set('v', '<', '<gv', 'Shit left indentation')
keymap.set('v', '>', '>gv', 'Shit right indentation')
keymap.set('', '<leader>a', 'ggVG', 'Select all')
keymap.set('n', '<leader>V', '<c-v>', 'Vertical visual selection')

keymap.set('n', '<leader>h', vim.cmd.noh, 'Clear highlighting after search')
keymap.set('n', 'q', '<nop>', 'Disable recording')

keymap.set({ "n", "x" }, "gy", '"+y', "Copy (+register)")
keymap.set({ "n", "x" }, "gp", '"+p', "Paste after cursor (+register)")
keymap.set({ "n", "x" }, "gP", '"+P', "Paste before cursor (+register)")

-- date
keymap.set('n', '<leader>dt', 'a<C-R>=strftime(\'%m/%d/%Y\')<cr><esc>')

-- sort
keymap.set('v', '<leader>st', ':sort<cr>')

-- Insert Mode
-- Exit insert-mode
-- imap <leader>i <Esc>
-- Ctrl-e jump to the end of line in insert mode
keymap.set('i', '<C-e>', '<C-o>$')

-- Insert quotes words separated by comma (AB,BC,CD -> "AB","BC","CD")
keymap.set('n', '<leader>riq', ':%s/\\([^,]\\+\\)/"\\1"/g')


-- substitute
-- replace the current word and all its occurrences
keymap.set('n', '<leader>rw', ':%s/\\<<C-r><C-w>\\>//g<left><left>')
keymap.set('v', '<leader>rw', 'y:%s/<C-r>"//g<left><left>')

-- replace the current word and all its occurrences pre-fill target word
keymap.set('n', '<leader>cw', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>')
keymap.set('v', '<leader>cw', 'y:%s/<C-r>"/<C-r>"//g<left><left>')
