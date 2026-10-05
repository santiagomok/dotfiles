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


keymap.set('n', '<F11>', function() MiniMisc.zoom() end, 'Toggle maximize window')



