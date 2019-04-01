# ViM Configuration

## Install Plugin
```bash
 $ stow -v .
 $ mkdir -p ~/.vim/bundle
 $ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
 $ vim +PluginInstall +qall
```

## Key Bindings
| Key | Description |
| :---: | :---  |
| Pane Navigation | |
| Ctrl+h    | Switch to pane: left |
| Ctrl+l    | Switch to pane: right |
| Ctrl+k    | Switch to pane: up |
| Ctrl+j    | Switch to pane: down |
| --- | |
| Buffers Navigation | |
| ,bb    | List buffers |
| ,sb    | Hsplit buffer | 
| ,vb    | Vsplit buffer | 
| ,tb    | Open buffer in new tab | 
| ,bn    | Next buffer |
| ,bp    | Previous buffer |
| --- | |
| ,[        | Switch to next tab |
| ,]        | Switch to previous tab |
| Ctrl+s    | Save |
| Ctrl+w T  | Open new tab |
| ,/        | Start grep command |
| ,\*       | Start grep for word under cursor |
| ,a        | Select all |
| ,h        | Clear highlight |
| ,s        | Sort |
| <         | Shift indent left |
| >         | Shift indent right |
| \<F9\>    | Toggle NERDTree |
| \<F10\>   | Toggle tagbar (for ctags) |



