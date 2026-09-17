local add = MiniDeps.add

-- <C-hjkl> navigation between vim and tmux
add({
    source = 'alexghergh/nvim-tmux-navigation', 
})

require('nvim-tmux-navigation').setup({
    disable_when_zoomed = true, -- defaults to false
    keybindings = {
        left = "<C-h>",
        down = "<C-j>",
        up = "<C-k>",
        right = "<C-l>",
        last_active = "<C-\\>",
        next = "<C-Space>",
    }
})


add({
    source = 'akinsho/toggleterm.nvim',
})

-- require('floaterm').setup({
--     cmd = "FloatermToggle",
-- })

-- keys.map("n", "<C-t>", vim.cmd("FloatermToggle"), "Toggle floating terminal")
