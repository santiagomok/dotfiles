vim.pack.add({
    "https://github.com/navarasu/onedark.nvim",
})

-- load plugin
require('onedark').setup {
    style = 'darker'
}
require('onedark').load()
