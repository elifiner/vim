" Autoload package bundles
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set nocompatible

let mapleader=","

" Windows copy/paste equivalents
noremap <C-V> "+P
noremap <C-C> "+y
noremap <C-X> "+x
cnoremap <C-V> <C-R>+
inoremap <C-V> <ESC>"+p
inoremap <C-C> <ESC>"+y
inoremap <C-X> <ESC>"+x

set selection=exclusive
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

" Formatting options
set formatoptions=rol
set tabstop=4 shiftwidth=4 softtabstop=4 autoindent smarttab expandtab
autocmd FileType html,css,xml setlocal tabstop=2 shiftwidth=2 softtabstop=2

" Comment out blocks of code
function! CommentBlock()
  if getline(".") =~ '^'.b:lineComment.'\~'
    call setline(".", substitute(getline("."), "^".b:lineComment.'\~ ', "", ""))
  else
    call setline(".", substitute(getline("."), "^", b:lineComment."~ ", ""))
  endif
endfunction
noremap <silent> <M-/> :call CommentBlock()<CR>

autocmd FileType * let b:lineComment=""
autocmd FileType python let b:lineComment="#"
autocmd FileType vim let b:lineComment='"'

" Miscelaneous
set number
set mouse=a
set hidden
set guifont=Monospace\ 10

" Swap and backup files
set nobackup
set nowritebackup
set noswapfile

" Tagbar
let g:tagbar_left=1
let g:tagbar_width=30
let g:tagbar_foldlevel = 2

" Ctags configuration
set tags=./tags;/
set tags+=/home/elig/source/tlib/tags
set tags+=/home/elig/source/tests/tags
set tags+=/usr/local/lib/python2.7/tags

" Cscope configuration

set cscopequickfix=s-,c-,d-,i-,t-,e-
cscope add ~/cscope.python
set cscopetag
set nocscopeverbose  

" symbol: find all references to the token under cursor
nmap <silent> <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
" global: find global definition(s) of the token under cursor
nmap <silent> <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
" calls:  find all calls to the function name under cursor
nmap <silent> <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
" text:   find all instances of the text under cursor
nmap <silent> <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
" egrep:  egrep search for the word under cursor
nmap <silent> <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
" file:   open the filename under cursor
nmap <silent> <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
" includes: find files that include the filename under cursor
nmap <silent> <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
" called: find functions that function under cursor calls
nmap <silent> <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" Autocompletion on the command line
set wildchar=<Tab> wildcharm=<Tab> wildmenu wildmode=full

" Status bar
set laststatus=2 " Enables the status line at the bottom of Vim
set statusline=\ %F\ %m\ %{fugitive#statusline()}\ %=line\ %l\ col\ %c\ [%{getcwd()}]

" Miscelaneous
set noautochdir
set guioptions-=m  " remove menu bar
set guioptions-=T  " remove toolbar

" Error format detection
set errorformat+=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

" ******* Shortcuts ******* 

" git grep current word and open in quickfix window
noremap <Leader>gg :silent Ggrep <cword><CR>:copen<CR>
" git grep some text
noremap <Leader>gG :copen<CR>:Ggrep 
" git blame
noremap <Leader>gb :Gblame<CR>
" git diff
noremap <Leader>gd :Gdiff<CR>
" load vim configuration file
noremap <Leader>vl :e ~/.vim/vimrc<CR>
" save and reload vim configuration file
noremap <Leader>vs :w<CR>:so %<CR>
" remove trailing spaces in current file
noremap <Leader>sw :%s/\s\+$//e<CR>:nohl<CR>
" next error or grep result in quickfix window
noremap <F4> :copen<CR>:cnext<CR>
" previous error or grep result in quickfix window
noremap <S-F4> :copen<CR>:cprev<CR>
" show list of open buffers in a single line
noremap <C-B> :b <Tab>
" show list of open buffers in a menu
noremap <Leader>b :CommandTBuffer<CR>
" select a file from tlib sources
noremap <Leader>t :CommandT ~/source/tlib<CR>
" select a file from current directory
noremap <Leader>T :CommandT %:p:h<CR>
" run py.test on current file sending output to quickfix window
noremap <F5> :update<CR>:cexpr system('py.test --tb=short '.expand('%:p'))<CR>:cwindow<CR>
" run py.test on current file sending output to quickfix window
noremap <C-F5> :update<CR>:cexpr system('python2.7 '.expand('%:p'))<CR>:copen<CR>
" switch to next window
noremap <C-Tab> <C-W><C-W>
" switch to previous window
noremap <S-C-Tab> <C-W>W
" close all buffers
noremap <S-C-F4> :bufdo BD<CR>
" close current buffer
noremap <C-F4> :BD<CR>
" wrap line or visual at 100 chars (complements <S-J>
noremap <silent> <C-J> gqq
" autocompletion
inoremap <C-Space> <C-N>
" toggle Tagbar
nnoremap <silent> <F9> :TagbarToggle<CR>
" hide search highlight
nnoremap <silent> <Leader>/ :nohl<CR>
" change directory to directory of current file
noremap <silent> <Leader>d :cd %:p:h<CR>
" replace current word with yanked text
nnoremap S "_diwP
" replace selected text with yanked text
vnoremap S "_dP
" goto next tag (forward in tag stack, oppiste of Shift-T)
noremap <A-t> :tag!<CR>
" search selected text using *(star) search
vnoremap <silent> * "hy/<C-r>h<CR>

" ******* Commands ******* 
command! LargeFont set guifont=Monospace\ 16
command! SmallFont set guifont=Monospace\ 10
command! CD cd %:p:h
command! W w
