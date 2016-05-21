" K. McCULLOCH VIMRC
" vim: foldmethod=marker
" to inspect local environment:
" http://vim.wikia.com/wiki/Displaying_the_current_Vim_environment

" OPTIONS ================================================================== {{{

set nocompatible "use Vim (not Vi) option defaults

filetype on "source .vim/filetype.vim
filetype plugin on "source .vim/ftplugin
filetype indent on "source .vim/indent
syntax on "source .vim/syntax

set nobackup "do not make a backup before overwriting a file
set noswapfile "do not use a swapfile for the buffer
set shortmess=atI "shorten various system messages
set visualbell "use the visual bell instead of beeping
set history=1000 "increase command-line history from 20 to 1000
set scrolloff=3 "scrolling offset of 3 lines at top/bottom
set timeout timeoutlen=3000 "set timeout gap for multi-key operations to 3 sec
set showcmd "show partial command in last line of the screen

" ignore search case when typing a lower-case search string
" note: This causes vimscript code to evaluate "foo" == "Foo" as true!
" http: //learnvimscriptthehardway.stevelosh.com/chapters/22.html
set ignorecase "causes foo to match foo, Foo, FOO
set smartcase "causes Foo only to match Foo
set incsearch "see results while typing
set hlsearch "search matches are highlighted
set nowrapscan "keep searches from wrapping around the end of the file

"set hidden "keep buffers loaded when they are abandoned
set nohidden
set confirm "prompt for save before unloading a modified buffer

set laststatus=2 "always show the status line

set statusline=%n: "buffer number
"set statusline+=%f "path to file, relative to directory where vim was launched
set statusline+=%t "filename only
set statusline+=%m "modified flag
set statusline+=\ %y "filetype in brackets
set statusline+=%= "right justify rest of status line
set statusline+=%l/%L "current line/total lines
set statusline+=\ %c "column number

set noruler "statusline takes precedence over ruler
set notitle "prefer to have username@hostname in bash window title per default

set number "turn on left-hand numbering
set numberwidth=5 "use 5 spaces for left-hand number column

set expandtab "use spaces instead of tab character
set tabstop=2 "tab stops calculated every 2 spaces

set autoindent "copy indent from current line when starting a new line
set smartindent "autoindent automatically based on syntax
set shiftwidth=2 "number of spaces to use for each step of autoindent

set linebreak "wrap long lines rather than entering line breaks

" this doesn't seem to work
set switchbuf=useopen "buffer exists in open window, jump there

set modeline
set modelines=5

" }}}
" NORMAL MODE MAPPINGS ===================================================== {{{

" use the space bar as the mapleader key
"nnoremap <Space> <Nop>
"let mapleader = " "
map <Space> <Leader>

" use the tab key for escape operations, such as cancelling prefix keys
" (eg. # for count)
nnoremap <tab> <Esc>

" make sure marks move us back to the specified location
nnoremap ' `

" reverse paste/insert line to default to above for lowercase p/o
nnoremap p P
nnoremap P p
nnoremap o O
nnoremap O o

" keep cursor from jumping over multiline rows
nnoremap j gj
nnoremap k gk

" use the shift key to enhance movement
nnoremap J 5j
nnoremap K 5k
nnoremap H 10h
nnoremap L 10l

" delete movement commands into the null register
nnoremap d "_d

" delete to the end of the line into the null register
nnoremap D "_D

" delete single characters into the null register
nnoremap x v"_d
nnoremap X hv"_d

" move up or down half a page, then center screen
nnoremap <Leader>f 24jzz
nnoremap <Leader>F 24kzz

" require a leader stroke to use J to concatenate lines
nnoremap <Leader>J J

" a leader stroke followed by d/D deletes lines in confusing ways
nnoremap <Leader>d <Nop>
nnoremap <Leader>D <Nop>

" use u/U to make a word lower/upper case
nnoremap <Leader>U vawgU
nnoremap <Leader>u vawgu

" always search in "very magic" mode
nnoremap / /\v

" clear previous search string
nnoremap <Leader><Space> :let<Space>@/<Space>=<Space>""<CR>

" enter insert mode ready to append to the end of a line
nnoremap <Leader>a $a

" enter insert mode ready to prepend to the start of a line
nnoremap <Leader>i ^i

" insert a single character at the cursor point
nnoremap <Leader>r i_<Esc>r

" use the leader to move between windows
nnoremap <Leader>j <C-W><C-J>
nnoremap <Leader>k <C-W><C-K>
nnoremap <Leader>h <C-W><C-H>
nnoremap <Leader>l <C-W><C-L>

" change contents of parentheses, brackets, quotes, etc.
nnoremap <Leader>c( vi(c
nnoremap <Leader>c[ vi[c
nnoremap <Leader>c{ vi{c
nnoremap <Leader>c" vi"c
nnoremap <Leader>c' vi'c
nnoremap <Leader>c< vi<c

" open and edit .vimrc
nnoremap <leader>ev :edit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" when cursor is on word, use F10 to get info about syntax highlighting
nnoremap <F9> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Set a given window width to the proper width for code editing
" 87 = 80 chars + 5 for line numbers + 2 for marks
nnoremap <Leader>wf :vertical resize 87<CR>:set winfixwidth<CR>

" Display window width
nnoremap <Leader>wd :echo 'Window width: ' . winwidth(0)<CR>
nnoremap <Leader>wn :echo 'Window number: ' . winnr()<CR>

" }}}
" INSERT MODE MAPPINGS ===================================================== {{{

" exit insert mode and restore cursor position (no move left)
inoremap <tab> <Esc>`^

" in insert mode, use the Esc key for tabs
"inoremap <Esc> <tab>

" use ctrl-u to make a word upper case in insert mode
inoremap <c-u> <esc>vawgUi

" }}}
" VISUAL MODE MAPPINGS ===================================================== {{{

" in visual mode, cancel any selection (gV prevents automatic reselection)
vnoremap <tab> <Esc>gV

" delete into the null register
vnoremap D "_d

" duplicate normal mode movement commands
vnoremap J 5j
vnoremap K 5k
vnoremap H 10h
vnoremap L 10l
xnoremap <Leader>f 24jzz
xnoremap <Leader>F 24kzz

" }}}
" OPERATOR-PENDING MODE MAPPINGS =========================================== {{{

" cancel any operator-pending command
onoremap <tab> <Esc>

" }}}
" COMMAND MAPPINGS ========================================================= {{{

" use W to save file as sudo
" commented out; interferes with NerdTREE grepping for words that start with
" "W". @todo fix?
"cmap W w !sudo tee % >/dev/null<CR>

" }}}
" CUSTOM AUTOCMDS  ========================================================= {{{

" fold settings.php comments
augroup settings_php
  autocmd!
  autocmd BufRead settings.php setlocal foldmethod=syntax
augroup END

" }}}