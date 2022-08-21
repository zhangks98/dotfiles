lua << END
require('plugins')
require('lsp')
require('nvim-tree').setup()
require('lualine').setup()
require('indent_blankline').setup()
-- Colorscheme.
require('onedark').setup {
    style = 'warm'
}
require('onedark').load()
END

nnoremap <space>e :NvimTreeToggle<CR>

" Set Vim-specific sequences for RGB colors.
if exists('+termguicolors')
  set termguicolors
endif

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

" Language specifics.
autocmd FileType c,cpp autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd FileType p4 autocmd BufWritePre <buffer> %s/\s\+$//e

" Set commentstring.
autocmd FileType c,cpp,cs,java,p4 setlocal commentstring=//\ %s
