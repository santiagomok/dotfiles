" Filetype specific settings
" Language: Python 
"
setlocal tabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal autoindent
setlocal smarttab
setlocal formatoptions=croql


" run tests in current file
" nmap <LocalLeader>t  :!nosetests %<CR>
"
" " run/execute current file
" nmap <LocalLeader>r  :!python %<CR>
"
nmap <F5> :w <CR> :!clear; python % <CR>
nmap <F6> :w <CR> :!python % 

"set foldmethod=indent
let python_highlight_all=1

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

ab bang! #!/usr/bin/env python

