vim.diagnostic.config {
  virtual_text = false,
  severity_sort = true,
  float = {
    source = true,
    focus = false,
    format = function(diagnostic)
      if diagnostic.user_data ~= nil and diagnostic.user_data.lsp.code ~= nil then
        return string.format("%s: %s", diagnostic.user_data.lsp.code, diagnostic.message)
      end
      return diagnostic.message
    end,
  }
}

-- Use an on_attach function to only map the following keys 
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', '<leader><space>', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
  buf_set_keymap('n', '<leader>ld', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
  buf_set_keymap('n', '<leader>lt', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)

  buf_set_keymap('n', '<leader>lrw', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
  -- buf_set_keymap('n', '<leader>lad', '<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>', opts)
  -- buf_set_keymap('n', '<leader>lrm', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>', opts)
  -- buf_set_keymap('n', '<leader>lls', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>', opts)

  buf_set_keymap('n', '<leader>lca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  -- buf_set_keymap('n', '<leader>ldd', '<cmd>lua vim.diagnostic.show_line_diagnostics()<cr>', opts)
  -- buf_set_keymap('n', '<leader>ldl', '<cmd>lua vim.diagnostic.set_loclist()<cr>', opts)

  buf_set_keymap('n', '<leader>ldd', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
  buf_set_keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<cr>", opts)

  -- Set some keybinds conditional on server capabilities
  -- if client.resolved_capabilities.document_formatting then
      -- buf_set_keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<cr>", opts)
  -- elseif client.resolved_capabilities.document_range_formatting then
      -- buf_set_keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.range_formatting()<cr>", opts)
  -- end
end

local lspconfig = require('lspconfig')

-- nvim-cmp supports additional completion capabilities
-- local
-- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
-- local servers = {"pyright", "rust_analyzer", "tsserver"}
-- for _, lsp in ipairs(servers) do
  -- lspconfig[lsp].setup { on_attach = on_attach }
-- end

-- ccls LSP
lspconfig.ccls.setup {
  on_attach = on_attach,
  -- capabilities = capabilities
  init_options = {
    cache = {
        directory = '/tmp/moksanti/ccls';
    };
  }
}

vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })

-- suppress error messages from lang servers
vim.notify = function(msg, log_level, _)
  if msg:match 'exit code' then
    return
  end
  if log_level == vim.log.levels.ERROR then
    vim.api.nvim_err_writeln(msg)
  else
    vim.api.nvim_echo({ { msg } }, true, {})
  end
end
