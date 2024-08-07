" ===============================================================
" =====                      MAPPINGS                       =====
" ===============================================================

" make backspace clear the highlight as well as redraw
nnoremap <silent> <BS> :nohls<CR>:redraw!<CR>

" make Y consistent with C and D
nnoremap Y y$

" makes k and j work through wrapped lines
nnoremap j gj
nnoremap k gk

" gives gj and gk the original behaviour of j and k
nnoremap gj j
nnoremap gk k

" use gh and gl to go through jumplist
nnoremap gl <C-i>
nnoremap gh <C-o>

" keep cursor centered after next search
nnoremap n nzz
nnoremap N Nzz

" key mapping for buffer navigation
nnoremap <silent> <Tab> :bnext<CR>
nnoremap <silent> <S-Tab> :bprevious<CR>
nnoremap <silent> <Space> :buffer#<CR>
cnoreabbrev bx w<bar>bd

" exit quickfix window
nnoremap <leader>e :cclose<CR>

" map save file to <leader>w
nnoremap <leader>w :w<CR>

" key mapping for splits navigation
nnoremap <silent> <c-h> :wincmd h<cr>
nnoremap <silent> <c-j> :wincmd j<cr>
nnoremap <silent> <c-k> :wincmd k<cr>
nnoremap <silent> <c-l> :wincmd l<cr>
nnoremap <silent> <c-\> :wincmd p<cr>

" change local directory to match current file
nnoremap <silent> <Leader>cd :cd %:h<CR>

" general function that restores previous state after a command
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

" remove trailing whitespaces
nnoremap <silent> - :call Preserve("%s/\\s\\+$//e")<CR>
" indent whole file
nnoremap <silent> + :call Preserve("normal gg=G")<CR>

" Remove directionals
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

" swap lines
nnoremap <silent>K :m .-2<CR>==
nnoremap <silent>J :m .+1<CR>==
vnoremap <silent>K :m '<-2<CR>gv=gv
vnoremap <silent>J :m '>+1<CR>gv=gv
" regain J functionality of joining lines by mapping it to Q
nnoremap Q J
vnoremap Q J

" remap : to ç to make commands easier to type on brazilian keyboard
nnoremap ç :
vnoremap ç :

" remap : to ; to make commands easier to type on american keyboard
nnoremap ; :
vnoremap ; :

" regain ; functionality by mapping it to :
nnoremap : ;
vnoremap : ;

" toggle language spellcheck
nnoremap <F7> :setlocal spell! spelllang=en<CR>
nnoremap <F8> :setlocal spell! spelllang=pt<CR>

" open file on github
nnoremap <silent> <F10> :silent exe "!fish -c 'git_open ".expand('%:p')." ".line('.')."'"<CR>
