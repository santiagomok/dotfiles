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
| *Pane Navigation* | |
| Ctrl+h    | Switch to pane: left |
| Ctrl+l    | Switch to pane: right |
| Ctrl+k    | Switch to pane: up |
| Ctrl+j    | Switch to pane: down |
| --- | |
| Buffers Navigation | |
| ,bb       | List buffers |
| ,sb       | Hsplit buffer | 
| ,vb       | Vsplit buffer | 
| ,tb       | Open buffer in new tab | 
| ,bn       | Next buffer |
| ,bp       | Previous buffer |
| --- | |
| Tab Navigation | |
| ,tt       | New tab |
| ,tf       | Tab find | 
| ,tn       | Next tab | 
| ,tp       | previous tab | 
| --- | |
| File Navigation | |
| ,ff       | Vsplit file search|
| ,fs       | Hsplit | 
| ,fv       | Vsplit |
| ,ft       | New tab | 
| --- | |
| Explore | |
| ,ee       | Explore directory of current file |
| ,se       | HSplit and explore | 
| ,ve       | Vsplit and explore |
| --- | |
| Ctrl+s    | Save |
| ,]        | Ctrl+P Tag |
| ,/        | Start grep command |
| ,\*       | Start grep for word under cursor |
| ,a        | Select all |
| ,cg       | Run ConqueGDB |
| ,e        | Vp4 Edit |
| ,h        | Clear highlight |
| ,s        | Sort |
| <         | Shift indent left |
| >         | Shift indent right |
| \<F10\>   | Toggle tagbar (for ctags) |



