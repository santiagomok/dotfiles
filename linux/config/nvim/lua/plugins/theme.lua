vim.pack.add({
    "https://github.com/navarasu/onedark.nvim",
})

-- Color Theme
require('onedark').setup({
  style = 'darker',
  highlights = {
    Comment = { fg = '#a0a8b7', fmt = 'none' },  -- or keep italic: fmt ='italic'
    ['@comment'] = { fg = '#a0a8b7', fmt = 'none' },
    ['@comment.documentation'] = { fg = '#a0a8b7', fmt = 'none' },
  },
})

require('onedark').load()

-- Target ONLY Lua comments (e.g., Green text on a dark gray background)
-- vim.api.nvim_set_hl(0, "@comment.lua", { fg = "#00FF00", bg = "#222222" })
-- vim.api.nvim_set_hl(0, "@comment.lua", { fg = "#00FF00", bg = "NONE" })

-- Target ONLY Python comments (e.g., Red text, no background)
-- vim.api.nvim_set_hl(0, "@comment.python", { fg = "#FF0000", bg = "NONE" })

