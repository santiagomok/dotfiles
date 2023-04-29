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
-- vim.g['floaterm_keymap_new'] = '<leader>fn'
-- vim.g['floaterm_keymap_toggle'] = '<leader>fm'
-- vim.g['floaterm_keymap_prev'] = '<leader>f{'
-- vim.g['floaterm_keymap_next'] = '<leader>f}'
-- vim.keymap.set('n', '<leader>mm', ':FloatermSend make DEBUG=1 -j8<cr>')
-- vim.keymap.set('n', '<leader>MM', ':FloatermSend make clean && make DEBUG=1 -j8')

-- vim-maximizer
vim.g['maximizer_default_mapping_key'] = '<F11>'

-- toggleterm config
-- see :h toggleterm
require('toggleterm').setup {
-- size can  be a number or function which is passed the current terminal
  size = 20,
  open_mapping = [[<C-t>]],
  -- on_create = fun(t: Terminal), -- function to run when the terminal is first created
  -- on_open = fun(t: Terminal), -- function to run when the terminal opens
  -- on_close = fun(t: Terminal), -- function to run when the terminal closes
  -- on_exit = fun(t: Terminal, job: number, exit_code: number, name: string), 
  -- function to run when terminal process exits
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  autochdir = true, -- when neovim changes it current directory the terminal will change it's own when next it's opened
  shade_terminals = true, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
  -- shading_factor = '-20', -- the percentage by which to lighten terminal background, default: -30 (gets multiplied by -3 if background is light)
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
  persist_size = true,
  persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
  direction = 'float', -- 'vertical' | 'horizontal' | 'tab' | 'float',
  close_on_exit = true, -- close the terminal window when the process exits
   -- Change the default shell. Can be a string or a function returning a string
  shell = vim.o.shell,
  auto_scroll = true, -- automatically scroll to the bottom on terminal output
  -- This field is only relevant if direction is set to 'float'
  float_opts = {
    -- The border key is *almost* the same as 'nvim_open_win'
    -- see :h nvim_open_win for details on borders however
    -- the 'curved' border is a custom border type
    -- not natively supported but implemented in this plugin.
    --'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
    border = 'curved',
  },
}

-- toggleterm keymaps
function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function _lazygit_toggle()
  lazygit:toggle()
end

vim.keymap.set('n', '<C-g>', '<cmd>lua _lazygit_toggle()<CR>', {noremap = true, silent = true})

