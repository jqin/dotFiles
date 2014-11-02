" pathogen
execute pathogen#infect()

" smarter tabs
let g:airline#extensions#tabline#enabled = 1

" mouse mode
if has('mouse')
    set mouse=a
endif

" highlight search terms
set hlsearch
set incsearch
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

filetype on
filetype plugin on
filetype indent on

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
set background=dark
set diffopt+=vertical
set scrolloff=10

syntax on
set t_Co=256
colorscheme xoria256-pluk
"colorscheme zenburn

" Toggle between source/header file
map <F4> :e %:p:s,.h$,.X123X,:s,.cc$,.h,:s,.X123X$,.cc,<CR>

" vim tabs
map <C-h> <Esc>:tabprev<CR>
map <C-l> <Esc>:tabnext<CR>

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

