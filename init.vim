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
Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'morhetz/gruvbox'
Plug 'tomasr/molokai'

Plug 'neovim/nvim-lspconfig' " Collection of configurations for built-in LSP client
Plug 'hrsh7th/nvim-cmp' " Autocompletion plugin
Plug 'hrsh7th/cmp-nvim-lsp' " LSP source for nvim-cmp
Plug 'saadparwaiz1/cmp_luasnip' " Snippets source for nvim-cmp
Plug 'L3MON4D3/LuaSnip' " Snippets plugin

Plug 'zhangks98/vim-language-p4'

" Initialize plugin system.
call plug#end()

" Set Vim-specific sequences for RGB colors.
if exists('+termguicolors')
  set termguicolors
endif
colorscheme gruvbox

let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.colnr = ' ℅:'

inoremap jk <Esc>

set mouse=a
set number
set relativenumber
set splitright
set splitbelow
set cursorline

" Set indentation.
set expandtab
set shiftwidth=2
set softtabstop=2
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
autocmd BufNewFile,BufRead *.py,*.p4 setlocal softtabstop=4 shiftwidth=4

nnoremap <C-t> :NERDTreeToggle<CR>

" nvim-lspconfig specifics.
source ~/.config/nvim/lsp.lua
autocmd BufWritePre *.go lua goimports(1000)
autocmd BufWritePre *.h,*.c,*.cc,*.cpp lua vim.lsp.buf.formatting_sync(nil, 1000)

" Set commentstring.
autocmd FileType c,cpp,cs,java setlocal commentstring=//\ %s
