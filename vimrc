set nocompatible

behave mswin
let mapleader=","

" Windows copy/paste equivalents
noremap <C-V> "+P
noremap <C-C> "+y
noremap <C-X> "+x
inoremap <C-V> <ESC>"+p
inoremap <C-C> <ESC>"+y
inoremap <C-X> <ESC>"+x

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
nohlsearch

set wildignore=*.o,*.obj,*.bak,*.exe,*.pyc,*.pyo,*~

" Highlight extra whitespace in red
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+\%#\@<!$/

" Black colorscheme
if has("gui_running")
  colorscheme desert
else
  colorscheme torte
endif

syntax on
syntax sync fromstart
let python_highlight_space_errors=1
let g:pyflakes_use_quickfix=0

set backspace=eol,start,indent

" Proper tab handling (insert spaces)
set tabstop=4 shiftwidth=4 softtabstop=4 autoindent smarttab expandtab
autocmd FileType html,css,xml setlocal tabstop=2 shiftwidth=2 softtabstop=2

" SVG support
autocmd BufNewFile,BufRead *.svg setfiletype svg 

" Comment out blocks of code
function! CommentBlock(comment)
  if getline(".") =~ '^'.a:comment.'\~'
    call setline(".", substitute(getline("."), "^".a:comment.'\~ ', "", ""))
  else
    call setline(".", substitute(getline("."), "^", a:comment."~ ", ""))
  endif
endfunction

autocmd FileType python map <Leader>/ :call CommentBlock('#')<CR> 
autocmd FileType vim map <Leader>/ :call CommentBlock('"')<CR> 

" Miscelaneous
set number
set mouse=a
set hidden

" Ctags configuration
set tags=./tags;/
set tags+=/home/elig/source/tlib/tags
set tags+=/home/elig/source/tests/tags
set tags+=/usr/local/lib/python2.7/tags

" Autocompletion on the command line
set wildchar=<Tab> wildcharm=<Tab> wildmenu wildmode=full

" Shortcuts
noremap <Leader>gg :silent Ggrep <cword><CR>:copen<CR>
noremap <Leader>gG :copen<CR>:Ggrep
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gdiff<CR>
noremap <Leader>vl :e ~/.vimrc<CR>
noremap <Leader>vs :w<CR>:so %<CR>
noremap <Leader>sw :%s/\s\+$//e<CR>:nohl<CR>
noremap <F4> :cnext<CR>
noremap <S-F4> :cprev<CR>
noremap <C-B> :b <Tab>
noremap <C-Tab> <C-W><C-W>
noremap <S-C-Tab> <C-W>W
noremap <S-C-F4> :bufdo BD<CR>
noremap <C-F4> :BD<CR>
noremap <Leader>/ :nohl<CR>
noremap <C-J> :silent :set textwidth=100<CR>gw:set textwidth=0<CR>

" Autocompletion
inoremap <C-Space> <C-N>

" Status bar
set laststatus=2 " Enables the status line at the bottom of Vim
set statusline=\ %F\ %m\ %{fugitive#statusline()}\ %=line\ %l\ col\ %c\ [%{getcwd()}]
" Miscelaneous
set noautochdir
