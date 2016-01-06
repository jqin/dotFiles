" Plug
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/syntastic'
Plug 'majutsushi/tagbar'
Plug 'bling/vim-airline'
Plug 'mhinz/vim-signify'
Plug 'edkolev/tmuxline.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

filetype plugin indent on
call plug#end()

" Show list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
" Airline symbols
let g:airline_symbols = {}
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Let syntastic check on open as well
let g:syntastic_check_on_open=1

" mouse mode
if has('mouse')
    set mouse=a
endif

" highlight search terms
set hlsearch
set incsearch
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

set undolevels=1000
set nocompatible
set hidden
set backspace=2
set ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
set number
set cindent
set smartcase
set smartindent
set autoindent
set noexpandtab
set tabstop=8
set softtabstop=4
set shiftwidth=4
set ignorecase
set pastetoggle=<F12>
set laststatus=2
set showmode
set mousehide
set wildmenu
set cursorline
set background=dark
set diffopt+=vertical
set scrolloff=6
set splitbelow
set splitright
set noswapfile
set nobackup
set nowritebackup
set nowb

syntax on
set t_Co=256
colorscheme xoria256-pluk
let mapleader=','

" Toggle between source/header file
map <F4> :e %:p:s,.h$,.X123X,:s,.cc$,.h,:s,.X123X$,.cc,<CR>

" vim buffers
nmap <leader>h  :bp<CR>
nmap <leader>l  :bn<CR>
nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>

" Show trailing whitespace and spaces before a tab:
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\| \+\ze\t/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$\| \+\ze\t/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$\| \+\ze\t/

" cursor stuff
set guicursor=n-v-c:block-Cursor-blinkon0,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor,r-cr:hor20-Cursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

" Fix common spelling mistakes
iab teh       the
iab Teh       The
iab taht      that
iab Taht      That
iab alos      also
iab Alos      Also
iab aslo      also
iab Aslo      Also
iab becuase   because
iab Becuase   Because
iab bianry    binary
iab Bianry    Binary
iab bianries  binaries
iab Bianries  Binaries
iab charcter  character
iab Charcter  Character
iab charcters characters
iab Charcters Characters
iab exmaple   example
iab Exmaple   Example
iab exmaples  examples
iab Exmaples  Examples
iab shoudl    should
iab Shoudl    Should
iab seperate  separate
iab Seperate  Separate

fun! ShowFuncName()
  let lnum = line(".")
  let col = col(".")
  echohl ModeMsg
  echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW'))
  echohl None
  call search("\\%" . lnum . "l" . "\\%" . col . "c")
endfun
map <S-f> :call ShowFuncName() <CR>

" Local config
if filereadable("~/.vimrc.local")
    source ~/.vimrc.local
endif
