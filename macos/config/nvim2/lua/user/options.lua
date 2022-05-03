-- Line format
vim.o.tabstop = 4      		-- Define <TAB> column width
vim.o.softtabstop = 4   	-- Affect what happen when <TAB> or <BS> is pressed.
vim.o.shiftwidth = 4    	-- Affect what happen for <<, >>, or == keys. Must be same as tabstop
vim.o.expandtab = true      -- Convert \t into spaces when used with softtabstop.
vim.o.smartindent = true 	-- Automatically inserts one extra level of indentation in some cases.
vim.o.shiftround = true 
-- vim.o.syntax = true
vim.o.termguicolors = true
-- vim.o.title = true
vim.o.wildmode = 'longest:full,full'
-- vim.o.wrap = false
vim.o.list = true
vim.o.listchars = 'tab:▸ ,trail:·'
-- vim.o.scrolloff = 8 -- set screen lines to keep above and below the cursor
-- vim.o.sidescrolloff = 8

--  Search settings 
vim.o.ignorecase = true		-- Use case insensitive search, except when using capital letters
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.hlsearch  = true
-- vim.o.path+=**        	-- Searches current directory recursively.

-- Usability options
vim.o.number = true
vim.o.backspace = 'indent,eol,start'
vim.o.wildignorecase = true
vim.o.history = 10000
vim.o.confirm = true
vim.o.encoding = 'utf-8'
vim.o.visualbell = true 
-- vim.o.t_vb=
vim.o.mouse = 'a'
vim.o.cmdheight = 2
vim.o.showcmd = true           	-- Show partial commands in the last line of the screen
vim.o.clipboard = 'unnamed,unnamedplus' -- Make yank copy to the global system clipboard

-- " set clipboard=exclude:.*  " Do not use X clipboard to speed up start up time
-- set notimeout ttimeout ttimeoutlen=200 " Quickly time out on keycodes, but never time out on mappings
-- set nrformats=hex
-- 
-- " One of the most important options to activate. Allows you to switch from an
-- " unsaved buffer without saving it first. Also allows you to keep an undo
-- " history for multiple files. Vim will complain if you try to quit without
-- " saving, and swap files will keep you safe if your computer crashes.
-- 
vim.o.hidden = true
-- set norelativenumber
-- " augroup numbertoggle
--     " autocmd!
--     " " Set norelativenumber when in Insert mode
--     " au BufEnter,FocusGained,InsertLeave * set relativenumber
--     " au BufLeave,FocusLost,InsertEnter   * set norelativenumber
-- 
-- " augroup END
--
-- vim.o.confirm = true
-- vim.o.backup = true
-- vim.o.backupdir = vim.fn.stdpath 'data' .. '/backup//'
vim.o.updatetime = 250          -- Decrease CursorHold delay
vim.o.redrawtime = 10000        -- Allow more time for loading syntax on large files
vim.o.showmode = false
-- vim.o.completeopt = "menuone,noselect"
-- vim.o.fillchars = 'eob: '
--
-- Automatically change the current directory to the file editing
vim.o.autochdir = true 

vim.cmd 'syntax enable'
vim.cmd 'filetype plugin indent on'
-- Highlight on yank
-- vim.cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'

vim.g['python3_host_prog'] = '/p/psg/ctools/python/3.9.10/1/linux64/suse12/bin/python3'
    
