require 'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = 'gnn',
            node_incremental = 'grn',
            scope_incremental = 'grk',
            scope_decremental = 'grj',
        }
    },
    ensure_installed = {
        'bash',
        'c',
        'cpp',
        'css',
        'cmake',
        'dockerfile',
        'dot',
        'go',
        'html',
        'json',
        'json5',
        'jsonc',
        'lua',
        'make',
        'markdown',
        'proto',
        'python',
        'toml',
        'vim',
        'yaml'
    },

    -- endwise
    endwise = {
      enable = true,
    },

    -- autotag
    autotag = {
      enable = true,
    },

    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
}
