-- Enable 24-bit True Color
vim.opt.termguicolors = true

-- Mini Plugins
require('mini.basics').setup()
require('mini.icons').setup()

-- Setup the mini.icons injection before bufferline requires it
package.preload['nvim-web-devicons'] = function()
  require('mini.icons').setup({})
  require('mini.icons').mock_nvim_web_devicons()
  return package.loaded['nvim-web-devicons']
end


-- Color Theme
require('onedark').setup({
  style = 'darker',

  plugins = {
    mini = true,
    treesitter = true,
  },
  -- highlights = {
  --   Comment = { fg = '#a0a8b7', fmt = 'none' },  -- or keep italic: fmt ='italic'
  --   ['@comment'] = { fg = '#a0a8b7', fmt = 'none' },
  --   ['@comment.documentation'] = { fg = '#a0a8b7', fmt = 'none' },
  -- },
})
require('onedark').load()

-- Target ONLY Lua comments (e.g., Green text on a dark gray background)
-- vim.api.nvim_set_hl(0, '@comment.lua', { fg = '#00FF00', bg = '#222222' })
-- vim.api.nvim_set_hl(0, '@comment.lua', { fg = '#00FF00', bg = 'NONE' })

-- Target ONLY Python comments (e.g., Red text, no background)
-- vim.api.nvim_set_hl(0, '@comment.python', { fg = '#FF0000', bg = 'NONE' })

-- Tab lines
require('bufferline').setup({
  options = {
    mode = 'tabs', -- Switches the bar from showing buffers to showing native Vim tabs
    themable = true,
    show_buffer_icons = true,
    separator_style = 'slant',
  }
})
-- require('mini.tabline').setup({ show_icons = true }) 

require('mini.statusline').setup()

require('mini.misc').setup()
MiniMisc.setup_restore_cursor()
keymap.set('n', '<leader>Z', function() MiniMisc.zoom() end, 'Toggle maximize window')


-- Toggle Terminal
local term_origin = {}

vim.api.nvim_create_autocmd('WinLeave', {
  group = vim.api.nvim_create_augroup('ToggleTermOrigin', { clear = true }),
  desc = 'Remember cursor/view of the last non-terminal window',
  callback = function()
    if vim.bo.buftype ~= 'terminal' then
      term_origin = { win = vim.api.nvim_get_current_win(), view = vim.fn.winsaveview() }
    end
  end,
})

-- on_close runs before toggleterm closes the window, so defer the restore
local function restore_term_origin()
  vim.schedule(function()
    local origin = term_origin
    if origin.win and vim.api.nvim_win_is_valid(origin.win) then
      vim.api.nvim_set_current_win(origin.win)
      vim.fn.winrestview(origin.view)
    end
  end)
end

require('toggleterm').setup({
  on_close = restore_term_origin,
  size = 20,
  open_mapping = [[<C-t>]],
  hide_numbers = true,
  shade_filetypes = {},
  autochdir = false,
  shade_terminals = true,
  start_in_insert = true,
  insert_mappings = true,
  terminal_mappings = true,
  persist_size = true,
  persist_mode = true,
  direction = 'float',
  shell = vim.o.shell,
  auto_scroll = true,
  float_opts = {
    border = 'curved',
  },
})

local function set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

vim.api.nvim_create_autocmd('TermOpen', {
  pattern = 'term://*',
  group = vim.api.nvim_create_augroup('ToggleTermKeymaps', { clear = true }),
  desc = 'Window navigation and leave-terminal maps for terminal buffers',
  callback = set_terminal_keymaps,
})

local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = 'lazygit', hidden = true })

keymap.set('n', '<C-g>', function()
  lazygit:toggle()
end, 'Toggle lazygit')

