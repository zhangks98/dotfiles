" Specify a directory for plugins.
call plug#begin(stdpath('data') . '/plugged')

" Make sure you use single quotes
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'

Plug 'nvim-lualine/lualine.nvim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'morhetz/gruvbox'

Plug 'neovim/nvim-lspconfig' " Collection of configurations for built-in LSP client
Plug 'vim-denops/denops.vim'
Plug 'Shougo/ddc.vim'
Plug 'Shougo/ddc-nvim-lsp'
Plug 'Shougo/ddc-matcher_head'
Plug 'Shougo/ddc-sorter_rank'

Plug 'zhangks98/vim-p4'

" Initialize plugin system.
call plug#end()

" Set Vim-specific sequences for RGB colors.
if exists('+termguicolors')
  set termguicolors
endif
colorscheme gruvbox

lua << END
require('lualine').setup()
END

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
autocmd FileType go autocmd BufWritePre <buffer> lua goimports(1000)
autocmd FileType c,cpp autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)

" Set commentstring.
autocmd FileType c,cpp,cs,java setlocal commentstring=//\ %s
