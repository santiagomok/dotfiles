vim.pack.add({ 
    { src = 'https://github.com/nvim-mini/mini.nvim' },
})

-- vim.cmd.colorscheme('miniwinter')

-- load plugin
require('mini.basics').setup()
require('mini.icons').setup()
require('mini.ai').setup()
require('mini.pairs').setup()
require('mini.surround').setup()
require('mini.pick').setup()

--
require('mini.files').setup()
require('mini.snippets').setup()



-- mini.extra
--
-- add("echasnovski/mini.extra")
-- require("mini.extra").setup()
--
-- -- Mappings
-- keys.map("n", "<Leader>fk", MiniExtra.pickers.keymaps, "Find keymaps")
-- keys.map("n", "<Leader>fs", MiniExtra.pickers.spellsuggest, "Find spelling")
--
-- keys.map("n", "<C-h>", function()
-- 	MiniExtra.pickers.history({ scope = ":" })
-- end, "Filter command history")
--
-- keys.map("n", "<C-s>", function()
-- 	MiniExtra.pickers.buf_lines({ scope = "current" })
-- end, "Find lines")
--
-- --
-- -- mini.pick
-- --
-- add("echasnovski/mini.pick")
-- require("mini.pick").setup({
-- 	source = {
-- 		show = require("mini.pick").default_show,
-- 	},
--
-- 	mappings = {
-- 		refine = "<C-J>",
-- 		choose_marked = "<C-Q>",
-- 	},
-- })
--
-- -- Use mini.pick as the default selector in vim
-- vim.ui.select = MiniPick.ui_select
--
-- -- Mappings
-- keys.map("n", "<Leader><Space>", MiniPick.builtin.files, "Find files")
-- keys.map("n", "<Leader>z", MiniPick.builtin.resume, "Resume last picker")
-- keys.map("n", "<C-b>", MiniPick.builtin.buffers, "Find buffers")
-- keys.map("n", "<Leader>fh", MiniPick.builtin.help, "Find help")
-- keys.map("n", "<Leader>/", MiniPick.builtin.grep_live, "Find content")
-- keys.map("n", "<Leader>*", "<cmd>Pick grep pattern='<cword>'<cr>", "Grep string under cursor")

