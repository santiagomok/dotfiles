-- Use 'mini.deps'. 
local add = MiniDeps.add

-- `now()` and `later()` are helpers for a safe two-stage
-- startup and are optional.
local now, later = MiniDeps.now, MiniDeps.later

-- Safely execute immediately
now(function()
  add({
    source = 'navarasu/onedark.nvim'
  })
  -- see colorscheme
  require('onedark').setup()
end)

now(function()
  vim.o.termguicolors = true
  vim.cmd('colorscheme onedark')
end)
now(function() require('mini.notify').setup() end)
now(function() require('mini.icons').setup() end)
now(function() require('mini.tabline').setup() end)
now(function() require('mini.statusline').setup() end)

-- Safely execute later
later(function() require('mini.ai').setup() end)
later(function() require('mini.comment').setup() end)
later(function() require('mini.surround').setup() end)

--
-- mini.extra

add("echasnovski/mini.extra")
require("mini.extra").setup()

-- Mappings
keys.map("n", "<Leader>fk", MiniExtra.pickers.keymaps, "Find keymaps")
keys.map("n", "<Leader>fs", MiniExtra.pickers.spellsuggest, "Find spelling")

keys.map("n", "<C-h>", function()
	MiniExtra.pickers.history({ scope = ":" })
end, "Filter command history")

keys.map("n", "<C-s>", function()
	MiniExtra.pickers.buf_lines({ scope = "current" })
end, "Find lines")

--
-- mini.pick
--
add("echasnovski/mini.pick")
require("mini.pick").setup({
	source = {
		show = require("mini.pick").default_show,
	},

	mappings = {
		refine = "<C-J>",
		choose_marked = "<C-Q>",
	},
})

-- Use mini.pick as the default selector in vim
vim.ui.select = MiniPick.ui_select

-- Mappings
keys.map("n", "<Leader><Space>", MiniPick.builtin.files, "Find files")
keys.map("n", "<Leader>z", MiniPick.builtin.resume, "Resume last picker")
keys.map("n", "<C-b>", MiniPick.builtin.buffers, "Find buffers")
keys.map("n", "<Leader>fh", MiniPick.builtin.help, "Find help")
keys.map("n", "<Leader>/", MiniPick.builtin.grep_live, "Find content")
keys.map("n", "<Leader>*", "<cmd>Pick grep pattern='<cword>'<cr>", "Grep string under cursor")

