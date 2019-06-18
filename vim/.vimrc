" Santiago Mok (santiago.mok@gmail.com)
" .vimrc - Vim configuration file

" Plugin and Reload settings
"------------------------------------------------------------
set nocompatible              " not compatible with vi
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Edit
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'ngemily/vim-vp4'
Plugin 'roxma/vim-tmux-clipboard'
Plugin 'melonmanchan/vim-tmux-resizer'

" Color
Plugin 'edkolev/tmuxline.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'lifepillar/vim-solarized8'
" Plugin 'junegunn/seoul256.vim'
" Plugin 'guns/xterm-color-table.vim'

" Search
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }
Plugin 'ctrlpvim/ctrlp.vim'

" Code
Plugin 'tpope/vim-endwise'
Plugin 'rstacruz/vim-closer'
Plugin 'sheerun/vim-polyglot'
Plugin 'ajh17/VimCompletesMe'
Plugin 'w0rp/ale'
Plugin 'junegunn/vim-easy-align'
" Plugin 'jiangmiao/auto-pairs'
" Plugin 'vim-scripts/Conque-GDB'
" Plugin 'majutsushi/tagbar', { 'on': 'TagbarToggle' }

"Plugin 'Valloric/YouCompleteMe'
"Plugin 'Valloric/ycmd'
"Plugin 'octol/vim-cpp-enhanced-highlight'
"Plugin 'lyuts/vim-rtags', { 'for': ['c', 'cpp'] }
"Plugin 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

" Put your non-Plugin stuff after this line
"------------------------------------------------------------
"------------------------------------------------------------
"------------------------------------------------------------
" FZF plugin
set rtp+=~/.fzf/bin/fzf

if v:version >= 800
    packadd termdebug
endif

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
" Startup Windows Size for GUI
"if has("gui_running")
"	set lines=80 columns=130
"endif
"
if !has("gui_running")
    set t_Co=256
endif
if exists('g:lightline')
	let g:lightline = {
	    \ 'colorscheme': 'solarized',
	    \ }
endif
"let g:solarized_termcolors=256
let g:solarized_termtrans=1
set background=dark
colorscheme solarized8

"" Highlight chars that go over the 120-column limit, trucate at 120 chars
"highlight OverLength ctermbg=red ctermfg=white guibg=red guifg=white
"match OverLength '\%121v.*'

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
set clipboard=unnamedplus   " Make yank copy to the global system clipboard
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
nnoremap <leader>wa :wa<cr>

" Edit ~/.vimrc
nnoremap <leader>rc :tabnew $MYVIMRC<cr>

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
noremap <leader>tt :tabnew<CR>
noremap <leader>tf :tabfind<Space>
noremap <leader>tn :tabnext<CR>
noremap <leader>tp :tabprevious<CR>

" file navigation
noremap <leader>ff :vert sfind<Space>
noremap <leader>fs :split<Space>
noremap <leader>fv :vsplit<Space>
noremap <leader>ft :tabnew<Space>

" explorer - [N]% of page
noremap <leader>fe :15Lexplore<CR> 
noremap <leader>ee :15Explore<CR>
noremap <leader>se :15Sexplore<CR>
noremap <leader>ve :15Vexplore<CR>

" sort
vnoremap <leader>st :sort<CR>

" perforce
nnoremap <leader>e :Vp4Edit<CR>

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

" vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

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

" VimCompletesMe setting
"------------------------------------------------------------
autocmd FileType vim let b:vcm_tab_complete = 'vim'

" YouCompleteMe setting
"------------------------------------------------------------
" let g:ycm_python_binary_path = 'python3'

" Ctags 
"------------------------------------------------------------
" With autochdir, tags are search from current directory of file upward
set tags=tags;
set tagstack
"set notagrelative
let g:tagbar_ctags_bin='/usr/bin/ctags'
let g:ctrlp_root_markers = ['buildinfo.pm']
" AutoPair settings
"------------------------------------------------------------
" let g:AutoPairsFlyMode = 1
" let g:AutoPairsShortcutBackInsert = '<M-b>'

" NerdCommenter settings
"------------------------------------------------------------
let g:NERDSpaceDelims = 1

""------------------------------------------------------------
"" Windows Behavior
""source $VIMRUNTIME/mswin.vim
""behave mswin
"
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

