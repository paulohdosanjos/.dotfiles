--Options
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.backspace = '2' --new line in insert mode
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true --write when exit (check)
vim.opt.cursorline = true
vim.opt.autoread = true
vim.opt.number = true
vim.opt.relativenumber = true

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

--placing empty lines with enter
vim.keymap.set('n', '<CR>', 'm`o<Esc>``')
vim.keymap.set('n', '<S-CR>', 'm`O<Esc>``')

--start/end of line
map('n','H','^')
map('n','L','$')

--buffers switching
map('n','<Tab>',':bn<CR>')
map('n','<s-Tab>',':bp<CR>')

--window resizing ****TO BE CORRECTED*****
map('n','<C-w><Up>',':resize +3<cr>')
map('n','<C-w><Down>',':resize -3<cr>')
map('n','<C-w><Left>',':vertical resize +3<cr>')
map('n','<C-w><Right>',':vertical resize -3<cr>')
--switching windows
for i = 1, 6 do
  local lhs = "<leader>" .. i
  local rhs = i .. "<c-w>w"
  vim.keymap.set("n", lhs, rhs, { desc = "Move to window " .. i })
end


-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", "[[\"+y]]")

vim.keymap.set({"n", "v"}, "<leader>d", "[[\"_d]]")

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
----window navigation with c-hjkl
--map({"n","v","i"}, "<C-h>", "<C-w>h")
--map({"n","v","i"}, "<C-l>", "<C-w>l") --i think kitty is capturating 
--map({"n","v","i"}, "<C-j>", "<C-w>j")
--map({"n","v","i"}, "<C-k>", "<C-w>k")

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
