local Plug = vim.fn['plug#']

Plug('nvim-treesitter/nvim-treesitter', {
    ['do'] = ':TSUpdate'
})

Plug('neovim/nvim-lspconfig') -- Collection of configurations for built-in LSP client

Plug('hrsh7th/nvim-cmp') -- Autocompletion plugin
Plug('hrsh7th/cmp-nvim-lsp') -- LSP source for nvim-cmp
Plug('hrsh7th/cmp-nvim-lsp-signature-help') -- nvim-cmp source for displaying function signatures with the current parameter emphasized
Plug('hrsh7th/cmp-buffer') -- nvim-cmp source for buffer words
Plug('hrsh7th/cmp-nvim-lua') -- nvim-cmp source for neovim Lua API (e.g. vim.lsp.*)
Plug('onsails/lspkind.nvim') -- add pictograms to neovim built-in lsp


Plug('windwp/nvim-autopairs')
Plug('windwp/nvim-ts-autotag')
Plug('RRethy/nvim-treesitter-endwise')

-- Plug('L3MON4D3/LuaSnip') -- Snippets plugin
-- Plug('saadparwaiz1/cmp_luasnip')

