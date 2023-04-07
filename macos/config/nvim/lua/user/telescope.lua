local telescope = require 'telescope'
local actions = require 'telescope.actions'

local purple = '#BD93F9' -- DraculaPurple
local fg = '#F8F8F2' -- DraculaFg
local bg_light = '#343746' -- DraculaBgLight
local bg_lighter = '#44475A' -- DraculaSelection

-- vim.cmd("highlight TelescopeNormal guibg = '" .. bg_light .. "'")
-- vim.cmd("highlight TelescopeBorder guifg = '" .. bg_light .. "' guibg = '" .. bg_light .. "'")
-- vim.cmd("highlight TelescopePromptBorder guifg = '" .. bg_lighter .. "' guibg = '" .. bg_lighter .. "'")
-- vim.cmd("highlight TelescopePromptNormal guifg = '" .. fg .. "' guibg = '" .. bg_lighter .. "'")
-- vim.cmd("highlight TelescopePromptPrefix guifg = '" .. purple .. "' guibg = '" .. bg_lighter .. "'")

-- vim.cmd("highlight TelescopePromptTitle guifg = '" .. fg .. "' guibg = '" .. purple .. "'")
-- vim.cmd("highlight TelescopePreviewTitle guifg = '" .. fg .. "' guibg = '" .. purple .. "'")
-- vim.cmd [[highlight! link TelescopePromptTitle DraculaSearch]]
-- vim.cmd [[highlight! link TelescopePreviewTitle WildMenu]]
-- vim.cmd("highlight TelescopeResultsTitle guifg = '" .. bg_light .. "' guibg = '" .. bg_light .. "'")

-- vim.cmd [[highlight! link TelescopeBorder DraculaBgLight]]

local telescope_options = {
  defaults = {
    mappings = {
      i = {
        ['<esc>'] = actions.close,
        ['<C-Down>'] = actions.cycle_history_next,
        ['<C-Up>'] = actions.cycle_history_prev,
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
      n = { 
        ["cd"] = function(prompt_bufnr)
          local selection = require("telescope.actions.state").get_selected_entry()
          local dir = vim.fn.fnamemodify(selection.path, ":p:h")
          require("telescope.actions").close(prompt_bufnr)
          vim.cmd(string.format("silent lcd %s", dir))
        end
      }
    },
    file_ignore_patterns = { '.git/' },
    vimgrep_arguments = {
      "rg",
      "-L",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    path_display = { truncate = 1 },
    prompt_prefix = '   ',
    selection_caret = '  ',
    -- selection_strategy = 'reset'
    sorting_strategy = 'ascending',
    layout_strategy = 'horizontal',
    layout_config = {
      width = 0.8,
      height = 0.6,
      preview_cutoff = 120,
      horizontal = {
        prompt_position = 'top',
        results_width = 0.8,
        preview_width = 0.6
      }
    },
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    -- file_ignore_patterns = { "node_modules" },
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    -- Developer configurations: Not meant for general override
    -- buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
    -- mappings = {
    --   n = { ["q"] = require("telescope.actions").close },
    -- },
  }, -- end defaults
  pickers = {
    find_files = {
      hidden = true,
    },
    buffers = {
      previewer = false,
      layout_config = {
        width = 80,
      },
    },
    oldfiles = {
      prompt_title = 'History',
    },
    lsp_references = {
      previewer = false,
    },
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
  },
}

require('telescope').setup(telescope_options)

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- See `:help telescope.builtin`
local builtin = require('telescope.builtin')

local buffer_fuzzy_find = function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
  winblend = 10,
  previewer = false,
  })
end

local find_files_from = function() 
  path = '..'
  builtin.find_files({cwd=path, prompt_title = 'All Files'})
end

vim.keymap.set('n', '<leader>F',  builtin.find_files,   { desc = 'Find [F]iles' })
vim.keymap.set('n', '<leader>ff', find_files_from,      { desc = 'Find [f]iles [f]rom .. or env(ACDS_SRC_ROOT)/quartus'})
vim.keymap.set('n', '<leader>H',  builtin.oldfiles,     { desc = 'Find recently opened files' })
vim.keymap.set('n', '<leader>B',  builtin.buffers,      { desc = 'List [B]uffers' })
vim.keymap.set('n', '<leader>*',  builtin.grep_string,  { desc = '[*] Find current word' })
vim.keymap.set('n', '<leader>/',  builtin.live_grep,    { desc = '[/] Live Grep' })
vim.keymap.set('n', '<leader>?',  buffer_fuzzy_find,    { desc = '[?] Fuzzily search in current buffer]' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics,  { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<F1>',       builtin.help_tags,    { desc = 'Search Help' })
vim.keymap.set('n', '<F2>',       builtin.keymaps,      { desc = 'List normal mode keymappings' })

