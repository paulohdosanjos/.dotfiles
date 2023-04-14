vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.backspace = '2' --new line in insert mode
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true --write when exit (check)
vim.opt.cursorline = true
vim.opt.autoread = true

vim.opt.tabstop = 2 --number of spaces for <tab>
vim.opt.shiftwidth = 2 --number of spaces for (auto)ident
vim.opt.shiftround = true --(check)
vim.opt.expandtab = true --expand <tab> to spaces in insert mode

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>') --clear the search
vim.keymap.set('i', 'jj', '<Esc>')
vim.keymap.set('n', '<Space>w', ':w<CR>')
vim.keymap.set('i', '<Space>w', ':w<CR>')
vim.keymap.set('n', '<Space>q', ':q<CR>')
vim.keymap.set('i', '<Space>q', ':q<CR>')
