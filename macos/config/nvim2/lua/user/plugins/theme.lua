local Plug = vim.fn['plug#']

Plug('itchyny/lightline.vim')

Plug('chriskempson/base16-vim')

-- vim.cmd([[
    -- " set termguicolors
    -- " Access colors present in 256 colorspace
    -- let base16colorspace=256  
    -- colorscheme base16-helios
    -- let g:lightline = {
        -- \ 'colorscheme': 'Tomorrow_Night_Bright',
        -- \ }
-- ]])
-- colorscheme base16-default-dark
-- colorscheme base16-nord

-- vim.g['lightline'] = {'colorscheme': 'Tomorrow_Night_Bright'}
--
-- Highlight chars that go over the 120-column limit, trucate at 120 chars
-- highlight OverLength ctermbg=red ctermfg=white guibg=red guifg=white
-- match OverLength '\%121v.*'


-- <F3> | Color scheme selector
vim.cmd([[
    function! s:colors(...)
    return filter(map(filter(split(globpath(&rtp, 'colors/*.vim'), "\n"),
            \                  'v:val !~ "^/usr/"'),
            \           'fnamemodify(v:val, ":t:r")'),
            \       '!a:0 || stridx(v:val, a:1) >= 0')
    endfunction

    function! s:rotate_colors()
    if !exists('s:colors')
        let s:colors = s:colors()
    endif
    let name = remove(s:colors, 0)
    call add(s:colors, name)
    execute 'colorscheme' name
    redraw
    echo name
    endfunction
    nnoremap <silent> <F3> :call <SID>rotate_colors()<cr>
]])
