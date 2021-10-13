" Specify a directory for plugins.
call plug#begin(stdpath('data') . '/plugged')

" Make sure you use single quotes
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'

Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'nathanaelkane/vim-indent-guides'

Plug 'morhetz/gruvbox'

Plug 'neovim/nvim-lspconfig'

" Initialize plugin system.
call plug#end()

" Set Vim-specific sequences for RGB colors.
if exists('+termguicolors')
  set termguicolors
endif

colorscheme gruvbox

set number
set relativenumber
set splitright
set splitbelow

let g:indent_guides_enable_on_vim_startup = 1

" Set indentation.
set expandtab
set shiftwidth=2
set softtabstop=2
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
autocmd BufNewFile,BufRead *.py setlocal softtabstop=4 shiftwidth=4

nnoremap <C-t> :NERDTreeToggle<CR>

" neovim-lspconfig specifics
source ~/.config/nvim/lsp.vim
