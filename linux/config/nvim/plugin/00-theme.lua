vim.pack.add({
    "https://github.com/navarasu/onedark.nvim",
})

-- Color Theme
require('onedark').setup({
  -- highlights = {
  --   Comment = { fg = '#ffffff', fmt = 'none' },
  -- },
  style = 'darker',
})

require('onedark').load()
