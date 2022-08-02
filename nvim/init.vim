lua << END
require('plugins')
require('lsp')
END

nnoremap <space>e :NvimTreeToggle<CR>
inoremap jk <Esc>

" Set Vim-specific sequences for RGB colors.
if exists('+termguicolors')
  set termguicolors
endif
colorscheme gruvbox

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

" nvim-lspconfig specifics.
autocmd FileType go autocmd BufWritePre <buffer> lua goimports(1000)
autocmd FileType c,cpp autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)

" Set commentstring.
autocmd FileType c,cpp,cs,java,p4 setlocal commentstring=//\ %s
