vim.g.tex_flavor = 'latex' -- Define o sabor padrão para LaTeX

vim.api.nvim_set_keymap('n', '<leader>c', ':VimtexCompile<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>v', ':VimtexView<CR>', { noremap = true, silent = true })

vim.g.vimtex_view_method = 'zathura' 

-- Define o comportamento padrão para o cursor ao abrir o visualizador
vim.g.vimtex_view_general_options = '-reuse-instance' 

-- Define a aparência do ícone do sinalizador de erro
vim.g.vimtex_quickfix_sign_error = '▶'
vim.g.vimtex_quickfix_sign_warning = '▶'

vim.g.vimtex_quickfix_mode=0
vim.opt.conceallevel = 1
vim.g.vimtex_conceal_level=1
vim.g.vimtex_conceal='abdmg'

