-- Mini require theme.lua

-- load plugin
require('mini.pairs').setup()
require('mini.surround').setup()

--
require('mini.snippets').setup()
require('mini.fuzzy').setup()

require('mini.misc').setup()
MiniMisc.setup_restore_cursor()

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


keymap.set('n', '<leader>Z', function() MiniMisc.zoom() end, 'Toggle maximize window')


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

-- Optional: enable jump setting globally for the move module if supported by your version
-- (allowing you to jump back with <C-o> and forward with <C-i>),
local status_ok, move_config = pcall(require, "nvim-treesitter-textobjects")
if status_ok and type(move_config.setup) == "function" then
  move_config.setup({
    move = {
      set_jumps = true,
    },
  })
end

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
if not vim.wo.diff then
    map_move_start("]c", "[c", "@class.outer", "class")
    map_move_end("]C", "[C", "@class.outer", "class")
end
map_move_start("]f", "[f", "@function.outer", "function")
map_move_end("]F", "[F", "@function.outer", "function")
map_move_start("]b", "[b", "@block.outer", "block")
map_move_end("]B", "[B", "@block.outer", "block")
map_move_start("]a", "[a", "@parameter.inner", "argument")

-- Handles multi-capture for loops and conditionals under one shortcut
vim.keymap.set({ "n", "x", "o" }, "]o", function()
  move.goto_next_start({ "@conditional.outer", "@loop.outer" }, "textobjects")
end, { desc = "Go to next conditional/loop" })

vim.keymap.set({ "n", "x", "o" }, "[o", function()
  move.goto_previous_start({ "@conditional.outer", "@loop.outer" }, "textobjects")
end, { desc = "Go to previous conditional/loop" })
