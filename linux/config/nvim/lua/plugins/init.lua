-- lua/plugins.lua

local function github(repo)
  return { src = "https://github.com/" .. repo }
end

local plugins = {
-- theme
  github('navarasu/onedark.nvim'),
  github('nvim-mini/mini.nvim'),
  github('ibhagwan/fzf-lua'),
  github('akinsho/bufferline.nvim'),
  github('akinsho/toggleterm.nvim'),
-- file edit
  github('ngemily/vim-vp4'),
-- lspconfig
  github('neovim/nvim-lspconfig'),
  github('mason-org/mason.nvim'),
  github('mason-org/mason-lspconfig.nvim'),
  github('folke/lazydev.nvim'),
  github('nicholasxjy/lsp-progress-notify.nvim'),
-- treesitter
  github('nvim-treesitter/nvim-treesitter'),
  github('nvim-treesitter/nvim-treesitter-textobjects'),
  github('windwp/nvim-ts-autotag'), 
-- AI Code Assist
  github('nvim-lua/plenary.nvim'),
  github('olimorris/codecompanion.nvim'),
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
