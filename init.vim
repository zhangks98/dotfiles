" Use Homebrew Python3 as host program.
let g:python3_host_prog = '/usr/local/bin/python3'

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

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'lervag/vimtex'
Plug 'z0mbix/vim-shfmt', { 'for': 'sh' }

" Initialize plugin system.
call plug#end()

" Set Vim-specific sequences for RGB colors.
if exists('+termguicolors')
  let &t_8f = "\[38;2;%lu;%lu;%lum"
  let &t_8b = "\[48;2;%lu;%lu;%lum"
  set termguicolors
endif

colorscheme gruvbox

set number
set relativenumber

let g:indent_guides_enable_on_vim_startup = 1

" Set indentation
set expandtab
set shiftwidth=2
set softtabstop=2
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
autocmd BufNewFile,BufRead *.py setlocal softtabstop=4 shiftwidth=4

nnoremap <C-t> :NERDTreeToggle<CR>

" Go configs
let g:go_def_mapping_enabled = 0
let g:go_code_completion_enabled = 0
let g:go_doc_keywordprg_enabled = 0
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1

" Shell configs.
let g:shfmt_extra_args = '-i 2'
let g:shfmt_fmt_on_save = 1

" coc.nvim suggested configs.
source ~/.config/nvim/coc.vim
