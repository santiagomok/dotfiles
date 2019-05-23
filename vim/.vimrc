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

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Edit
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'ngemily/vim-vp4'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'scrooloose/nerdcommenter'

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
Plugin 'kien/ctrlp.vim'

" Code
Plugin 'jiangmiao/auto-pairs'
" Plugin 'vim-scripts/Conque-GDB'
" Plugin 'majutsushi/tagbar', { 'on': 'TagbarToggle' }

"Plugin 'Valloric/YouCompleteMe'
"Plugin 'Valloric/ycmd'
"Plugin 'octol/vim-cpp-enhanced-highlight'
"Plugin 'lyuts/vim-rtags', { 'for': ['c', 'cpp'] }
"Plugin 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'

" Perforce
"Plugin 'vim-scripts/perforce.vim'

" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'

" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

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

" Create a base autogroup that resets itself upon sourcing of the vimrc. 
" This means all autocmds that are in this group are cleared when the vimrc is 
" sourced, preventing them from piling up and slowing Vim down. 
augroup vimrc   
    autocmd!
augroup END

" Put your non-Plugin stuff after this line
"------------------------------------------------------------

if v:version >= 800
    packadd termdebug
endif

" Reload setting
"------------------------------------------------------------
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

" Plugin settings
"------------------------------------------------------------
let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutBackInsert = '<M-b>'
let g:NERDSpaceDelims = 1
let g:ctrlp_root_markers = ['buildinfo.pm']

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

set backspace=indent,eol,start
set wildignorecase
set wildmenu
set autoread
set history=10000

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell.  If visualbell is set, and
" this line is also included, vim will neither flash nor beep.  If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Make yank copy to the global system clipboard
" set clipboard=unnamedplus
" Do not use X clipboard to speed up start up time
" set clipboard=exclude:.*

" Set the command window height to 2 lines, to avoid many cases of having to
" press <Enter> to continue
set cmdheight=2

" Display line numbers on the left
set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" One of the most important options to activate. Allows you to switch from an
" unsaved buffer without saving it first. Also allows you to keep an undo
" history for multiple files. Vim will complain if you try to quit without
" saving, and swap files will keep you safe if your computer crashes.
set hidden

" Show partial commands in the last line of the screen
set showcmd

" Use <F2> to toggle between 'paste' and 'nopaste'
" Disable formatting when pasting large chunks of code
set pastetoggle=<F2>

" FZF plugin
set rtp+=~/.fzf/bin/fzf

" Wrapping and scrolling
"------------------------------------------------------------
let &showbreak = '... '
set breakindent
set breakindentopt=sbr

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

" explorer
noremap <leader>ee :Explore<CR>
noremap <leader>se :Sexplore<CR>
noremap <leader>ve :Vexplore<CR>

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
let g:netrw_winsize         = 25    " 25% of page
let g:netrw_liststyle       = 3     

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

