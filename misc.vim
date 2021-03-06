" ===============================================================
" =====                        MISC                         =====
" ===============================================================

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" removing the toolbox because i don't need it anymore
set guioptions-=T

" store lots of :cmdline history
set history=500

" show incomplete cmds down the bottom
set showcmd
" show current mode down the bottom. fallback when not using airline
set showmode

" find the next match as we type the search
set incsearch
" hilight searches by default
set hlsearch

" add line numbers
set number
" use relative number for easier relative navigation
set relativenumber
" wrap lines
set wrap linebreak nolist

" makes vim show invisible chars
set list listchars=tab:▸\ ,trail:·,nbsp:¬

" use the system clipboard
set clipboard=unnamedplus

" add some line space for easy reading
set linespace=4

" disable visual bell and beep
set visualbell t_vb=

" setting format options to automatically wrap line larger than tw
set formatoptions=ltj
set tw=80

" statusline setup. fallback to this when not using airline
set statusline=%f       " tail of the filename
set statusline+=%{fugitive#statusline()} " git
set statusline+=%{exists('g:loaded_rvm')?rvm#statusline():''} " rvm
set statusline+=%=      " left/right separator
set statusline+=%c,     " cursor column
set statusline+=%l/%L   " cursor line/total lines
set statusline+=\ %P    " percent through file
set laststatus=2

" indent settings
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
"indent settings for specific filetypes
autocmd FileType python setlocal softtabstop=4 shiftwidth=4
autocmd FileType nasm setlocal sts=4 sw=4
autocmd FileType cpp setlocal sts=4 sw=4
autocmd FileType c setlocal sts=4 sw=4

" folding settings
set foldmethod=indent   " fold based on indent
set foldnestmax=3       " deepest fold is 3 levels
set nofoldenable        " dont fold by default

" line join settings; do not add two spaces after pontuation when joining lines
set nojoinspaces

" command line tab completion
set wildmode=list:longest   " make cmdline tab completion similar to bash
set wildmenu                " enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ " stuff to ignore when tab completing

" vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

" turn on syntax highlighting
syntax on

" some stuff to get the mouse going in term
set mouse=a
if !has('nvim')
  set ttymouse=xterm2
endif

" hide buffers when not displayed
set hidden

"automatic reloading of vimrc
autocmd! bufwritepost .vimrc source %

" jump to last cursor position when opening a file
" dont do it when writing a commit log entry
autocmd BufReadPost * call SetCursorPosition()
function! SetCursorPosition()
  if &filetype !~ 'commit\c'
    if line("'\"") > 0 && line("'\"") <= line("$")
      exe "normal! g`\""
      normal! zz
    endif
  endif
endfunction

" highlight column number 80
set colorcolumn=81
highlight ColorColumn ctermbg=1

" filetypes config
" use html, javascript and css configs on vue component files
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css
" use typescript and jsx on tsx files
autocmd BufRead,BufNewFile *.tsx setlocal filetype=typescript.tsx
" enable spell check only for text files
au BufRead,BufNewFile *.tex,*.txt,*.md,*.textile,*.markdown setlocal spell
" some python stuff
au FileType python syn keyword pythonDecorator True None False self
