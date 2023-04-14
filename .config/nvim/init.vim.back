set tabstop=8 
set softtabstop=2
set shiftwidth=4
set expandtab
set smartindent
set relativenumber
set nu
"set nowrap
set nohlsearch
set hidden
set noerrorbells
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8
set clipboard+=unnamedplus "Always use the clipboard for operations

"Plugins
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'nvim-telescope/telescope.nvim'
Plug 'gruvbox-community/gruvbox'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'inkarkat/vim-unconditionalpaste'
call plug#end()

"NERDTree Settings
nmap <C-f> :NERDTreeToggle<CR>

"open NERDTree automatically
"autocmd VimEnter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif 

"shortcutting for split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
"j/k will move virtual lines(lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
"copy the rest of the line
noremap Y y$
" Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

"Alias to write and quit
nnoremap W :w<CR>
nnoremap Q :q<CR>


colorscheme gruvbox
highlight Normal guibg=none
inoremap jj <Esc>


"set Background
hi Normal guibg=NONE ctermbg=NONE
