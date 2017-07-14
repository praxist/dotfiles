" Virtualenv support
NeoBundle 'jmcantrell/vim-virtualenv'

" PEP8 checking
NeoBundle 'nvie/vim-flake8'

" PEP8 auto-indentation
NeoBundle 'vim-scripts/indentpython.vim'

set tabstop=8
set expandtab
set shiftwidth=4
set softtabstop=4
set textwidth=79
set autoindent
set fileformat=unix
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
let python_highlight_all=1
