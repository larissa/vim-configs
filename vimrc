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

"removing the toolbox because i don't need it anymore
set guioptions-=T

"store lots of :cmdline history
set history=500

set showcmd     "show incomplete cmds down the bottom
set showmode    "show current mode down the bottom

set incsearch   "find the next match as we type the search
set hlsearch    "hilight searches by default

set number      "add line numbers
set wrap linebreak nolist
set list listchars=tab:▸\ ,trail:·  "makes vim show invisible chars like TextMate

set clipboard=unnamed " use the system clipboard

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

"automatic reloading of vimrc
autocmd! bufwritepost .vimrc source %

"tell the term has 256 colors
set t_Co=256
if has("gui_running")

    set guitablabel=%M%t

    if has("gui_gnome") || has("gui_gtk")
        set term=gnome-256color
        set guifont=DejaVu\ Sans\ Mono\ 10
        set columns=100
        set lines=35
    endif

    if has("gui_win32") || has("gui_win32s")
        set guifont=Consolas:h12
        set enc=utf-8
    endif
else
    set term=gnome-256color
    "disables Background Color Erase so theme works on tmux -2
    set t_ut=
endif
colorscheme wombat256custom

silent! nmap <silent> <Leader>p :NERDTreeToggle<CR>

silent! nmap <silent> <F12> :TagbarToggle<CR>
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1

"make <c-l> clear the highlight as well as redraw
nnoremap <F9> :nohls<CR>:redraw!<CR>

"make Y consistent with C and D
nnoremap Y y$

"makes k and j work through wrapped lines
nnoremap j gj
nnoremap k gk

"makes backspace similar to enter/+ and go to non-blank char from line upward
nnoremap <BS> -

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

"enabling emmet
let g:user_emmet_settings = {
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
"change default emmet leading key
let g:user_emmet_leader_key = '<Leader>h'

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
nnoremap <silent> <Space> :buffer#<CR>
cnoreabbrev bx w<bar>bd

"key mapping for splits navigation
nnoremap <silent> <c-h> :wincmd h<cr>
nnoremap <silent> <c-j> :wincmd j<cr>
nnoremap <silent> <c-k> :wincmd k<cr>
nnoremap <silent> <c-l> :wincmd l<cr>
nnoremap <silent> <c-\> :wincmd p<cr>
"key mapping for split resize, also with submode plugin
let g:submode_timeoutlen = 2000
call submode#enter_with('resize-window', 'n', '', '<c-w>k', '<c-w>-')
call submode#enter_with('resize-window', 'n', '', '<c-w>j', '<c-w>+')
call submode#enter_with('resize-window', 'n', '', '<c-w>h', '<c-w>>')
call submode#enter_with('resize-window', 'n', '', '<c-w>l', '<c-w><')
call submode#map('resize-window', 'n', '', 'k', '<c-w>-')
call submode#map('resize-window', 'n', '', 'j', '<c-w>+')
call submode#map('resize-window', 'n', '', 'h', '<c-w>>')
call submode#map('resize-window', 'n', '', 'l', '<c-w><')

"uses ctrl-w z for zoom window so it's similar to tmux
nmap <c-w>z <Plug>ZoomWin

"CtrlP stuff
"key mapping for buffer search
nnoremap <silent> <Leader>b :CtrlPBuffer<CR>
"key mapping for file search
let g:ctrlp_map = '<Leader>f'

"indent settings for specific filetypes
autocmd FileType python setlocal softtabstop=4 shiftwidth=4
autocmd FileType javascript setlocal sts=4 sw=4
autocmd FileType nasm setlocal sts=4 sw=4
autocmd FileType cpp setlocal sts=4 sw=4
autocmd FileType c setlocal sts=4 sw=4

" some python stuff
au FileType python syn keyword pythonDecorator True None False self

"change yankring directory
let g:yankring_history_dir = '$HOME/.vim/'

"use vim-rooter manually
let g:rooter_manual_only = 1
"set vim-rooter map
map <silent> <unique> <Leader>cr <Plug>RooterChangeToRootDirectory

"change local directory to match current file
nnoremap <silent> <Leader>cd :cd %:h<CR>

"remove auto-pairs mapping for meta key
let g:AutoPairsShortcutBackInsert = ''
let g:AutoPairsShortcutToggle = ''
let g:AutoPairsShortcutFastWrap = ''
let g:AutoPairsShortcutJump = ''

"map save file to ctrl-s
nnoremap <c-s> :w<CR>

"fix mistype :W and :Q
command! -bang -range=% -complete=file -nargs=* WQ <line1>,<line2>wq<bang> <args>
command! -bang -complete=file -nargs=* Qa qa<bang>
command! -bang -complete=file -nargs=* QA qa<bang>
command! -bang -range=% -complete=file -nargs=* Wq <line1>,<line2>wq<bang> <args>
command! -bang -range=% -complete=file -nargs=* W <line1>,<line2>w<bang> <args>
command! -bang Q quit<bang>


"general function that restores previous state after a command
function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

"remove trailing whitespaces
nnoremap <silent> <F5> :call Preserve("%s/\\s\\+$//e")<CR>
"indent whole file
nnoremap <silent> <F6> :call Preserve("normal gg=G")<CR>

"training stuff
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
vnoremap <up> <nop>
vnoremap <down> <nop>
vnoremap <left> <nop>
vnoremap <right> <nop>

"airline configuration
let g:airline_theme="wombat"
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
"let g:airline_mode_map = {
"    \ '__' : '-',
"    \ 'n'  : 'N',
"    \ 'i'  : 'I',
"    \ 'R'  : 'R',
"    \ 'c'  : 'C',
"    \ 'v'  : 'V',
"    \ 'V'  : 'V',
"    \ '' : 'V',
"    \ 's'  : 'S',
"    \ 'S'  : 'S',
"    \ '' : 'S',
"    \ }
set noshowmode    "dont show current mode down the bottom
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline
"if !exists('g:airline_symbols')
"  let g:airline_symbols = {}
"endif
"let g:airline_symbols.space = '\ua0'


"Ignore some files in NERDTree
let NERDTreeIgnore = ['\.pyc$','\~$']

"SuperTab configuration
"uses context completion type and falls back to keywork if none found
let g:SuperTabDefaultCompletionType = "context"
  autocmd FileType *
    \ if &omnifunc != '' |
    \   call SuperTabChain(&omnifunc, "<c-p>") |
    \ endif
let g:SuperTabContextDefaultCompletionType = "<c-p>"
let g:SuperTabClosePreviewOnPopupClose = 1

"Easy-align configuration
"Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
"Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"Remap : to ç to make commands easier to type on brazilian keyboard
nnoremap ç :
vnoremap ç :

"Highlight column number 80
set colorcolumn=81
highlight ColorColumn ctermbg=1

"Enable spell check only for text files
au BufRead,BufNewFile *.tex,*.txt,*.md,*.textile,*.markdown setlocal spell
"Toggle language
nnoremap <F7> :setlocal spell! spelllang=en<CR>
nnoremap <F8> :setlocal spell! spelllang=pt<CR>

"UltiSnips triggers
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"
