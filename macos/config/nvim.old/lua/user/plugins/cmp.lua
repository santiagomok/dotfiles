local has_words_before = function()
  local line, col = table.unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match '%s' == nil
end

local cmp = require 'cmp'
-- local luasnip = require 'luasnip'
local lspkind = require 'lspkind'

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,longest,preview'

cmp.setup {
  -- experimental = {
    -- ghost_text = true,
  -- },
  formatting = {
    format = lspkind.cmp_format {
      with_text = true,
      menu = {
        nvim_lsp = '[LSP]',
        nvim_lua = '[Lua]',
        nvim_lsp_signature_help = "[Signature]",
        treesitter = '[Treesitter]',
        buffer = '[Buffer]',
        path = '[Path]',
      },
    },
  },
  -- snippet = {
      -- expand = function(args)
      -- require('luasnip').lsp_expand(args.body)
      -- end,
  -- },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
    -- if luasnip.jumpable(1) then
        -- luasnip.jump(1)
    if cmp.visible() then
      cmp.select_next_item()
    -- elseif has_words_before() then
        -- cmp.complete()
    else
        fallback()
    end

    -- if cmp.visible() then
    --   cmp.select_next_item()
    -- elseif luasnip.expand_or_jumpable() then
    --   luasnip.expand_or_jump()
    -- elseif has_words_before() then
    --   cmp.complete()
    -- else
    --   fallback()
    -- end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
    -- if luasnip.jumpable(-1) then
        -- luasnip.jump(-1)
    if cmp.visible() then
      cmp.select_prev_item()
    else
      fallback()
    end

    -- if cmp.visible() then
    --   cmp.select_prev_item()
    -- elseif luasnip.jumpable(-1) then
    --   luasnip.jump(-1)
    -- else
    --   fallback()
    -- end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'nvim_lua' },
    { name = 'treesitter' },
    { name = 'path' },
    { name = 'buffer' },
    -- { name = 'luasnip' },
    -- { name = 'fuzzy_path' },
  },
}

-- Auto pairs
local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done { map_char = { tex = "" } })

-- autotag
local autotag = require 'nvim-ts-autotag'
autotag.setup { enable = true }
