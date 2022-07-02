vim.cmd [[highlight BufferlineOffset guifg = '#80a0ff' guibg = '#21222C']]

require('bufferline').setup {
  options = {
    mode = "tabs", -- show tabpages
    indicator_icon = ' ',
    offsets = {
      {
        filetype = 'NvimTree',
        text = '  Files',
        highlight = 'BufferlineOffset',
        text_align = 'left',
      },
    },
    modified_icon = '',
    separator_style = 'thin',
    show_close_icon = false,
    custom_areas = {
      left = function()
        return {
          { text = '    ', guifg = '#8fff6d' },
        }
      end,
    },
  },
  highlights = {
    background = {
      guibg = { attribute = 'bg', highlight = 'TabLineFill' },
    },
    fill = {
      guibg = { attribute = 'bg', highlight = 'TabLineFill' },
    },
    tab = {
      guibg = { attribute = 'bg', highlight = 'TabLineFill' },
    },
    close_button = {
      guibg = { attribute = 'bg', highlight = 'TabLineFill' },
    },
    separator = {
      guibg = { attribute = 'bg', highlight = 'TabLineFill' },
    },
    modified = {
      guifg = { attribute = 'fg', highlight = 'DiffAdd' },
    },
    modified_selected = {
      guifg = { attribute = 'fg', highlight = 'DiffAdd' },
    },
  },
}

local keymap = require 'lib.utils'.keymap
keymap('n', 't[', ':BufferLineCyclePrev<cr>', {noremap = true, silent = false})
keymap('n', 't]', ':BufferLineCycleNext<cr>', {noremap = true, silent = true})
