set timeout timeoutlen=1000 ttimeoutlen=75

set expandtab

set tabstop=2
set shiftwidth=2
set softtabstop=0

set number
set nowrap
set nobackup

set title

" search
set ignorecase
set smartcase
set nowrapscan
set hlsearch

" calor schema
set t_Co=256
colorscheme molokai

" hight light trailing space
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

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
Plugin  'kana/vim-arpeggio.git'
Plugin  'kchmck/vim-coffee-script'

Plugin  'kannokanno/previm'
Plugin  'tyru/open-browser.vim'

Plugin  'rhysd/accelerated-jk'


syntax enable
filetype plugin indent on

" md as markdown, instead of modula2
autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown

au BufRead,BufNewFile *.rb set filetype=ruby

nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

call arpeggio#load() "arpeggioをこのvimrc内で有効にする
Arpeggio inoremap jk  <Esc>

" disable folding
set nofoldenable
