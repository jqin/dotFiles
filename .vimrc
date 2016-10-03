" Install vim-plug if missing
let pluginstall=system("[ -e ~/.vim/autoload/plug.vim ] ; echo $?")
if pluginstall != 0
  let temp=system("curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim")
  so ~/.vim/autoload/plug.vim
endif

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'                 " Used by lightline for git
Plug 'itchyny/lightline.vim'              " Bottom status bar
Plug 'edkolev/tmuxline.vim'               " Integration for tmux with lightline
Plug 'christoomey/vim-tmux-navigator'     " Navigate between vim and tmux
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'kana/vim-operator-user'             " Dependency for vim-operator-flashy
Plug 'haya14busa/vim-operator-flashy'     " Highlight yanked area
Plug 'octol/vim-cpp-enhanced-highlight'   " Enhanced C++ highlighting
Plug 'pearofducks/ansible-vim'            " Proper formatting for Ansible

filetype plugin on
call plug#end()

" Lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \   'readonly': 'LightLineReadonly',
      \   'modified': 'LightLineModified'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

function! LightLineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LightLineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return ""
  else
    return ""
  endif
endfunction

function! LightLineFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? ' '._ : ''
  endif
  return ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
       \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
       \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

" Highlight yanked area
map y <Plug>(operator-flashy)
nmap Y <Plug>(operator-flashy)$

" Mouse mode
if has('mouse')
    set mouse=a
endif

set hlsearch            " Hightlight search results
set incsearch           " Incremental search
set undolevels=1000     " Levels for undo
set nocompatible        " Enable the cool features of vim
set hidden
set backspace=2
set ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
set number              " Show line numbers
set cindent             " Use C indentation levels
set smartcase
set smartindent
set autoindent
set noexpandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set ignorecase
set pastetoggle=<F12>
set laststatus=2
set showmode
set mousehide
set wildmenu           " Visual complete for command menu
set cursorline         " Hightlight current line
set lazyredraw         " Redraw only when needed (speeds up macros)
set background=dark
set diffopt+=vertical
set scrolloff=6
set splitbelow
set splitright
set noswapfile
set nobackup
set nowritebackup
set nowb

" Clear out highlighted search results
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

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

fun! ShowFuncName()
  let lnum = line(".")
  let col = col(".")
  echohl ModeMsg
  echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW'))
  echohl None
  call search("\\%" . lnum . "l" . "\\%" . col . "c")
endfun
map <S-f> :call ShowFuncName() <CR>

nnoremap <silent> <Leader><Leader> :FZF -m<CR>

" Local config
if filereadable("~/.vimrc.local")
    source ~/.vimrc.local
endif
