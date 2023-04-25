vim.g.UltiSnipsExpandTrigger = '<tab>' -- tecla para expandir o snippet
vim.g.UltiSnipsJumpForwardTrigger = '<tab>' -- tecla para saltar para o próximo campo de um snippet
vim.g.UltiSnipsJumpBackwardTrigger = '<s-tab>' -- tecla para voltar ao campo anterior de um snippet


vim.o.runtimepath = vim.o.runtimepath .. ',~/.config/nvim/snip'
vim.g.UltiSnipsSnippetDirectories = {"my_snippets", "UltiSnips"}



