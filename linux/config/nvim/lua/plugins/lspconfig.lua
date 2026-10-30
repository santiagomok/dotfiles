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
  ensure_installed = { "lua_ls", "clangd", "pyright" },
})

-- Register capabilities so servers know mini.completion is managing the UI
vim.lsp.config('*', {
  capabilities = require('mini.completion').get_lsp_capabilities()
})

-- custom lsp settings for clangd
vim.lsp.config('clangd', {
  cmd = {
    'clangd',
    '--background-index',
    '--clang-tidy',
    '--completion-style=detailed',
    '--header-insertion=iwyu',
    '--offset-encoding=utf-8',
  },
  filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
  root_markers = { '.clangd', '.clang-format', 'compile_commands.json', '.git' },
})

-- custom lsp settings for lua
vim.lsp.config('lua_ls', {
  cmd = { vim.env.HOME .. '/.local/bin/lua-language-server' },
  filetypes = { 'lua' },
  root_markers = { '.luarc.json', '.git' },
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = { globals = { 'vim' } },
      workspace = { library = { vim.env.VIMRUNTIME } },
    },
  },
})

-- 4. Launch your servers natively
vim.lsp.enable({ 'lua_ls', 'clangd', 'pyright' })-- Keymaps
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
  virtual_text = false,
  severity_sort = true,
  -- set rounded borders for diagnostics without a function hack
  float = { border = "rounded" },
  -- update_in_insert = true, -- Check errors instantly as you type
})

-- LSP index progress bar
require('lsp-progress-notify').setup()

--  Configuration mapped directly into Cursor's backend agent
require("codecompanion").setup({
  strategies = {
    chat = {
      adapter = "cursor_cli",
    },
    inline = {
      adapter = "cursor_cli",
    },
    cli = {
      agent = "cursor_cli", -- Set Cursor as your default CLI agent
    },
  },
  adapters = {
    acp = {
      cursor_cli = function()
        return require("codecompanion.adapters").extend("cursor_cli", {
          -- Additional model flags or tool modifications can layer here if needed
        })
      end,
    },
  },
})

-- Native Keybindings
local opts = { noremap = true, silent = true }

opts.desc = "Toggle CodeCompanion Chat"
vim.keymap.set({ "n", "v" }, "<leader>cc", "<cmd>CodeCompanionChat Toggle<cr>", opts)

opts.desc = "CodeCompanion Actions"
vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>CodeCompanionActions<cr>", opts)

opts.desc = "CodeCompanion Inline Edit"
vim.keymap.set({ "n", "v" }, "<leader>ci", "<cmd>CodeCompanion<cr>", opts)

