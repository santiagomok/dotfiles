-- Neovim 0.12 ships the treesitter engine and parsers/queries for
-- c, lua, markdown, markdown_inline, query, vim, and vimdoc.
-- nvim-treesitter installs parsers and queries for everything else,
-- plus the experimental indent queries.
vim.pack.add({
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' },
  { src = 'https://github.com/windwp/nvim-ts-autotag' },
})

require('nvim-treesitter').install({
  'bash', 'c', 'cpp', 'json', 'lua', 'make', 'markdown', 'python',
})

-- .v buffers are filetype verilog; the main-branch parser is systemverilog.
-- Uncomment the install name above and this register when that parser is wanted:
-- vim.treesitter.language.register('systemverilog', 'verilog')

vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('TreesitterStart', { clear = true }),
  desc = 'Highlight with the built-in treesitter engine when a parser is installed',
  callback = function(args)
    local lang = vim.treesitter.language.get_lang(args.match) or args.match
    if not vim.treesitter.language.add(lang) then
      return
    end
    vim.treesitter.start(args.buf, lang)
    if args.match == 'python' then
      return
    end
    vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})

require('nvim-ts-autotag').setup()
