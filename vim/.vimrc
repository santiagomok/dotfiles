" vim: set foldmethod=marker foldlevel=0 nomodeline:
" ============================================================================
" Santiago Mok (santiago.mok@gmail.com)
" .vimrc - Vim configuration file
"

let s:darwin = has('mac')

" Create a base autogroup that resets itself upon sourcing of the vimrc. 
" This means all autocmds that are in this group are cleared when the vimrc is 
" sourced, preventing them from piling up and slowing Vim down. 
augroup vimrc   
    autocmd!
augroup END

" ============================================================================
" PLUG PACKAGES {{{
" ============================================================================
call plug#begin('~/.vim/plugged')
" Color
Plug 'edkolev/tmuxline.vim'
Plug 'itchyny/lightline.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'chriskempson/base16-vim'
Plug 'chriskempson/vim-tomorrow-theme'

" Tmux
Plug 'junegunn/heytmux'
Plug 'christoomey/vim-tmux-navigator'
Plug 'roxma/vim-tmux-clipboard'
Plug 'melonmanchan/vim-tmux-resizer'
Plug 'benmills/vimux'

" Find
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-s': 'split',
    \ 'ctrl-l': 'vsplit' }

call plug#end()

" }}}

" ============================================================================
" PLUGIN SETTINGS {{{
" ============================================================================
" FZF plugin
set rtp+=~/.fzf/bin/fzf

if v:version >= 800
    packadd termdebug
    let g:termdebug_wide=1
endif

" Lightline and colors setting
"------------------------------------------------------------
" Startup Windows Size for GUI
"if has("gui_running")
"	set lines=80 columns=130
"endif
"
if has('termguicolors')
    set termguicolors
endif 

if has('nvim')
    let base16colorspace=256  " Access colors present in 256 colorspace
    " colorscheme base16-monokai
    colorscheme base16-helios
else
    if !has("gui_running")
    set t_Co=256
    endif
    if exists('g:lightline')
        let g:lightline = {
            \ 'colorscheme': 'solarized',
            \ }
    endif

    " let g:solarized_termtrans=1
    let g:solarized_termcolors=256
    set background=dark
    colorscheme solarized8

    " colorscheme base16-monokai
endif

"" Highlight chars that go over the 120-column limit, trucate at 120 chars
"highlight OverLength ctermbg=red ctermfg=white guibg=red guifg=white
"match OverLength '\%121v.*'

" }}}

" ============================================================================
" APPEARANCE SETTINGS {{{
" ============================================================================
set tabstop=4       " Define <TAB> column width
set softtabstop=4   " Affect what happen when <TAB> or <BS> is pressed.
set shiftwidth=4    " Affect what happen for <<, >>, or == keys. Must be same as tabstop
set expandtab       " Convert \t into spaces when used with softtabstop.
set smartindent     " Automatically inserts one extra level of indentation in some cases.
set shiftround

" startline, Wrapping and scrolling
"------------------------------------------------------------
let &showbreak = '... '
set breakindent
set breakindentopt=sbr
set list
set listchars=tab:\|\ ,

" Search settings 
"------------------------------------------------------------
" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase
set incsearch
set hlsearch        
set path+=**        " Searches current directory recursively.

" Search color highlight
" augroup color_overrirde
    " autocmd!
    " autocmd ColorScheme * highlight Search ctermfg=LightCyan
                    " \   | highlight IncSearch ctermfg=Cyan
" augroup END

" Usability options
"------------------------------------------------------------
set number
set backspace=indent,eol,start
set wildignorecase
set history=10000
set confirm
set encoding=utf-8
set nostartofline
set visualbell
set t_vb=
set mouse=a
set cmdheight=2
set showcmd                 " Show partial commands in the last line of the screen
set clipboard=unnamed       " Make yank copy to the global system clipboard
" set clipboard=exclude:.*  " Do not use X clipboard to speed up start up time
set notimeout ttimeout ttimeoutlen=200 " Quickly time out on keycodes, but never time out on mappings
set nrformats=hex

" One of the most important options to activate. Allows you to switch from an
" unsaved buffer without saving it first. Also allows you to keep an undo
" history for multiple files. Vim will complain if you try to quit without
" saving, and swap files will keep you safe if your computer crashes.

set hidden
set relativenumber
augroup numbertoggle
    autocmd!
    " Set norelativenumber when in Insert mode
    au BufEnter,FocusGained,InsertLeave * set relativenumber
    au BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Split options
"------------------------------------------------------------
" set splitbelow 
" Remove pipes | that act as separators on splits
" set fillchars+=vert:\

" }}}

" ============================================================================
" RELOAD SETTINGS {{{
" ============================================================================
" Create a base autogroup that resets itself upon sourcing of the vimrc. 
" This means all autocmds that are in this group are cleared when the vimrc is 
" sourced, preventing them from piling up and slowing Vim down. 
augroup vimrc
    " Auto reload .vimrc on save 
    " autocmd! bufwritepost .vimrc source % 
    au BufWritePost vimrc,.vimrc nested if expand('%') !~ 'fugitive' | source % | endif

    " Automatically change the current directory to the file editing
    set autochdir
    autocmd BufEnter * silent! lcd %:p:h

    " File types
    " au BufNewFile,BufRead *.icc               set filetype=cpp
    " au BufNewFile,BufRead *.pde               set filetype=java
    " au BufNewFile,BufRead *.coffee-processing set filetype=coffee
    " au BufNewFile,BufRead Dockerfile*         set filetype=dockerfile

    " Included syntax
    " au FileType,ColorScheme * call <SID>file_type_handler()

    " Fugitive
    " au FileType gitcommit setlocal completefunc=emoji#complete
    " au FileType gitcommit nnoremap <buffer> <silent> cd :<C-U>Gcommit --amend --date="$(date)"<CR>

    " http://vim.wikia.com/wiki/Highlight_unwanted_spaces
    " au BufNewFile,BufRead,InsertLeave * silent! match ExtraWhitespace /\s\+$/
    " au InsertEnter * silent! match ExtraWhitespace /\s\+\%#\@<!$/

    " Unset paste on InsertLeave
    au InsertLeave * silent! set nopaste

    " Close preview window
    " if exists('##CompleteDone')
        " au CompleteDone * pclose
    " else
        " au InsertLeave * if !pumvisible() && (!exists('*getcmdwintype') || empty(getcmdwintype())) | pclose | endif
    " endif

    " Automatic rename of tmux window
    if exists('$TMUX') && !exists('$NORENAME')
        au BufEnter * if empty(&buftype) | call system('tmux rename-window '.expand('%:t:S')) | endif
        au VimLeave * call system('tmux set-window automatic-rename on')
    endif
augroup END

" Restore cursor to last known position
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction
augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END
" }}}

" ============================================================================
" KEY MAPPINGS {{{
" ============================================================================
" Rebind <Leader> key
let mapleader = ","

" Save 
nnoremap <leader>s  :update<cr>
nnoremap <leader>wa :wa<cr>

" Edit ~/.vimrc
" nnoremap <leader>vrc :tabnew $MYVIMRC<cr>
nnoremap <leader>vrc :tabnew $HOME/.vimrc<cr>
" disable recording
nnoremap q <Nop>

" Bind Ctrl+<movement> keys to move around the windows, instead of using
" Ctrl+w + <movement>
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
noremap <c-h> <c-w>h

" Split
nnoremap <leader>vv <c-w>v
nnoremap <leader>ss <c-w>s
nnoremap <silent> <C-Left>  :vertical resize -5<CR>
nnoremap <silent> <C-Right> :vertical resize +5<CR>
nnoremap <silent> <C-Up>    :resize -5<CR>
nnoremap <silent> <C-Down>  :resize +5<CR>

" buffers navigation
nnoremap <leader>B  :Buffers<CR>
nnoremap <leader>bb :ls<CR>:buffer<Space>
nnoremap <leader>sb :ls<CR>:sbuffer<Space>
nnoremap <leader>vb :ls<CR>:vert sbuffer<Space>
nnoremap <leader>tb :tabnew<CR>:ls<CR>:buffer<Space>
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>

" tab navigation
nnoremap <leader>tt :tabnew<CR>
nnoremap <leader>tf :tabfind<Space>
nnoremap <leader>tn :tabnext<CR>
nnoremap <leader>tp :tabprevious<CR>
nnoremap <leader>tm :tabmove<Space>

" file navigation
nnoremap <leader>F  :Files<CR>
nnoremap <leader>ff :Files ../<Space>
nnoremap <leader>fs :split<Space>
nnoremap <leader>fv :vsplit<Space>
" nnoremap <leader>ft :tabnew<Space>

" explorer - [N]% of page
nnoremap <leader>fe :15Lexplore<CR> 
nnoremap <leader>ee :15Explore<CR>
nnoremap <leader>se :15Sexplore<CR>
nnoremap <leader>ve :15Vexplore<CR>

" Command History
nnoremap <leader>H :History:<CR>

" replace the current word and all its occurrences
nnoremap <leader>rw :%s/\<<C-r><C-w>\>/
vnoremap <leader>rw y:%s/<C-r>"/
" replace the current word and all its occurrences
" pre-fill target word
nnoremap <leader>cw :%s/\<<C-r><C-w>\>/<C-r><C-w>
vnoremap <leader>cw y:%s/<C-r>"/<C-r>"

" sort
vnoremap <leader>st :sort<CR>

" perforce
nnoremap <leader>e :Vp4Edit<CR>
nnoremap <leader>R :Vp4Revert<CR>
nnoremap <leader>vp :Vp4

" tag
nnoremap <leader>] :CtrlPTag<CR>

" ConqueGDB 
nnoremap <leader>cg :ConqueGdb<Space>

" <F10> Tagbar toogle
if v:version >= 703
  inoremap <F10> <esc>:TagbarToggle<cr>
  nnoremap <F10> :TagbarToggle<cr>
  let g:tagbar_sort = 0
endif

" shift and selection
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation
map <Leader>a ggVG  " select all
nnoremap <leader>V <c-v> " vertical visual selection

" date
nnoremap <leader>dt a<C-R>=strftime('%m/%d/%Y')<CR><Esc>

" Remove highlighting after search
nnoremap <silent> <leader>h :noh<CR>

" <leader>n | NERD Tree
nnoremap <leader>n :NERDTreeToggle<cr>

" Insert Mode
" Exit insert-mode
imap <leader>i <Esc>
" Ctrl-e jump to the end of line in insert mode
inoremap <C-e> <C-o>$ 


" ----------------------------------------------------------------------------
" Vimux key bindings
" ----------------------------------------------------------------------------
map <leader>rr :VimuxPromptCommand<CR>
map <leader>rl :VimuxRunLastCommand<CR>
map <leader>rs :VimuxInspectRunner<CR>
map <leader>rz :VimuxZoomRunner<CR>

" ----------------------------------------------------------------------------
" <Esc>  
" ----------------------------------------------------------------------------
if has("nvim")
    " Esc from insert mode in terminal
    au TermOpen * tnoremap <Esc> <C-\><C-n>
    " Esc inside a FZF terminal window should exit the terminal window 
    " rather than going into the terminal's normal mode
    " au FileType fzf tnoremap <buffer> <Esc> <Esc>
    au FileType fzf tunmap <Esc>
endif


" ----------------------------------------------------------------------------
" <F2> | Paste toggle
" ----------------------------------------------------------------------------
set pastetoggle=<F2>

" ----------------------------------------------------------------------------
" <F3> | Color scheme selector
" ----------------------------------------------------------------------------
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

" Grepper
noremap <leader>/ :Grepper<CR>
noremap <leader>* :Grepper -cword -noprompt<CR>
" nmap gs <plug>(GrepperOperator)
" xmap gs <plug>(GrepperOperator)
"" Search word under cursor from current directory recursively
" map <F5> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
" Vim-Grepper setting
"------------------------------------------------------------
let g:grepper           = {}
let g:grepper.quickfix  = 1
let g:grepper.open      = 1
let g:grepper.switch    = 1
let g:grepper.prompt    = 1
let g:grepper.tools     = ['rg', 'git', 'grep', 'ack']
let g:grepper.stop      = 500
"let g:grepper.repo      = ['builtins.gmake']
"let g:grepper.dir       = 'repo,file'
let g:grepper.highlight = 1

" Netrw setting
"------------------------------------------------------------
let g:netrw_banner          = 0
let g:netrw_browse_split    = 4     " re-use same windows
let g:netrw_liststyle       = 3     
let g:netrw_altv            = 1     " vsplit right     
let g:netrw_preview         = 1     " vsplit preview 
"let g:netrw_alto            = 0     " control preview to topleft
let g:netrw_winsize         = 25    " 25% of page
let g:netrw_usetab          = 1

" }}}
