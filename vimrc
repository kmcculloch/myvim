" K. McCULLOCH VIMRC
" vim: foldmethod=marker

" PLUGINS ================================================================== {{{
" Overview of plugin structure from Learn Vimscript the Hard Way:
" http://learnvimscriptthehardway.stevelosh.com/chapters/42.html
" The two common plugin installers are Pathogen and Vundle. I use Vundle.

" Vundle works by adding all of the installed plugins to the runtimepath.
" The order of directories in the path determines the order in which scripts
" are loaded and applied.
" You can inspect the path using:
" :set runtimepath?
" The general execution order is:
" ~/.vim
" ~/.vim/bundle/{bundles_in_order_of_addition}
" $VIM/vimfiles
" $VIM/vimfiles/after
" ~/.vim/after
" ~/.vim/bundle/{bundles_in_order_of_addition}/after

" The after/ directory is a convention for overriding vim defaults and other
" plugins. If a plugin includes its own after/ directory it gets the last
" word, but this is rare.

" Initialize Vundle.
set nocompatible "use Vim (not Vi) option defaults
filetype off "required to initialize Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let vundle manage itself (required).
Plugin 'VundleVim/Vundle.vim'

" Essential plugins from scrooloose.
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'

" Other window-related plugins.
Plugin 'vim-airline/vim-airline'

" Colorscheme plugins.
Plugin 'altercation/vim-colors-solarized'
Plugin 'morhetz/gruvbox'

" Drupal.
" This will clone down the entire vimrc repo, which includes some top-level
" documentation.
" The plugin itself will wind up in bundle/vimrc/bundle/vim-plugin-for-drupal.
Plugin 'git://drupalcode.org/project/vimrc.git', {'rtp': 'bundle/vim-plugin-for-drupal'}

" My personal libraries.
Plugin 'kmcculloch/vim-cabbrevplus'
Plugin 'kmcculloch/vim-fancy-layout'
Plugin 'kmcculloch/vim-php'

call vundle#end()
" }}}
" FILETYPE ================================================================= {{{

" See :help filetype
" There are several discreet operations involved in filetype handling.
"
" The first is filetype detection. This is handled via filetype.vim files and
" files inside ftdetect/ directories.
" Vim will look inside its runtimepath for filetype.vim files.
" Next, it will look for ftdetect/ directories and run all of the files
" it finds.
" Note that it's also possible to do manually tweak the filetype using
" commands in files inside plugin/ directories which are always run when
" vim loads. The vimrc bundle for Drupal does this to append .drupal to
" certain files.
filetype on

" The next thing that happens is that vim sources ftplugin/ files whose names
" match the detected filetype. These set local buffer options.
filetype plugin on

" Next are indentation settings. These are files inside indent/ folders.
filetype indent on

" Very few filetypes have specialized indent files. Generally, indentation
" is based on general vim options.
" Here are the options for tabs:
set tabstop=2 "change the width of the tab character to x spaces
set expandtab "tell vim to insert spaces whenever the tab key is pressed
set softtabstop=2 "indicate how many spaces to use in lieu of a tab character

" Here are the options for autoindenting. Note that smartindent can interfere
" with file-specific indentation settings. The vimrc plugin always turns it
" on for .drupal files, but it interferes with scss indentation so I have
" disabled it in the after/ directory.
set shiftwidth=2 "indicate the number of characters used in autoindent
set autoindent "copy indent from current line when starting a new line
set nosmartindent "add an extra level of indentation for C-like files
set nocindent "more advanced C-like indentation

" Finally, vim loads files from the syntax/ directory to enable syntax
" highlighting.
syntax on
" }}}
" OPTIONS ================================================================== {{{
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

set linebreak "wrap long lines rather than entering line breaks

" this doesn't seem to work
set switchbuf=useopen "buffer exists in open window, jump there

set modeline
set modelines=5

" to set paste, go into insert mode then use the F2 key
set pastetoggle=<F2>

" }}}
" NORMAL MODE MAPPINGS ===================================================== {{{

" use the space bar as the mapleader key
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
" COLORSCHEME ============================================================== {{{

" in general we like a dark background
set background=dark
" be sure we're using all of our terminal's 256 colors
" NOTE: To get the best effect with Gruvbox, run the shell script to
" set the precise 256 color values that Gruvbox likes
set t_Co=256

" GRUVBOX
let g:gruvbox_italic=0
let g:gruvbox_contrast_dark="hard"

" SOLARIZED
let g:solarized_italic=0
let g:solarized_underline=0

" TURN ON COLORSCHEME OF CHOICE
:silent! colorscheme gruvbox
"colorscheme solarized

" }}}
" NERDCOMMENTER============================================================= {{{

let g:NERDCustomDelimiters = {
      \ 'php': {'left': '// ', 'leftAlt': '/*', 'rightAlt': '*/' }
      \ }

" }}}
" NERDTREE ================================================================= {{{

let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1

" }}}
" AIRLINE ================================================================== {{{

" Turn on airline's tabline extension to use the tabline to display buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_nr_format = '%s:'

" }}}
" SYNTASTIC ================================================================ {{{
let g:syntastic_php_checkers = ['php', 'phpcs']
let g:syntastic_javascript_checkers = ['eslint']
" @todo confirm that this respects the .csslintrc directives inside a project.
let g:syntastic_css_checkers = ['csslint']
let g:syntastic_sass_checkers = ['sass_lint']
let g:syntastic_scss_checkers = ['sass_lint']

" }}}
" CABBREV-PLUS ============================================================= {{{

:silent! call cabbrevplus#Cabbrev('nt', 'NERDTree')
:silent! call cabbrevplus#Cabbrev('nb', 'Bookmark')
:silent! call cabbrevplus#Cabbrev('nc', 'ClearBookmarks')
:silent! call cabbrevplus#Cabbrev('fi', 'FancyLayoutInit')

" Use our custom quit routines for all window/buffer delete commands
"call cabbrevplus#Cabbrev('bd', 'FancyLayoutQ')
"call cabbrevplus#Cabbrev('bw', 'FancyLayoutQ')
"call cabbrevplus#Cabbrev('bu', 'FancyLayoutQ')
"call cabbrevplus#Cabbrev('bun', 'FancyLayoutQ')
"call cabbrevplus#Cabbrev('q', 'FancyLayoutQ')
"call cabbrevplus#Cabbrev('wq', 'FancyLayoutWQ')

" }}}
