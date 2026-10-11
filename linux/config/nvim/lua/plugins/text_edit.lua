-- Mini require theme.lua

-- load plugin
require('mini.ai').setup()
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



