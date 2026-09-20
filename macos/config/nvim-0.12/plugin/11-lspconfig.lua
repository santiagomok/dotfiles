vim.pack.add({
    { src = 'https://github.com/neovim/nvim-lspconfig' },
    -- { src = 'https://github.com/nvim-mini/mini.completion' },
    { src = 'https://github.com/mason-org/mason.nvim' },
    { src = 'https://github.com/mason-org/mason-lspconfig.nvim' },
    { src = 'https://github.com/folke/lazydev.nvim' },
})

-- Setup lazydev BEFORE lspconfig so it can patch lua_ls automatically
require("lazydev").setup({
    library = {
        { runtimepath = true },
    },
})

-- Optimize completeopt for modern completion filtering
-- Adding 'fuzzy' allows mini.completion to utilize native 0.12 fuzzy filtering
vim.opt.completeopt = { "menuone", "noselect", "fuzzy", "nosort" }

-- Initialize the plugin (Do NOT set vim.o.autocomplete = true)
require('mini.completion').setup({
  -- You can tweak delays or windows here if you wish
})

-- Modern 0.12 Mason / LSP Hooking
require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = { "lua_ls" },
})

-- Register capabilities so servers know mini.completion is managing the UI
vim.lsp.config('*', {
  capabilities = require('mini.completion').get_lsp_capabilities()
})

-- 4. Launch your servers natively
vim.lsp.enable('lua_ls')

-- Keymaps
-- The modern, structured alternative using mini's companion module
local map_multistep = require('mini.keymap').map_multistep

-- If completion menu is open, go next/prev. Otherwise, perform a standard tab.
map_multistep('i', '<Tab>',   { 'pmenu_next' })  -- Maps to your <C-n> logic
map_multistep('i', '<S-Tab>', { 'pmenu_prev' })  -- Maps to your <C-p> logic

-- Accepts active popup option. Can also be paired with auto-pair hooks.
map_multistep('i', '<CR>',    { 'pmenu_accept', 'minipairs_cr' }) -- Maps to your <C-y> logic
map_multistep('i', '<BS>',    { 'minipairs_bs' }) -- Maps to your <C-y> logic


-- Configure the diagnostic engine logic (No visual layout clutter needed here)
vim.diagnostic.config({
  -- set rounded borders for diagnostics without a function hack
  float = { border = "rounded" },
  -- update_in_insert = true, -- Check errors instantly as you type
})
