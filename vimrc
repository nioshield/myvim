" loaded the vundle settings
source ~/.vimrc.plug

" vim global config
set nu
set hlsearch
set incsearch
set nocompatible
set expandtab
set smartindent
set smartcase
set encoding=utf-8
set shiftwidth=4
set tabstop=4
set backspace=indent,eol,start
set t_Co=256
set foldmethod=manual
set colorcolumn=100 
set maxmempattern=10000
set tags=./.tags;,.tags

syntax on
filetype on
filetype indent on

" set mapleader
let mapleader=";"

" set clipboard copy
set clipboard=unnamed

nnoremap <S-tab> :cclose <CR>
nnoremap <leader>pa :set paste<CR>
nnoremap <leader>nopa :set nopaste<CR>

" choose your colorscheme
colorscheme molokai
hi ColorColumn ctermbg=232

" remember the cursor last open
" if takes no efforts, possible problem is that some files you DO NOT have access promession
autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
"====================================="

" vim ident
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_auto_colors=0
nmap <silent> <leader>hide :IndentGuidesToggle<CR>
hi IndentGuidesOdd  ctermbg=232
hi IndentGuidesEven ctermbg=233
"====================================="

