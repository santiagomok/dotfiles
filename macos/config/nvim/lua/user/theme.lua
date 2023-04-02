-- Set Colorscheme
-- vim.cmd([[
--     " set termguicolors
--     " access colors present in 256 colorspace
--     let base16colorspace=256  
--     colorscheme base16-helios
-- ]])
-- colorscheme base16-default-dark
-- colorscheme base16-nord
-- vim.cmd('colorscheme base16-nord')

-- Set colorscheme
vim.o.termguicolors = true
vim.cmd [[colorscheme onedark]]

-- Set lualine as statusline
-- See `:h lualine`
require('lualine').setup {
  options = {
    -- icons_enabled = false,
    theme = 'onedark',
    component_separators = '|',
    section_separators = '',
  }
}

-- Set tabline
-- require('tabline').setup {
--   show_icon = false,
--   brackets = {'',''}
-- }

-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help indent_blankline.txt`
require('indent_blankline').setup {
  char = '┊',
  show_trailing_blankline_indent = false,
}

-- Gitsigns
-- See `:help gitsigns.txt`
require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}

-- tmuxline
vim.g['tmuxline_powerline_separators'] = 0

-- tmux-navigator
vim.g['tmux_navigator_disable_when_zoomed'] = 1     -- Disable tmux navigator when zooming the Vim pane

-- floaterm
vim.g['floaterm_keymap_new'] = '<leader>fn'
vim.g['floaterm_keymap_toggle'] = '<leader>fm'
vim.g['floaterm_keymap_prev'] = '<leader>f{'
vim.g['floaterm_keymap_next'] = '<leader>f}'
vim.keymap.set('n', '<leader>mm', ':FloatermSend make DEBUG=1 -j8<cr>')
vim.keymap.set('n', '<leader>MM', ':FloatermSend make clean && make DEBUG=1 -j8')

-- vim-maximizer
vim.g['maximizer_default_mapping_key'] = '<F11>'

