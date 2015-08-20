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


runtime macros/matchit.vim

" vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'slim-template/vim-slim.git'
" Plugin 'vim-ruby/vim-ruby.git'
Plugin 'kana/vim-arpeggio.git'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mrk21/yaml-vim'

Plugin 'kannokanno/previm'
Plugin 'tyru/open-browser.vim'

Plugin 'rhysd/accelerated-jk'

call arpeggio#load() "arpeggioをこのvimrc内で有効にする
Arpeggio inoremap jk  <Esc>

nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

" syntax
syntax on
filetype plugin indent on

autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} setf markdown
autocmd BufNewFile,BufRead *.rb setf ruby
autocmd BufNewFile,BufRead Gemfile setf ruby
autocmd BufNewFile,BufRead *.slim setf slim
autocmd BufNewFile,BufRead *.{yml,yaml} setf yaml

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\""

" disable folding
set nofoldenable
