-- stdpath'data' == ~/.local/share/nvim
local install_path  = vim.fn.stdpath 'data' .. '/plugged'
local Plug = vim.fn['plug#']

vim.call('plug#begin', install_path)

require 'user.plugins.theme'

require 'user.plugins.tmux'

require 'user.plugins.finder'

require 'user.plugins.nerdcommenter'

require 'user.plugins.vp4'

require 'user.plugins.floaterm'

require 'user.plugins.code'

Plug('farmergreg/vim-lastplace')

-- Plug('jiangmiao/auto-pairs')

vim.call('plug#end')


vim.cmd([[
    " set termguicolors
    " access colors present in 256 colorspace
    let base16colorspace=256  
    colorscheme base16-helios
    let g:lightline = {
        \ 'colorscheme': 'Tomorrow_Night_Bright',
        \ }
]])
-- colorscheme base16-default-dark
-- colorscheme base16-nord

require 'user.plugins.treesitter'
require 'user.plugins.lspconfig'
require 'user.plugins.cmp'
require 'user.plugins.autopairs'
-- require 'users.plugins.luasnip'
