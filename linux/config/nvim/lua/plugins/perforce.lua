vim.pack.add({
  { src = 'https://github.com/ngemily/vim-vp4' },
})

vim.g.vp4_perforce_executable = 'p4q'

keymap.set('n', '<leader><C-e>', ':Vp4Edit<cr>', 'p4 edit current file')
keymap.set('n', '<leader><C-c>', ':Vp4Change<cr>', 'p4 change description')
keymap.set('n', '<leader><C-R>', ':Vp4Revert<cr>', 'p4 revert current file')
keymap.set('n', '<F7>', ':Vp4Diff ', 'p4 diff current file')
keymap.set('n', '<F8>', ':Vp4Shelve<cr>', 'p4 shelve current file')
keymap.set('n', '<F9>', ':Vp4Filelog<cr>', 'p4 filelog current file')
keymap.set('n', '<leader>PP', ':Vp4', 'run p4 command')
