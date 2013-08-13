"most of this (about the first 160 lines) belong to akita's vimfiles 

"avoiding annoying CSApprox warning message
let g:CSApprox_verbose_level = 0

"necessary on some Linux distros for pathogen to properly load bundles
filetype on
filetype off

"load pathogen managed plugins
call pathogen#runtime_append_all_bundles()

"Use Vim settings, rather then Vi settings (much better!).
"This must be first, because it changes other options as a side effect.
set nocompatible

"allow backspacing over everything in insert mode
set backspace=indent,eol,start

"store lots of :cmdline history
set history=500

set showcmd     "show incomplete cmds down the bottom
set showmode    "show current mode down the bottom

set incsearch   "find the next match as we type the search
set hlsearch    "hilight searches by default

set number      "add line numbers
set wrap linebreak nolist

"add some line space for easy reading
set linespace=4

"disable visual bell and beep
set visualbell t_vb=

"setting format options to automatically wrap line larger than tw
set formatoptions=lt

"statusline setup
set statusline=%f       "tail of the filename

"Git
set statusline+=%{fugitive#statusline()}

"RVM
set statusline+=%{exists('g:loaded_rvm')?rvm#statusline():''}

set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file
set laststatus=2

"indent settings
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing

"vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

"load ftplugins and indent files
filetype plugin on
filetype indent on

"turn on syntax highlighting
syntax on

"some stuff to get the mouse going in term
set mouse=a
set ttymouse=xterm2

"hide buffers when not displayed
set hidden

if has("gui_running")
    "tell the term has 256 colors
    set t_Co=256

    colorscheme wombat
    set guitablabel=%M%t
    set lines=40
    set columns=115

    if has("gui_gnome") || has("gui_gtk")
        set term=gnome-256color
        colorscheme wombat256-edited
        set guifont=DejaVu\ Sans\ Mono
        set columns=100
        set lines=35
    endif

    if has("gui_win32") || has("gui_win32s")
        set guifont=Consolas:h12
        set enc=utf-8
    endif
else
    "dont load csapprox if there is no gui support - silences an annoying warning
    let g:CSApprox_loaded = 1

    "set bclear colorscheme when running vim in gnome terminal
    if $COLORTERM == 'gnome-terminal'
        set term=gnome-256color
        colorscheme bclear
    else
        colorscheme default
    endif
endif

silent! nmap <silent> <Leader>p :NERDTreeToggle<CR>

"make <c-l> clear the highlight as well as redraw
nnoremap <C-L> :nohls<CR><C-L>

"make Y consistent with C and D
nnoremap Y y$

"mark syntax errors with :signs
let g:syntastic_enable_signs=1

"jump to last cursor position when opening a file
"dont do it when writing a commit log entry
autocmd BufReadPost * call SetCursorPosition()
function! SetCursorPosition()
    if &filetype !~ 'commit\c'
        if line("'\"") > 0 && line("'\"") <= line("$")
            exe "normal! g`\""
            normal! zz
        endif
    end
endfunction

"Enabling Zencoding
let g:user_zen_settings = {
  \  'php' : {
  \    'extends' : 'html',
  \    'filters' : 'c',
  \  },
  \  'xml' : {
  \    'extends' : 'html',
  \  },
  \  'haml' : {
  \    'extends' : 'html',
  \  },
  \  'erb' : {
  \    'extends' : 'html',
  \  },
 \}
"change default Zencoding key
let g:user_zen_leader_key = '<c-h>'

"buffergator configs
let g:buffergator_viewport_split_policy = "B"
let g:buffergator_autoexpand_on_split = 0
let g:buffergator_split_size = 5
let g:buffergator_suppress_keymaps = 1
"key mapping to list buffers using buffergator
nnoremap <silent> <Leader>l :BuffergatorToggle<CR>

"key mapping for buffer navigation
nnoremap <silent> <Tab> :bnext<CR>
nnoremap <silent> <S-Tab> :bprevious<CR>
cnoreabbrev bx w<bar>bd

"CtrlP stuff
"key mapping for buffer search
nnoremap <silent> <Leader>b :CtrlPBuffer<CR>
"key mapping for file search
let g:ctrlp_map = '<Leader>f'

"indent settings for specific filetypes
autocmd FileType python setlocal shiftwidth=4 softtabstop=4
autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab

autocmd FileType nasm setlocal ts=4 sts=4 sw=4 expandtab

" some python stuff
au FileType python syn keyword pythonDecorator True None False self

"change yankring directory
let g:yankring_history_dir = '$HOME/.vim/'

"use vim-rooter manually
let g:rooter_manual_only = 1
"set vim-rooter map
map <silent> <unique> ,cd <Plug>RooterChangeToRootDirectory

"change local directory to match current file
nnoremap <silent> <Leader>cd :cd %:h<CR>

"remove auto-pairs mapping for meta key
let g:AutoPairsShortcutBackInsert = ''
let g:AutoPairsShortcutToggle = ''
let g:AutoPairsShortcutFastWrap = ''
let g:AutoPairsShortcutJump = ''
