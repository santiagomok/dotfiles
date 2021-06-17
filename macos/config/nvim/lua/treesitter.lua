require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
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
        'cpp',
        'json',
        'python'
    },
}
