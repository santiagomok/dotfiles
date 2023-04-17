vim.cmd [[highlight BufferlineOffset guifg = '#80a0ff' guibg = '#21222C']]

require('bufferline').setup {
  options = {
    mode = "tabs", -- show tabpages
    numbers = "buffer_id",
    diagnostics = "nvim_lsp",
    -- separator_style = "slant" or "padded_slant",
    separator_style = 'thin',
    indicator = {
      icon = ' ',
    },
    color_icons = true,
    modified_icon = '',
    show_close_icon = false,
    custom_areas = {
      left = function()
        return {
          { text = '    ', fg = '#8fff6d' },
        }
      end,
    },
    offsets = {
      {
        filetype = 'NvimTree',
        text = '  Files',
        highlight = 'BufferlineOffset',
        text_align = 'left',
      },
    },
  },
  -- highlights = {
  --   background = {
  --     bg = { attribute = 'bg', highlight = 'TabLineFill' },
  --   },
  --   fill = {
  --     bg = { attribute = 'bg', highlight = 'TabLineFill' },
  --   },
  --   tab = {
  --     bg = { attribute = 'bg', highlight = 'TabLineFill' },
  --   },
  --   close_button = {
  --     bg = { attribute = 'bg', highlight = 'TabLineFill' },
  --   },
  --   separator = {
  --     bg = { attribute = 'bg', highlight = 'TabLineFill' },
  --   },
  --   modified = {
  --     fg = { attribute = 'fg', highlight = 'DiffAdd' },
  --   },
  --   modified_selected = {
  --     fg = { attribute = 'fg', highlight = 'DiffAdd' },
  --   },
  -- },
}

vim.keymap.set('n', 't[', ':BufferLineCyclePrev<cr>', { desc = 'Tab Cycle Previous' })
vim.keymap.set('n', 't]', ':BufferLineCycleNext<cr>', { desc = 'Tab Cycle Next' })
