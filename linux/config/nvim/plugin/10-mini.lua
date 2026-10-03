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



