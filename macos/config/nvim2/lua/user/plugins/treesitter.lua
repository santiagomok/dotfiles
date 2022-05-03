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
        'go',
        'html',
        'json',
        'lua',
        'make',
        'markdown',
        'perl',
        'python',
        'rust',
        'toml',
        'verilog',
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
