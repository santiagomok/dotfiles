-- Reference
--   * https://vale.rocks/posts/neovim

-- Line format
vim.o.tabstop = 4      		-- Define <TAB> column width
vim.o.softtabstop = 4   	-- Affect what happen when <TAB> or <BS> is pressed.
vim.o.shiftwidth = 4    	-- Affect what happen for <<, >>, or == keys. Must be same as tabstop
vim.o.expandtab = true      -- Convert \t into spaces when used with softtabstop.
vim.o.shiftround = true 

-- Better indentation
vim.o.smartindent = true 	-- Automatically inserts one extra level of indentation in some cases.
-- vim.o.autoindent = true
vim.o.copyindent = true
vim.o.breakindent = true

-- vim.o.syntax = true
vim.o.termguicolors = true
-- vim.o.title = true
vim.o.wildmode = 'longest:full,full'
vim.o.wrap = true
vim.o.list = true
vim.o.listchars = 'tab:▸ ,trail:·'
-- vim.o.scrolloff = 8 -- set screen lines to keep above and below the cursor
-- vim.o.sidescrolloff = 8

-- Code Folding
vim.o.foldmethod = "indent"
vim.o.foldlevel = 4


--  Search settings 
vim.o.ignorecase = true		-- Use case insensitive search, except when using capital letters
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.hlsearch  = true
-- vim.o.path+=**        	-- Searches current directory recursively.
--
-- Substitution Preview
vim.o.inccommand = "split"

-- Highlight current location
vim.o.cursorline = true
vim.o.cursorlineopt = "screenline"
vim.o.cursorcolumn = true

-- Disable 'How to Disable Mouse'
vim.api.nvim_command('aunmenu PopUp.How-to\\ disable\\ mouse')
vim.api.nvim_command('aunmenu PopUp.-1-')

-- Usability options
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

-- Show line number and toggle relative line number
vim.o.number = true
vim.o.hidden = true
vim.o.relativenumber = true

-- Toggle [no]relativenumber based on Normal or Insert mode
-- vim.cmd [[
-- augroup numbertoggle
--   autocmd!
--   autocmd BufEnter,FocusGained,InsertLeave,WinEnter  * if &nu && mode() != "i" | set rnu   | endif
--   autocmd BufLeave,FocusLost,InsertEnter,WinLeave    * if &nu                  | set noru  | endif
-- augroup END
-- ]]
local numberToggleGroup = vim.api.nvim_create_augroup('numbertoggle', { clear = true })
vim.api.nvim_create_autocmd(
  { 'BufEnter', 'FocusGained', 'InsertLeave', 'WinEnter' },
  {
    pattern = '*',
    -- callback = function() vim.api.nvim_set_option('relativenumber', true) end,
    command = "if &nu && mode() != 'i' | set relativenumber | endif",
    group = numberToggleGroup,
    desc = 'Enable relative line number when the buffer is entered - in normal mode.'
  }
)
vim.api.nvim_create_autocmd(
  { 'BufLeave', 'FocusLost', 'InsertEnter', 'WinLeave' },
  {
    pattern = '*',
    -- callback = function() vim.api.nvim_set_option('relativenumber', false) end,
    command = "if &nu | set norelativenumber | endif",
    group = numberToggleGroup,
    desc = 'Disable relative line number when the buffer is exited - in insert mode.'
  }
)
  
-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})


-- Undo and Backup
-- vim.o.undofile = true -- Figure out how to do persistent undo
-- vim.o.confirm = true
vim.o.backup = false 
vim.o.writebackup = false 
-- vim.o.backupdir = vim.fn.stdpath 'data' .. '/backup//'

-- vim.o.updatetime = 250          -- Decrease CursorHold delay
-- vim.o.redrawtime = 10000        -- Allow more time for loading syntax on large files
-- vim.o.timeoutlen = 300          -- Waits for completion of key sequence
vim.o.showmode = false

-- Set max number of items in popup menus
vim.o.pumheight = 5

-- vim.o.completeopt = "menuone,noselect"
-- vim.o.fillchars = 'eob: '
--
-- Automatically change the current directory to the file editing
vim.o.autochdir = true 

vim.cmd 'syntax enable'
vim.cmd 'filetype plugin indent on' -- Allow auto-indenting depending on file type
vim.cmd 'autocmd FileType lua   setlocal tabstop=2 softtabstop=2 shiftwidth=2'
vim.cmd 'autocmd FileType json  setlocal tabstop=2 softtabstop=2 shiftwidth=2'
vim.cmd 'autocmd FileType sh    setlocal tabstop=2 softtabstop=2 shiftwidth=2'
-- Highlight on yank
-- vim.cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'

vim.g['python3_host_prog'] = '/usr/local/bin/python3'

-- Disable unused features to improve startup times
for _, plugin in pairs({
	"netrwFileHandlers",
	"getscript",
	"getscriptPlugin",
	"vimball",
	"vimballPlugin",
	"2html_plugin",
	"logipat",
	"rrhelper",
	"spellfile_plugin",
	"matchit"
}) do
	vim.g["loaded_" .. plugin] = 1
end
    
