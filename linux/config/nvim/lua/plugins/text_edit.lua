-- Mini require theme.lua

-- load plugin
require('mini.pairs').setup()
require('mini.surround').setup()
require('mini.fuzzy').setup()
require('nvim-ts-autotag').setup()

-- Configure mini.snippets to scan runtime paths for language snippets
local gen_loader = require('mini.snippets').gen_loader
require('mini.snippets').setup({
  snippets = {
    -- This natively loads the Python snippets packaged inside friendly-snippets
    gen_loader.from_lang(), 
  },
  -- Define keymaps for expanding (<C-j>) and jumping between positions (<C-l>/<C-h>)
  mappings = {
    expand = '<C-j>',
    jump_next = '<C-h>',
    jump_prev = '<C-l>',
  }
})

-- Neovim 0.12 ships the treesitter engine and parsers/queries for
-- c, lua, markdown, markdown_inline, query, vim, and vimdoc.
-- nvim-treesitter installs parsers and queries for everything else,
-- plus the experimental indent queries.

require('nvim-treesitter').install({
  'bash', 'c', 'cpp', 'json', 'lua', 'make', 'markdown', 'python',
})

local ai = require('mini.ai')
ai.setup({
  custom_textobjects = {
    -- C++ Class (`ac` / `ic`)
    c = ai.gen_spec.treesitter({
      a = '@class.outer',
      i = '@class.inner',
    }),
    -- C++ Function / Method (`af` / `if`)
    f = ai.gen_spec.treesitter({
      a = '@function.outer',
      i = '@function.inner',
    }),
    -- C++ Block / Statement block (`ab` / `ib`)
    b = ai.gen_spec.treesitter({
      a = '@block.outer',
      i = '@block.inner',
    }),
    -- C++ Parameter / Argument (`aa` / `ia`)
    a = ai.gen_spec.treesitter({
      a = '@parameter.outer',
      i = '@parameter.inner',
    }),
    -- C++ Conditional / Loops  (`ao` / `io`)
    o = ai.gen_spec.treesitter({
      a = { '@conditional.outer', '@loop.outer' },
      i = { '@conditional.inner', '@loop.inner' },
    }),
  },
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


-- set_jumps defaults to true, so these motions land in the jumplist (<C-o>/<C-i>).
local move = require("nvim-treesitter-textobjects.move")

local function map_move_start(key_next, key_prev, capture, desc)
-- Jump to the NEXT <capture>
  vim.keymap.set({ "n", "x", "o" }, key_next, function()
    move.goto_next_start(capture, "textobjects")
  end, { desc = "Go to NEXT " .. desc .. " start"})

-- Jump to the PREVIOUS <capture>
  vim.keymap.set({ "n", "x", "o" }, key_prev, function()
    move.goto_previous_start(capture, "textobjects")
  end, { desc = "Go to PREVIOUS " .. desc .. " start"})
end

local function map_move_end(key_next, key_prev, capture, desc)
-- Jump to the NEXT <capture>
  vim.keymap.set({ "n", "x", "o" }, key_next, function()
    move.goto_next_end(capture, "textobjects")
  end, { desc = "Go to NEXT " .. desc .. " end"})

-- Jump to the PREVIOUS <capture>
  vim.keymap.set({ "n", "x", "o" }, key_prev, function()
    move.goto_previous_end(capture, "textobjects")
  end, { desc = "Go to PREVIOUS " .. desc .. " end"})
end

-- Wire up the exact equivalents matching mini.ai keys
-- if not vim.wo.diff then
--     map_move_start("]c", "[c", "@class.outer", "class")
--     map_move_end("]C", "[C", "@class.outer", "class")
-- end
map_move_start("]f", "[f", "@function.outer", "function")
map_move_end("]F", "[F", "@function.outer", "function")
map_move_start("]b", "[b", {"@block.outer", "@conditional.outer", "@loop.outer" }, "block/conditional/loop")
map_move_end("]B", "[B", {"@block.outer", "@conditional.outer", "@loop.outer" }, "block")
map_move_start("]a", "[a", "@parameter.inner", "argument")
-- map_move_start("]o", "[o", { "@conditional.outer", "@loop.outer" }, "conditional/loop")
