-- Line format
vim.opt.tabstop = 4      		-- Define <TAB> column width
vim.opt.softtabstop = 4   	-- Affect what happen when <TAB> or <BS> is pressed.
vim.opt.shiftwidth = 4    	-- Affect what happen for <<, >>, or == keys. Must be same as tabstop
vim.opt.expandtab = true      -- Convert \t into spaces when used with softtabstop.
vim.opt.smartindent = true 	-- Automatically inserts one extra level of indentation in some cases.
vim.opt.shiftround = true 
-- vim.opt.syntax = true
vim.opt.termguicolors = true
-- vim.opt.title = true
vim.opt.wildmode = 'longest:full,full'
-- vim.opt.wrap = false
vim.opt.list = true
vim.opt.listchars = 'tab:▸ ,trail:·'
-- vim.opt.scrolloff = 8 -- set screen lines to keep above and below the cursor
-- vim.opt.sidescrolloff = 8

--  Search settings 
vim.opt.ignorecase = true		-- Use case insensitive search, except when using capital letters
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch  = true
-- vim.opt.path+=**        	-- Searches current directory recursively.

-- Usability options
vim.opt.backspace = 'indent,eol,start'
vim.opt.wildignorecase = true
vim.opt.history = 10000
vim.opt.confirm = true
vim.opt.encoding = 'utf-8'
vim.opt.visualbell = true 
-- vim.opt.t_vb=
vim.opt.mouse = 'a'
vim.opt.cmdheight = 2
vim.opt.showcmd = true           	-- Show partial commands in the last line of the screen

-- Nvim 0.10
-- vim.g.clipboard = {
--   name = 'OSC 52',
--   copy = {
--     ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
--     ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
--   },
--   paste = {
--     ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
--     ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
--   },
-- }
-- Clipboard
vim.g.clipboard = 'osc52'   -- nvim 0.12+ built-in OSC52 to make copy work over SSH
vim.opt.clipboard = 'unnamedplus' 
-- Make yank copy to the 
-- unnamedplus: [+]register system clipboard (Ctrl+C or Cmd+C)
-- unnamed: [*]register (xclip selection/primary clipboard - mouse highlighting/middle-click to paste)
--'unnamed,unnamedplus' 

-- " set clipboard=exclude:.*  " Do not use X clipboard to speed up start up time
-- set notimeout ttimeout ttimeoutlen=200 " Quickly time out on keycodes, but never time out on mappings
-- set nrformats=hex
-- 
-- " One of the most important options to activate. Allows you to switch from an
-- " unsaved buffer without saving it first. Also allows you to keep an undo
-- " history for multiple files. Vim will complain if you try to quit without
-- " saving, and swap files will keep you safe if your computer crashes.
-- 
vim.opt.hidden = true
vim.opt.number = true
-- vim.opt.relativenumber = true
-- Toggle [no]relativenumber based on Normal or Insert mode
-- vim.cmd [[
-- augroup numbertoggle
--   autocmd!
--   autocmd BufEnter,FocusGained,InsertLeave,WinEnter  * if &nu && mode() != "i" | set rnu   | endif
--   autocmd BufLeave,FocusLost,InsertEnter,WinLeave    * if &nu                  | set noru  | endif
-- augroup END
-- ]]
-- local numberToggleGroup = vim.api.nvim_create_augroup('numbertoggle', { clear = true })
-- vim.api.nvim_create_autocmd(
--   { 'BufEnter', 'FocusGained', 'InsertLeave', 'WinEnter' },
--   {
--     -- pattern = '*',
--     -- callback = function() vim.api.nvim_set_option('relativenumber', true) end,
--     command = "set relativenumber",
--     group = numberToggleGroup,
--     desc = 'Enable relative line number when the buffer is entered - in normal mode.'
--   }
-- )
-- vim.api.nvim_create_autocmd(
--   { 'BufLeave', 'FocusLost', 'InsertEnter', 'WinLeave' },
--   {
--     -- pattern = '*',
--     -- callback = function() vim.api.nvim_set_option('relativenumber', false) end,
--     command = "set norelativenumber",
--     group = numberToggleGroup,
--     desc = 'Disable relative line number when the buffer is exited - in insert mode.'
--   }
-- )

-- vim.opt.confirm = true
-- vim.opt.backup = true
-- vim.opt.backupdir = vim.fn.stdpath 'data' .. '/backup//'
vim.opt.updatetime = 250          -- Decrease CursorHold delay
vim.opt.redrawtime = 10000        -- Allow more time for loading syntax on large files
vim.opt.showmode = false
-- vim.opt.completeopt = "menuone,noselect"
-- vim.opt.fillchars = 'eob: '
--
-- Automatically change the current directory to the file editing
vim.opt.autochdir = true 

vim.cmd 'syntax enable'
vim.cmd 'filetype plugin indent on' -- Allow auto-indenting depending on file type
vim.cmd 'autocmd FileType lua   setlocal tabstop=2 softtabstop=2 shiftwidth=2'
vim.cmd 'autocmd FileType json  setlocal tabstop=2 softtabstop=2 shiftwidth=2'
vim.cmd 'autocmd FileType sh    setlocal tabstop=2 softtabstop=2 shiftwidth=2'
-- Highlight on yank
-- vim.cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'

vim.g['python3_host_prog'] = '/usr/local/bin/python3'
    
