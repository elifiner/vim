set nocompatible

behave mswin
source $VIMRUNTIME/mswin.vim

" Autoload package bundles
call pathogen#runtime_append_all_bundles()

set selection=inclusive
set ruler       " show the cursor position all the time
set showcmd     " display incomplete commands

filetype on
filetype plugin on

" Remember more commands and search history
set history=1000

" Keep more context when scrolling off the end of a buffer
set scrolloff=3

" Search options
set smartcase
set incsearch
set showmatch   " show matching parens
set hlsearch

set wildignore=*.o,*.obj,*.bak,*.exe,*.pyc,*.pyo,*~

" Black colorscheme
colorscheme desert
syntax on
syntax sync fromstart
let python_highlight_space_errors=1

set backspace=eol,start,indent

" Proper tab handling (insert spaces)
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set autoindent
set smarttab

" Mouse always enabled (also in terminal)
set mouse=a

" Disable arrow keys to learn to use HKJL
noremap  <Up> ""
noremap! <Up> <Esc>
noremap  <Down> ""
noremap! <Down> <Esc>
noremap  <Left> ""
noremap! <Left> <Esc>
noremap  <Right> ""
noremap! <Right> <Esc>
