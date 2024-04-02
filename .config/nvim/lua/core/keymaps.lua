--Options
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.backspace = '2' --new line in insert mode
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true --write when exit (check)
vim.opt.cursorline = true
vim.opt.autoread = true
--vim.opt.number = true
--vim.opt.relativenumber = true

vim.opt.scrolloff = 20 --minimal number of lines above/below cursos
vim.opt.tabstop = 2 --number of spaces for <tab>
vim.opt.shiftwidth = 2 --number of spaces for (auto)ident
vim.opt.shiftround = true --(check)
vim.opt.expandtab = true --expand <tab> to spaces in insert mode
vim.wo.wrap = true

--Keymaps
local map = vim.keymap.set

--General
map('n', '<leader>h', ':nohlsearch<CR>') --clear the search
map('i', 'jj', '<Esc>')
map('n', '<Space>w', ':w<CR>')
map('n', '<Space>q', ':q<CR>')

map('v','y','ygv<esc>') --cursor does not jumpt back to where you started the selection

--placing empty lines with Alt-j/k
vim.keymap.set('n', '<M-j>', 'm`o<Esc>``')
vim.keymap.set('n', '<M-k>', 'm`O<Esc>``')


--start/end of line
map('n','H','^')
map('n','L','$')

--buffers switching
map('n','<Tab>',':bn<CR>')
map('n','<s-Tab>',':bp<CR>')

--Better mouse movement
map({"n","v","i"}, "<RightMouse>", "<nop>")
map({"n","v","i"}, "<2-RightMouse>", "<nop>")
map({"n","v"}, "<ScrollWheelLeft>", "h")
map({"n","v"}, "<ScrollWheelDown>", "j")
map({"n","v"}, "<ScrollWheelUp>", "k")
map({"n","v"}, "<ScrollWheelRight>", "l")
map("", "<ScrollWheelLeft>", "<left>")
map("i", "<ScrollWheelRight>", "<right>")
map("i", "<ScrollWheelUp>", "<up>")
map("i", "<ScrollWheelDown>", "<down>")

--Beter movement inside wraped lines
map('n', 'j', 'gj')
map('n', 'k', 'gk')
map('v', 'j', 'gj')
map('v', 'k', 'gk')
