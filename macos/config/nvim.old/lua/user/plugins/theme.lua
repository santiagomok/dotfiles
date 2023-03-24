-- Set Colorscheme
vim.cmd([[
    " set termguicolors
    " access colors present in 256 colorspace
    let base16colorspace=256  
    colorscheme base16-helios
    " let g:lightline = {
    "     \ 'colorscheme': 'Tomorrow_Night_Bright',
    "     \ }
]])
-- colorscheme base16-default-dark
-- colorscheme base16-nord
-- vim.cmd('colorscheme base16-nord')

-- vim.g['lightline'] = {'colorscheme': 'Tomorrow_Night_Bright'}


-- Set lualine as statusline
-- See `:h lualine`
require('lualine').setup {
  options = {
    theme = 'nord',
    component_separators = '|',
    section_separators = '',
  }
}

-- Set tabline
require('tabline').setup {
  show_icon = false,
  brackets = {'',''}
}

-- tmuxline
vim.g['tmuxline_powerline_separators'] = 0

-- tmux-navigator
vim.g['tmux_navigator_disable_when_zoomed'] = 1     -- Disable tmux navigator when zooming the Vim pane

-- floaterm
vim.g['floaterm_keymap_new'] = '<leader>fn'
vim.g['floaterm_keymap_toggle'] = '<leader>fm'
vim.g['floaterm_keymap_prev'] = '<leader>f{'
vim.g['floaterm_keymap_next'] = '<leader>f}'
vim.keymap.set('n', '<leader>mm', ':FloatermSend make DEBUG=1 -j8<cr>')
vim.keymap.set('n', '<leader>MM', ':FloatermSend make clean && make DEBUG=1 -j8')

-- vim-maximizer
vim.g['maximizer_default_mapping_key'] = '<F11>'

-- <F3> | Color scheme selector
-- vim.cmd([[
--     function! s:colors(...)
--     return filter(map(filter(split(globpath(&rtp, 'colors/*.vim'), "\n"),
--             \                  'v:val !~ "^/usr/"'),
--             \           'fnamemodify(v:val, ":t:r")'),
--             \       '!a:0 || stridx(v:val, a:1) >= 0')
--     endfunction
--
--     function! s:rotate_colors()
--     if !exists('s:colors')
--         let s:colors = s:colors()
--     endif
--     let name = remove(s:colors, 0)
--     call add(s:colors, name)
--     execute 'colorscheme' name
--     redraw
--     echo name
--     endfunction
--     nnoremap <silent> <F3> :call <SID>rotate_colors()<cr>
-- ]])
