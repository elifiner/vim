set nocompatible

behave mswin
source $VIMRUNTIME/mswin.vim
let mapleader=","

" Autoload package bundles
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set selection=inclusive
set ruler       " show the cursor position all the time
set showcmd     " display incomplete commands

filetype on
filetype plugin on
filetype indent on

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
if has("gui_running")
  colorscheme desert
else
  colorscheme torte
endif
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

" Enable line numbers
set number

" Mouse always enabled (also in terminal)
set mouse=a

" Maximize GUI
if has("gui_running")
  set lines=999 columns=999
endif

" Ctags configuration
set tags=~/mytags
