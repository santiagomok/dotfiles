local find_project_root = require('plugins.project')

-- Prompt shows only the last `n` directories of the picker cwd.
local function prompt_last_dirs(dir, n)
  local full = vim.fn.fnamemodify(dir, ':p'):gsub('/+$', '')
  local parts = vim.split(full, '/', { trimempty = true })
  local start_at = math.max(#parts - n + 1, 1)
  return table.concat(parts, '/', start_at) .. '/'
end

local function files_picker(opts)
  opts = opts or {}
  opts.cwd_prompt = false
  opts.prompt = prompt_last_dirs(opts.cwd or vim.uv.cwd(), 3)
  require('fzf-lua').files(opts)
end

vim.pack.add({ 
    { src = 'https://github.com/ibhagwan/fzf-lua' },
})

require('fzf-lua').setup({
  grep = {
    -- rg collects the lines. grep / grep_project / grep_cword then fuzzy-match them in fzf.
    -- <C-g> toggles the open picker to live ripgrep, where the prompt is a regex.
    rg_opts = '--column --line-number --no-heading --color=always --smart-case --max-columns=4096 -e',
  },
})

keymap.set('n', '<leader>F', function()
  files_picker()
end, 'Fzf-lua Find Files')

keymap.set('n', '<leader>ff', function()
  files_picker({ cwd = find_project_root() })
end, 'Find files from Root (.github/.vscode/p4) or ../..')

keymap.set('n', '<leader>B', function()
  require('fzf-lua').buffers()
end, 'Fzf-lua Buffers')

keymap.set('n', '<leader>/', function()
  require('fzf-lua').grep_project()
end, 'Fuzzy search (rg)')

keymap.set('n', '<leader>?', function()
  require('fzf-lua').blines()
end, 'Fuzzy Search Current Buffer')

keymap.set('n', '<leader>*', function()
  require('fzf-lua').grep_cword()
end, 'Grep word under cursor')

keymap.set('n', '<F2>', function()
  require('fzf-lua').keymaps()
end, 'List keymaps')

