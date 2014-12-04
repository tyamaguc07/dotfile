" support multi byte strings
scriptencoding utf-8

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

set title

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

" calor schema
set t_Co=256
colorscheme molokai

" infinite undo
if has('persistent_undo')
  set undodir=~/.vim/undo
  set undofile
endif

"
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\""

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

autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
autocmd BufNewFile,BufRead *.rb set filetype=ruby
autocmd BufNewFile,BufRead *.slim set filetype=slim
autocmd BufNewFile,BufRead *.{yml,yaml} set filetype=yaml

" hight light trailing space
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

" disable folding
set nofoldenable
