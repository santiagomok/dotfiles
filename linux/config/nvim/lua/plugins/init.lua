-- lua/plugins.lua
local plugins = {
-- theme
  { src = "https://github.com/navarasu/onedark.nvim" },
  { src = "https://github.com/nvim-mini/mini.nvim" },
  { src = 'https://github.com/ibhagwan/fzf-lua' },
  { src = "https://github.com/akinsho/bufferline.nvim" },
  { src = 'https://github.com/akinsho/toggleterm.nvim' },
-- file edit
  { src = 'https://github.com/ibhagwan/fzf-lua' },
  { src = 'ngemily/vim-vp4' },
-- lspconfig
  { src = 'neovim/nvim-lspconfig' },
  { src = 'mason-org/mason.nvim' },
  { src = 'mason-org/mason-lspconfig.nvim' },
  { src = 'folke/lazydev.nvim' },
-- -- treesitter
  { src = 'nvim-treesitter/nvim-treesitter', version = 'main' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects'},
  { src = 'windwp/nvim-ts-autotag' },
}

vim.pack.add(plugins)
-- Modern Neovim 0.12 parallel download engine execution
-- for _, plugin in ipairs(plugins) do
--   vim.pack.add(plugin)
-- end

-- Load Plugins
require('plugins.theme')
require('plugins.text_edit')
require('plugins.file_edit')
require('plugins.lspconfig')
-- require('plugins.fileconfig')
require('plugins.treesitter')
