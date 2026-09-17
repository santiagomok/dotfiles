let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Developer/dotfiles/macos/config/nvim/lua/settings/plugins
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +0 ~/Developer/dotfiles/macos/config/nvim/lua/settings/plugins/terminal.lua
badd +0 ~/Developer/dotfiles/macos/config/nvim/lua/settings/plugins/mini.lua
argglobal
%argdel
$argadd terminal.lua
edit ~/Developer/dotfiles/macos/config/nvim/lua/settings/plugins/mini.lua
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
split
1wincmd k
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '1resize ' . ((&lines * 36 + 38) / 77)
exe '2resize ' . ((&lines * 36 + 38) / 77)
argglobal
balt ~/Developer/dotfiles/macos/config/nvim/lua/settings/plugins/terminal.lua
setlocal foldmethod=manual
setlocal foldexpr=v:lua.vim.treesitter.foldexpr()
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldenable
silent! normal! zE
let &fdl = &fdl
let s:l = 23 - ((20 * winheight(0) + 18) / 36)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 23
normal! 03|
wincmd w
argglobal
if bufexists(fnamemodify("~/Developer/dotfiles/macos/config/nvim/lua/settings/plugins/terminal.lua", ":p")) | buffer ~/Developer/dotfiles/macos/config/nvim/lua/settings/plugins/terminal.lua | else | edit ~/Developer/dotfiles/macos/config/nvim/lua/settings/plugins/terminal.lua | endif
if &buftype ==# 'terminal'
  silent file ~/Developer/dotfiles/macos/config/nvim/lua/settings/plugins/terminal.lua
endif
balt ~/Developer/dotfiles/macos/config/nvim/lua/settings/plugins/mini.lua
setlocal foldmethod=manual
setlocal foldexpr=v:lua.vim.treesitter.foldexpr()
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldenable
silent! normal! zE
let &fdl = &fdl
let s:l = 4 - ((3 * winheight(0) + 18) / 36)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 4
normal! 035|
wincmd w
2wincmd w
exe '1resize ' . ((&lines * 36 + 38) / 77)
exe '2resize ' . ((&lines * 36 + 38) / 77)
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
