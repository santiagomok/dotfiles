-- Config and keymap navigation for file explorer 
-- require 10-mini.lua - mini.nvim (mini.files, mini.pick, mini.extra)

-- Mini.files
-- require('mini.files').setup()

require('mini.files').setup({
--     -- Initialize mini.files with clean defaults and custom mapping toggles
--     -- Customization of mappings inside the file explorer
--     mappings = {
--         close       = 'q',
--         go_in       = 'l',
--         go_in_plus  = '',
--         go_out      = 'h',
--         go_out_plus = '-',
--         reset       = '',
--         show_help   = 'g?',
--         synchronize = '= ',
--         trim_left   = '<',
--         trim_right  = '>',
--     },
--
--     -- General UI options
--     -- Show preview
    -- windows = {
    --     max_number = math.huge,
    --     preview = true,
    --     width_focus = 30,
    --     width_nofocus = 15,
    --     width_preview = 45,
    --
    --   -- Dynamically position the window structure
    --   config = function()
    --       -- Calculate total layout grid sizes
    --       local screen_height = vim.o.lines - vim.o.cmdheight
    --       local screen_width = vim.o.columns
    --
    --       -- Set the max target height of your explorer layout
    --       local height = math.floor(screen_height * 0.6) -- 60% of screen height
    --       local width = math.floor(screen_width * 0.6)   -- 60% of screen width
    --
    --       return {
    --         relative = 'editor',
    --         anchor = 'NW',
    --         -- Calculate the exact starting points to center the grid box
    --         row = math.floor((screen_height - height) / 2),
    --         col = math.floor((screen_width - width) / 2),
    --         height = height,
    --         width = width,
    --         border = 'rounded', -- Looks clean for a floating center modal
    --       }
    --     end
    -- },
--
--     -- Configuration for operational options
--     options = {
--         use_as_default_explorer = true,
--     },
})

-- Mini.files Window Config
local window_config = function()
      -- Get total screen dimensions
      local screen_height = vim.o.lines - vim.o.cmdheight
      local screen_width = vim.o.columns
      -- This makes it take up roughly 60% of your screen height and width

      local height = math.floor(screen_height * 0.6)
      local width = math.floor(screen_width * 0.6)

      return {
        relative = 'editor',
        anchor = 'NW',
        -- 3. Mathematically calculate coordinates to center the window
        row = math.floor((screen_height - height) / 2),
        col = math.floor((screen_width - width) / 2),
        height = height,
        width = width,
        style = 'minimal',
        border = 'rounded', -- Clean looking border for centered floating modals
      }
end

-- Mini.files Keymaps to open and toggle the file explorer
vim.keymap.set('n', 'fm', function()
    if not MiniFiles.close() then
        MiniFiles.open(vim.api.nvim_buf_get_name(0))
    end
end, { desc = "Toggle mini.files (Current File)" })

vim.keymap.set('n', 'fM', function()
    if not MiniFiles.close() then
        MiniFiles.open(vim.fn.getcwd())
    end
end, { desc = "Toggle mini.files (Root Directory)" })

-- Mini.pick
-- require('mini.pick').setup()
require('mini.pick').setup({
  window = {
    config = window_config,
  },
  source = {
    -- Automatically turn previews ON bye default every Layout search
    preview = function(buf_id, item)
      require('mini.pick').default_preview(buf_id, item)
    end,
  }
})

-- Mini.extra
require("mini.extra").setup()

-- Helper function to find the project root dynamically
local function find_project_root()
  -- Begin crawling upward from the active file's folder (fallback to current dir)
  local current_dir = vim.fn.expand('%:p:h')
  if current_dir == '' then
    current_dir = vim.fn.getcwd()
  end

  -- Traverse upward to the system root "/" or "C:\"
  while current_dir and current_dir ~= vim.fs.dirname(current_dir) do
    -- Case 1: Check if the folder itself is named "p4"
    if vim.fs.basename(current_dir) == "p4" then
      return current_dir
    end

    -- Case 2 & 3: Check if the folder contains a .github or .vscode child
    local has_git = vim.loop.fs_stat(current_dir .. '/.git')
    local has_vscode = vim.loop.fs_stat(current_dir .. '/.vscode')

    if has_git or has_vscode then
      return current_dir
    end

    -- Move up one directory level
    current_dir = vim.fs.dirname(current_dir)
  end

  -- Fallback if no matching parents or indicators are found
  return os.getenv('ACDS_SRC_ROOT') or '..'
end


-- Keymaps
keymap.set('n', '<leader>F',  MiniPick.builtin.files, 'Find files')
keymap.set('n', '<leader>ff', function() 
    local root_path = find_project_root() 
    MiniPick.builtin.files(nil, { source = { cwd = root_path } })
end, 'Find files from Root (.github/.vscode/p4) or ACDS_SRC_ROOT')

keymap.set("n", "<leader>fe", MiniExtra.pickers.explorer, "Pick directory to open in mini.files")
keymap.set("n", "<Leader>fs", MiniExtra.pickers.spellsuggest, "Find spelling")
keymap.set('n', '<leader>H',  MiniExtra.pickers.oldfiles, 'Find recently opened files')
keymap.set('n', '<leader>B',  MiniPick.builtin.buffers, 'List buffers')
keymap.set('n', '<leader>/',  MiniPick.builtin.grep_live, 'Live grep')
keymap.set('n', '<leader>*', function() MiniPick.builtin.grep({ pattern = vim.fn.expand('<cword>') }) end, 'Grep word under cursor')
keymap.set('n', '<leader>?', function() MiniExtra.pickers.buf_lines({ scope = 'current' }) end, 'Fuzzy search in current buffer')
keymap.set('n', '<leader>sd', MiniExtra.pickers.diagnostic, 'Search diagnostics')
keymap.set('n', '<F1>', MiniPick.builtin.help, 'Search help')
keymap.set('n', '<F2>', MiniExtra.pickers.keymaps, 'List keymaps')
--
-- keys.map("n", "<C-h>", function()
-- 	MiniExtra.pickers.history({ scope = ":" })
-- end, "Filter command history")
--
-- keys.map("n", "<C-s>", function()
-- 	MiniExtra.pickers.buf_lines({ scope = "current" })
-- end, "Find lines")
--
-- --
-- -- mini.pick
-- --
-- add("echasnovski/mini.pick")
-- require("mini.pick").setup({
-- 	source = {
-- 		show = require("mini.pick").default_show,
-- 	},
--
-- 	mappings = {
-- 		refine = "<C-J>",
-- 		choose_marked = "<C-Q>",
-- 	},
-- })
--
-- -- Use mini.pick as the default selector in vim
-- vim.ui.select = MiniPick.ui_select
--
-- -- Mappings
-- keys.map("n", "<Leader>z", MiniPick.builtin.resume, "Resume last picker")
-- keys.map("n", "<Leader>fh", MiniPick.builtin.help, "Find help")
-- keys.map("n", "<Leader>/", MiniPick.builtin.grep_live, "Find content")
-- keys.map("n", "<Leader>*", "<cmd>Pick grep pattern='<cword>'<cr>", "Grep string under cursor")



-- Experimental
-- Control mini.files via a Custom Directory/Project Picker
-- local choose_in_explorer = function(item)
--   if not item then return end
--
--   -- Extract path string if item is a structured object table
--   local path = type(item) == "table" and item.text or item
--
--   -- If it's a file, get its containing directory
--   if vim.fn.filereadable(path) == 1 then
--     path = vim.fn.fnamemodify(path, ":h")
--   end
--
--   -- Close any open pickers, then safely schedule mini.files to open at the target location
--   vim.schedule(function()
--     require("mini.files").open(path)
--   end)
-- end
--
-- -- Example Mapping: Search files but open their location in mini.files
-- vim.keymap.set('n', '<leader>fp', function()
--   require('mini.pick').builtin.files({}, {
--     source = {
--       name = "Explore File Location",
--       choose = choose_in_explorer, -- Intercept selection behavior
--     }
--   })
-- end, { desc = "Find file to open in mini.files" })
--
-- Control mini.files directly from within mini.pickYou can also set up a hotkey inside your picker interface. This lets you fuzzy find files normally with mini.pick, but if you press a specific shortcut (like <C-e>), it cancels the standard file open action and redirects that specific path right into mini.files
-- require('mini.pick').setup({
--   mappings = {
--     -- Press Ctrl + e inside mini.pick to jump to that location in mini.files
--     reveal_in_explorer = {
--       char = '<C-e>',
--       func = function()
--         require('mini.pick').choose_with(function(item)
--           local path = type(item) == 'table' and item.text or item
--
--           -- Ensure we focus on a directory container structure
--           if vim.fn.filereadable(path) == 1 then
--             path = vim.fn.fnamemodify(path, ':h')
--           end
--
--           vim.schedule(function()
--             require('mini.files').open(path)
--           end)
--         end)
--       end,
--     },
--   },
-- })

