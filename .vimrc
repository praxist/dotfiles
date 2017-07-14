" ======================== NeoBundle Setup ========================
" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if has('vim_starting')
 if &compatible
   set nocompatible               " Be iMproved
 endif

 " Required:
 set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" This plugin for Vim enable an auto-close chars feature for you. For instance if you type an '(', ``autoclose`` will automatically insert a ')' and put the cursor between than.
NeoBundle 'Townk/vim-autoclose'

" Conque is a Vim plugin which allows you to run interactive programs, such as bash on linux or powershell.exe on Windows, inside a Vim buffer. In other words it is a terminal emulator which uses a Vim buffer to display the program output.
NeoBundle 'vim-scripts/Conque-Shell'

" Fuzzy finder navigation
NeoBundle 'kien/ctrlp.vim'

" Visualize vim undo tree
NeoBundle 'sjl/gundo.vim'

" The matchit.vim script allows you to configure % to match more than just single characters.  You can match words and even regular expressions.
NeoBundle 'tmhedberg/matchit'

" Shortcuts for commenting code out
NeoBundle 'scrooloose/nerdcommenter'

" Navigation tree
NeoBundle 'scrooloose/nerdtree'

NeoBundle 'garbas/vim-snipmate'

" Syntax checking
NeoBundle 'scrooloose/syntastic'
NeoBundle 'godlygeek/tabular'

" Required by snipmate
NeoBundle 'tomtom/tlib_vim'

NeoBundle 'tony/tmux-config'

" Complex substitution via :%Subvert
NeoBundle 'tpope/vim-abolish'
NeoBundle 'MarcWeber/vim-addon-mw-utils'
NeoBundle 'tpope/vim-cucumber'
NeoBundle 'tpope/vim-endwise'

" Git commands
NeoBundle 'tpope/vim-fugitive'

NeoBundle 'tpope/vim-haml'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'tpope/vim-rails'

" repeat.vim: enable repeating supported plugin maps with \"."
" silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)
NeoBundle 'tpope/vim-repeat'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-surround'
NeoBundle 'nelstrom/vim-textobj-rubyblock'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'vimwiki/vimwiki'
NeoBundle 'mattn/calendar-vim'
NeoBundle 'vim-scripts/regreplop.vim'
" NeoBundle 'chrisbra/NrrwRgn'
" requires ctags
NeoBundle 'majutsushi/tagbar'
NeoBundle 'tomasr/molokai'
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" ======================== Configs  ========================

let mapleader=","
"{{{Auto Commands

" Automatically cd into the directory that the file is in
autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')


" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" Restore cursor position to where it was before
augroup JumpCursorOnEdit
   au!
   autocmd BufReadPost *
            \ if expand("<afile>:p:h") !=? $TEMP |
            \   if line("'\"") > 1 && line("'\"") <= line("$") |
            \     let JumpCursorOnEdit_foo = line("'\"") |
            \     let b:doopenfold = 1 |
            \     if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
            \        let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
            \        let b:doopenfold = 2 |
            \     endif |
            \     exe JumpCursorOnEdit_foo |
            \   endif |
            \ endif
   " Need to postpone using "zv" until after reading the modelines.
   autocmd BufWinEnter *
            \ if exists("b:doopenfold") |
            \   exe "normal zv" |
            \   if(b:doopenfold > 1) |
            \       exe  "+".1 |
            \   endif |
            \   unlet b:doopenfold |
            \ endif
augroup END

"}}}

map <leader>n :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
set grepprg=grep\ -nH\ $*
set wildignore=*.o,*~,*.pyc

filetype on " Automatically detect file types.
set nocompatible " no vi compatibility.
syntax enable
set cf " Enable error files & error jumping.
set clipboard+=unnamed " Yanks go on clipboard instead.
set history=500 " Number of things to remember in history.
set autowrite " Writes on make/shell commands
set ruler " Ruler on
set nu " Line numbers on
set timeoutlen=250 " Time to wait after ESC (default causes an annoying delay)
" Formatting
set ts=2 " Tabs are 2 spaces
set bs=2 " Backspace over everything in insert mode
set shiftwidth=2 " Tabs under smart indent
set nocp incsearch

set cindent
set cinoptions=:0,p0,t0,j1
set si
set cinwords=if,else,while,do,for,switch,case
set cinkeys="0{"

set formatoptions=tcqr
set autoindent
set smarttab
set expandtab
set smartindent



" Visual
set showmatch " Show matching brackets.
set mat=5 " Bracket blinking.
" Show $ at end of line and trailing space as ~
set lcs=tab:\ \ ,eol:$,trail:~,extends:>,precedes:<
set noerrorbells " No noise.
set laststatus=2 " Always show status line.
map <leader>pm :setlocal paste!<cr>
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l
function! HasPaste()
    if &paste
        return 'Paste Mode '
    en
    return ''
endfunction

set hidden
set wildmenu
set showcmd
set hlsearch
set ignorecase
set smartcase
set backspace=indent,eol,start
set nostartofline
set confirm
set visualbell
set t_vb=
set mouse=a
set cmdheight=2
set notimeout ttimeout ttimeoutlen=200
set pastetoggle=<F11>
set tabstop=2
set magic
nnoremap <CR> :noh<CR><CR>
nnoremap <leader>e :edit<CR><CR>
set t_Co=256
set background=dark
colorscheme molokai
set encoding=utf8
set ffs=unix,dos,mac
set nobackup
set nowb
set noswapfile
nnoremap j gj
nnoremap k gk
nmap <silent> <leader>sv :so $MYVIMRC<cr>
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabedit %<cr>
set guioptions=aem
if has ('gui_running')
  set guifont=Meslo\ LG\ M\ DZ\ Regular:h12
endif
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \ exe "normal! g`\"" |
     \ endif

map <C-l> <C-W>l
map <C-j> <C-W>j
map <C-h> <C-W>h
map <C-k> <C-W>k
map <leader>. <C-W>=
nnoremap <leader>pp diw"0P
nnoremap <leader>sp diw"0p
nnoremap <leader>qq :q<cr>
nnoremap <leader>ss :w<cr>
nnoremap <leader>wq :wq<cr>

nmap <silent> <C-P> <Plug>ReplaceMotion
nmap <silent> <C-P><C-P> <Plug>ReplaceLine
vmap <silent> <C-P> <Plug>ReplaceVisual


"esc
set timeout timeoutlen=1000 ttimeoutlen=100
inoremap jk <c-[>
inoremap jf <c-[>:w<cr>

"fast todo
map <leader>td o#TODO<Esc>
map <leader>tD O#TODO<Esc>

"\n insert
map <leader>j o<ESC>^

"map <leader>o :CtrlP<cr>
let g:ctrlp_map = '<leader>o'
map <leader>tb :TagbarToggle<cr>

au BufRead,BufNewFile *.py set filetype=python

" auto paste mode
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

au BufRead,BufNewFile *.wiki set filetype=vimwiki
:autocmd FileType vimwiki map <leader>d :VimwikiMakeDiaryNote<cr>
:autocmd FileType vimwiki map <leader>g :VimwikiDiaryGenerateLinks<cr>
function! ToggleCalendar()
  execute ":Calendar"
  if exists("g:calendar_open")
    if g:calendar_open == 1
      execute "q"
      unlet g:calendar_open
    else
      g:calendar_open = 1
    end
  else
    let g:calendar_open = 1
  end
endfunction
:autocmd FileType vimwiki map <leader>c :call ToggleCalendar()<cr>
