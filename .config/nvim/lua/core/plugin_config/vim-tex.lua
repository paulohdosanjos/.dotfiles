vim.g.tex_flavor = 'latex' -- Define o sabor padrão para LaTeX

-- Mapeia as teclas para compilar o arquivo LaTeX
vim.api.nvim_set_keymap('n', '<leader>ll', ':VimtexCompile<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>lv', ':VimtexView<CR>', { noremap = true, silent = true })

-- Define a visualização padrão para o PDF gerado
vim.g.vimtex_view_method = 'zathura' -- Pode ser substituído por qualquer visualizador de PDF

-- Define o comportamento padrão para o cursor ao abrir o visualizador
vim.g.vimtex_view_general_options = '-reuse-instance' -- Pode ser substituído por outras opções

-- Define a aparência do ícone do sinalizador de erro
vim.g.vimtex_quickfix_sign_error = '▶'
vim.g.vimtex_quickfix_sign_warning = '▶'
