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

--
require('mini.snippets').setup()
require('mini.fuzzy').setup()

require('mini.statusline').setup()
require('mini.tabline').setup({ show_icons = false })
require('mini.misc').setup()
MiniMisc.setup_restore_cursor()

keymap.set('n', '<F11>', function() MiniMisc.zoom() end, 'Toggle maximize window')



