"avoiding annoying CSApprox warning message
let g:CSApprox_verbose_level = 0

"Use Vim settings, rather then Vi settings (much better!).
"This must be first, because it changes other options as a side effect.
set nocompatible

"required for vundle
filetype off

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"Plugins
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'rking/ag.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-cucumber'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'mattn/gist-vim'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-haml'
Plugin 'othree/html5.vim'
Plugin 'tpope/vim-markdown'
Plugin 'chrisbra/NrrwRgn'
Plugin 'tpope/vim-rails'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'honza/vim-snippets'
Plugin 'kana/vim-submode'
Plugin 'tpope/vim-surround'
Plugin 'w0rp/ale'
Plugin 'majutsushi/tagbar'
Plugin 'timcharper/textile.vim'
Plugin 'SirVer/ultisnips'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'tpope/vim-bundler'
Plugin 'asux/vim-capybara'
Plugin 'kchmck/vim-coffee-script'
Plugin 'junegunn/vim-easy-align'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'jamessan/vim-gnupg'
Plugin 'henrik/vim-indexed-search'
Plugin 'itspriddle/vim-jquery'
Plugin 'airblade/vim-rooter'
Plugin 'vim-ruby/vim-ruby'
Plugin 'hallison/vim-ruby-sinatra'
Plugin 'tpope/vim-rvm'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'kana/vim-textobj-user'
Plugin 'skalnik/vim-vroom'
Plugin 'mattn/webapi-vim'
Plugin 'vim-scripts/ZoomWin'
Plugin 'vim-scripts/TaskList.vim'
Plugin 'vim-scripts/matchit.zip'
Plugin 'vim-scripts/CSApprox'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'posva/vim-vue'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'thaerkh/vim-indentguides'
"setup only for neovim
Plugin 'neoclide/coc.nvim'

"All of your Plugins must be added before the following line
call vundle#end()            " required
"load ftplugins and indent files
filetype plugin indent on    " required

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
set list listchars=tab:▸\ ,trail:·,nbsp:¬  "makes vim show invisible chars like TextMate

set clipboard=unnamed " use the system clipboard

"add some line space for easy reading
set linespace=4

"disable visual bell and beep
set visualbell t_vb=

"setting format options to automatically wrap line larger than tw
set formatoptions=ltj
set tw=80

"statusline setup
set statusline=%f       "tail of the filename

"Git
set statusline+=%{fugitive#statusline()}

"EditorConfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

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

"turn on syntax highlighting
syntax on

"some stuff to get the mouse going in term
set mouse=a
if !has('nvim')
  set ttymouse=xterm2
endif

"hide buffers when not displayed
set hidden

"automatic reloading of vimrc
autocmd! bufwritepost .vimrc source %

"tell the term has 256 colors
if !has('nvim')
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
endif
colorscheme wombat256custom

" Toggle directory view
nnoremap <Leader>d :NERDTreeToggle<CR>

" Toggle g[o] to navigation
nnoremap <silent> <Leader>g :TagbarToggle<CR>
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

"Lint configuration
let g:ale_sign_error = '●'
let g:ale_sign_warning = '•'
let g:ale_lint_on_text_changed = 'never' " Otherwise linting is too distracting
" show error details with \m[ore details]
nnoremap <Leader>m :ALEDetail<CR>

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
  \  'javascript.jsx' : {
  \    'extends' : 'jsx',
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

"ruby indent configuration
let g:ruby_indent_assignment_style = 'variable'

"CtrlP stuff
"key mapping for buffer search
nnoremap <silent> <Leader>b :CtrlPBuffer<CR>
"key mapping for file search
let g:ctrlp_map = '<Leader>f'

"indent settings for specific filetypes
autocmd FileType python setlocal softtabstop=4 shiftwidth=4
autocmd FileType nasm setlocal sts=4 sw=4
autocmd FileType cpp setlocal sts=4 sw=4
autocmd FileType c setlocal sts=4 sw=4

" some python stuff
au FileType python syn keyword pythonDecorator True None False self

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

"Add space around comment delimiters on NERDCommenter
let NERDSpaceDelims = 1

"Expand snippets with C-space by default so it doesn't override other mappings
let g:UltiSnipsExpandTrigger="<c-space>"

"coc.nvim completion configuration
" close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
" use s-tab to navigate between completion list
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" use <tab> for trigger completion and navigate to the next complete item
function! g:TabActionBasedOnContext()
  " if there is an autocomplete list, go to the next item
  if pumvisible()
    return "\<C-n>"
  endif
  " if there is whitespace behind the current column, insert a tab character
  let col = col('.') - 1
  if !col || getline('.')[col - 1] =~ '\s'
    return "\<Tab>"
  endif
  " if snippet was successful, does nothing
  call UltiSnips#ExpandSnippet()
  if g:ulti_expand_res > 0
    return ""
  endif
  " start looking for autocomplete
  return coc#refresh()
endfunction
inoremap <silent> <Tab> <C-R>=g:TabActionBasedOnContext()<CR>

"Easy-align configuration
"Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
"Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"Swap lines
nnoremap <silent>K <Up>"add"ap<Up>
nnoremap <silent>J "add"ap
"Regain J functionality of joining lines by mapping it to Q
nnoremap Q J

"Remap : to ç to make commands easier to type on brazilian keyboard
nnoremap ç :
vnoremap ç :

"Remap : to ; to make commands easier to type on american keyboard
nnoremap ; :
vnoremap ; :

"Regain ; functionality by mapping it to :
nnoremap : ;
vnoremap : ;

"Highlight column number 80
set colorcolumn=81
highlight ColorColumn ctermbg=1

"Enable spell check only for text files
au BufRead,BufNewFile *.tex,*.txt,*.md,*.textile,*.markdown setlocal spell
"Toggle language
nnoremap <F7> :setlocal spell! spelllang=en<CR>
nnoremap <F8> :setlocal spell! spelllang=pt<CR>

"Vue config
"use html, javascript and css configs on vue component files
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css

"tsx
autocmd BufRead,BufNewFile *.tsx setlocal filetype=typescript.jsx

"setup only on neovim
if has('nvim')
endif

"Enter paste mode, add new line, paste, leave paste mode
nnoremap <silent> <Leader>p :set paste<CR>o<esc>"*]p:set nopaste<CR>
