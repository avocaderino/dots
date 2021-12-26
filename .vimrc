"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"               ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"               ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"               ██║   ██║██║██╔████╔██║██████╔╝██║
"               ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║
"                ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"                 ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Disable vi compatibility which can cause unexpected shit
set nocompatible

" Enable type file detection
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Highlight cursor line underneath the cursor horizontally.
set nocursorline

" Highlight cursor line underneath the cursor vertically.
set nocursorcolumn

" Add numbers to each line on the left-hand side.
set nonumber

" Show row and column number on last line
set noruler

" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

" Use space characters instead of tabs.
set expandtab

" Do not save backup files.
set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" While searching though a file incrementally highlight matching characters as you type
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set noshowmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=100

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Undofile
"set undodir=~/.vim/backup
"set undofile
"set undoreload=10000


" Theme ------------------------------------------------------------------ {{{

" Set Vim-specific sequences for RGB colors | enable true colors.
set termguicolors

" Set colorcheme.
"colorscheme base16-tomorrow-night

" Turn syntax highlighting on.
syntax on

" Highlights
hi Search   guibg=#282a2e
hi LineNr   guifg=#969896

" }}}


" Mappings --------------------------------------------------------------- {{{

" Set the backslash as the leader key.
let mapleader = '\'

" Press \\ to jump back to the last cursor position.
nnoremap <leader>\ ``

" Press \p to print the current file to the default printer from a Linux operating system.
" View available printers:   lpstat -v
" Set default printer:       lpoptions -d <printer_name>
" <silent> means do not display output.
nnoremap <silent> <leader>p :%w !lp<CR>

" Type jj to exit insert mode quickly.
inoremap jj <Esc>

" Press the space bar to type the : character in command mode.
nnoremap <space> :

" Pressing the letter o will open a new line below the current one.
" Exit insert mode after creating a new line above or below the current line.
nnoremap o o<esc>
nnoremap O O<esc>

" Center the cursor vertically when moving to the next word during a search.
nnoremap n nzz
nnoremap N Nzz

" Yank from cursor to the end of line.
nnoremap Y y$

" Paste at end of line
nnoremap P $p

" You can split the window in Vim by typing :split or :vsplit.
" Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l.
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Resize split windows using arrow keys by pressing:
" CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><

" }}}


" Vimscript -------------------------------------------------------------- {{{

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" Enable the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" If the current file type is HTML, set indentation to 2 spaces.
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab

" Don't display cursorline and cursorcolumn in split.
augroup cursor_off
    autocmd!
    autocmd WinLeave * set nocursorline nocursorcolumn
    autocmd WinEnter * set nocursorline nocursorcolumn
augroup END

" }}}


" Status line ------------------------------------------------------------ {{{

" The current mode.
let g:currentmode={
            \ 'n'  : 'NORMAL',
            \ 'v'  : 'VISUAL',
            \ 'V'  : 'V·LINE',
            \ '' : 'V·BLOCK',
            \ 's'  : 'SELECT',
            \ 'S'  : 'S·LINE',
            \ '' : 'S·BLOCK',
            \ 'i'  : 'INSERT',
            \ 'R'  : 'REPLACE',
            \ 'Rv' : 'V·REPLACE',
            \ 'c'  : 'COMMAND',
            \}


" Clear status line when vimrc is reloaded
set statusline=

" Status line highlighted group
set statusline+=\ %{toupper(g:currentmode[mode()])} " Current mode
set statusline+=\  

" Status line unhighlighted group
set statusline+=%1*
set statusline+=%<
set statusline+=\ %0.30t                            " Filename
set statusline+=%{&readonly?'\ ':''}               " Read only
set statusline+=\ %M                                " Modified

" Status line seperator
set statusline+=%=

" Status line unhighlighted group
set statusline+=\ %{&filetype}                      " File type
set statusline+=\ [%{&fileencoding}]                " File encoding
set statusline+=\  

" Status line highlighted group
set statusline+=%*
set statusline+=\ row:\ %l                          " Row no.
set statusline+=%-9(\ col:\ %c\ %)                  " Column no.

" Show the status on the second to last line
set laststatus=2

" }}}
"
