" Filetype specific settings
" Language: TCL

" TCL - Append Header to TCL Files
"------------------------------------------------------------
"autocmd bufnewfile *.tcl so /data/smok/depot/users/smok/templates/tcl/header.tcl
"autocmd bufnewfile *.tcl exe "1," . 10 . "g/File Name:.*/s//File Name: 	" .expand("%")
"autocmd bufnewfile *.tcl exe "1," . 10 . "g/Date Created:.*/s//Date Created:	" .strftime("%m-%d-%Y")
"autocmd Bufwritepre,filewritepre *.tcl execute "normal ma"

" autocmd Bufwritepre,filewritepre *.tcl exe \"1,\" . 10 . \"g/Last Modified:.*/s/Last Modified:.*/Last Modified:	\" .strftime("%c")
"autocmd bufwritepre,filewritepre *.tcl execute "normal `a"

