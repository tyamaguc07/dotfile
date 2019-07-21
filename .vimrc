" support multi byte strings
scriptencoding utf-8

" vi互換無効
set nocompatible

augroup vimrc
  autocmd!
augroup END

set timeout timeoutlen=1000 ttimeoutlen=75

set expandtab

set tabstop=2
set shiftwidth=2
set softtabstop=0

set number
set nowrap
set nobackup
set ruler

set title

" status line
set laststatus=2
set statusline=%<%f\ %m%r%h%w
set statusline+=%{'['.(&fenc!=''?&fenc:&enc).']['.&fileformat.']'}
set statusline+=%=%l/%L,%c%V%8P

" カーソル行をハイライト
set cursorline
" " カレントウィンドウにのみ罫線を引く
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END

" ;でコマンド入力( ;と:を入れ替)
noremap ; :
noremap : ;

" search
set ignorecase
set smartcase
set nowrapscan
set hlsearch

" dont create sqap file
set noswapfile

" calor schema
set t_Co=256
colorscheme molokai

" infinite undo
if has('persistent_undo')
  set undodir=~/.vim/undo
  set undofile
endif

" hight light trailing space
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

" syntax
syntax on
filetype plugin indent on

" 折りたたみオフ
set nofoldenable
