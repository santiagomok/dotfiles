" Santiago Mok (santiago.mok@gmail.com)
" File: .vimrc - ViM configuration file
"
call plug#begin()

" Colors
Plug 'lifepillar/vim-solarized8'
Plug 'joshdick/onedark.vim'
Plug 'chriskempson/base16-vim'

Plug 'edkolev/tmuxline.vim'
Plug 'itchyny/lightline.vim'
if exists('g:lightline')
    let g:lightline = {
        \ 'colorscheme': 'solarized',
	    \ }
endif

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

Plug 'christoomey/vim-tmux-navigator'
Plug 'roxma/vim-tmux-clipboard'
Plug 'melonmanchan/vim-tmux-resizer'

Plug 'junegunn/heytmux'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-k': 'split',
    \ 'ctrl-l': 'vsplit' }

" Code
Plug 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims = 1

Plug 'tpope/vim-endwise'
Plug 'rstacruz/vim-closer'
Plug 'sheerun/vim-polyglot'
" Plugin 'ajh17/VimCompletesMe'
" autocmd FileType vim let b:vcm_tab_complete = 'vim'
" 
" Linter - ALE-cpp settings
"------------------------------------------------------------
Plug 'w0rp/ale'
let g:ale_linters = {'cpp': ['clang']}
let g:ale_cpp_gcc_options="-std=c++14 -I$LOCALPATH/include -I$HOME/Dev/boost"
" 
" Plugin 'junegunn/vim-easy-align'
" vmap <Enter> <Plug>(EasyAlign)
" nmap ga <Plug>(EasyAlign)
" xmap ga <Plug>(EasyAlign)
" 
Plug 'rust-lang/rust.vim'
let g:rustfmt_autosave = 1
let g:rust_clip_command = 'pbcopy'

" Plugin 'jiangmiao/auto-pairs'
" let g:AutoPairsFlyMode = 1
" let g:AutoPairsShortcutBackInsert = '<M-b>'

" Plugin 'vim-scripts/Conque-GDB'

" Ctags 
"------------------------------------------------------------
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
" With autochdir, tags are search from current directory of file upward
set tags=tags;
set tagstack
"set notagrelative
let g:tagbar_ctags_bin='/usr/bin/ctags'

"Plugin 'Valloric/YouCompleteMe'
"Plugin 'Valloric/ycmd'
" YouCompleteMe setting
"------------------------------------------------------------
" let g:ycm_python_binary_path = 'python3'

"Plugin 'octol/vim-cpp-enhanced-highlight'
"Plugin 'lyuts/vim-rtags', { 'for': ['c', 'cpp'] }
"Plugin 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

call plug#end()

if v:version >= 800
    packadd termdebug
endif

"------------------------------------------------------------
" FZF plugin
set rtp+=~/.fzf/bin/fzf

" Reload setting
"------------------------------------------------------------

" Create a base autogroup that resets itself upon sourcing of the vimrc. 
" This means all autocmds that are in this group are cleared when the vimrc is 
" sourced, preventing them from piling up and slowing Vim down. 
augroup vimrc   
    autocmd!
augroup END

" Auto reload .vimrc on save 
"autocmd! bufwritepost .vimrc source % 

" Automatically change the current directory to the file editing
set autochdir
autocmd BufEnter * silent! lcd %:p:h

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

" Lightline and colors setting
"------------------------------------------------------------
" if has("termguicolors")
    " set termguicolors
" endif
set laststatus=2
set background=dark
colorscheme solarized8
" colorscheme onedark
" colorscheme base16-default-dark

" if !has('gui_running')
    " set t_Co=256
" endif
" let g:solarized_termtrans=1

" Indentation settings 
"------------------------------------------------------------
set tabstop=4       " Define <TAB> column width
set softtabstop=4   " Affect what happen when <TAB> or <BS> is pressed.
set shiftwidth=4    " Affect what happen for <<, >>, or == keys. Must be same as tabstop
set expandtab       " Convert \t into spaces when used with softtabstop.
set smartindent     " Automatically inserts one extra level of indentation in some cases.
set shiftround

" Wrapping and scrolling
"------------------------------------------------------------
let &showbreak = '... '
set breakindent
set breakindentopt=sbr

" Search settings 
"------------------------------------------------------------
" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase
set incsearch
set hlsearch        " Search color highlight
augroup color_overrirde
    autocmd!
    autocmd ColorScheme * highlight Search ctermfg=LightCyan
                    \   | highlight IncSearch ctermfg=Cyan
augroup END

" Usability options
"------------------------------------------------------------
set number
set wildignorecase
set history=10000
set confirm                 
set nostartofline           
set visualbell
set t_vb=                   
set mouse=a                                            
set cmdheight=2
set showcmd                 " Show partial commands in the last line of the screen
" set clipboard=unnamedplus   " Make yank copy to the global system clipboard
" set clipboard=exclude:.*  " Do not use X clipboard to speed up start up time
set notimeout ttimeout ttimeoutlen=200 " Quickly time out on keycodes, but never time out on mappings

" One of the most important options to activate. Allows you to switch from an
" unsaved buffer without saving it first. Also allows you to keep an undo
" history for multiple files. Vim will complain if you try to quit without
" saving, and swap files will keep you safe if your computer crashes.
set hidden

" Key Mappings
"------------------------------------------------------------
" Rebind <Leader> key
let mapleader = ","

" Save 
nnoremap <leader>s  :update<cr>
nnoremap <leader>W  :wa<cr>

" Edit ~/.vimrc
nnoremap <leader>rc :tabnew $MYVIMRC<cr>
nnoremap <leader>R  :source $MYVIMRC<cr>

" Bind Ctrl+<movement> keys to move around the windows, instead of using
" Ctrl+w + <movement>
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
noremap <c-h> <c-w>h

" buffers navigation
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

" file navigation
nnoremap <leader>F  :Files<CR>
nnoremap <leader>ff :Files<Space>
nnoremap <leader>fs :split<Space>
nnoremap <leader>fv :vsplit<Space>
nnoremap <leader>ft :tabnew<Space>

" explorer - [N]% of page
nnoremap <leader>fe :15Lexplore<CR> 
nnoremap <leader>ee :15Explore<CR>
nnoremap <leader>se :15Sexplore<CR>
nnoremap <leader>ve :15Vexplore<CR>

" Command History
nnoremap <leader>H :History<CR>
nnoremap <F1> :Helptags<CR>

" sort
vnoremap <leader>st :sort<CR>

" tag
" nnoremap <leader>] :CtrlPTag<CR>

" ConqueGDB 
" nnoremap <leader>cg :ConqueGdb<Space>

" <F10> Tagbar toogle
inoremap <F10> <esc>:TagbarToggle<cr>
nnoremap <F10> :TagbarToggle<cr>
let g:tagbar_sort = 0

" shift and selection
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation
map <Leader>a ggVG  " select all

" date
nnoremap <leader>dt a<C-R>=strftime('%m/%d/%Y')<CR><Esc>

" Remove highlighting after search
nnoremap <silent> <leader>h :noh<CR>

" grep
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

""------------------------------------------------------------
"" Comment Box and Separators
":ab #l ###############################################################################
":ab #b /******************************************************************************
":ab #e ******************************************************************************/
"
"------------------------------------------------------------
" Filetype
"------------------------------------------------------------
"autocmd BufNewFile,BufRead alias set filetype=sh

"------------------------------------------------------------
" SCONS
"autocmd BufNewFile,BufReadPre SConstruct set filetype=python
"autocmd BufNewFile,BufReadPre SConscript set filetype=python

"------------------------------------------------------------
" JSON
"au BufRead,BufNewFile *.json set filetype=json
"au! Syntax json source ~/.vim/ftplugin/json.vim

