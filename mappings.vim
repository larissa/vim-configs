" ===============================================================
" =====                      MAPPINGS                       =====
" ===============================================================

" make <c-l> clear the highlight as well as redraw
nnoremap <F9> :nohls<CR>:redraw!<CR>

" make Y consistent with C and D
nnoremap Y y$

" makes k and j work through wrapped lines
nnoremap j gj
nnoremap k gk

" makes backspace similar to enter/+ and go to non-blank char from line upward
nnoremap <BS> -

" key mapping for buffer navigation
nnoremap <silent> <Tab> :bnext<CR>
nnoremap <silent> <S-Tab> :bprevious<CR>
nnoremap <silent> <Space> :buffer#<CR>
cnoreabbrev bx w<bar>bd

" key mapping for splits navigation
nnoremap <silent> <c-h> :wincmd h<cr>
nnoremap <silent> <c-j> :wincmd j<cr>
nnoremap <silent> <c-k> :wincmd k<cr>
nnoremap <silent> <c-l> :wincmd l<cr>
nnoremap <silent> <c-\> :wincmd p<cr>

" change local directory to match current file
nnoremap <silent> <Leader>cd :cd %:h<CR>

" map save file to ctrl-s
nnoremap <c-s> :w<CR>

"fix mistype :W and :Q
command! -bang -range=% -complete=file -nargs=* WQ <line1>,<line2>wq<bang> <args>
command! -bang -complete=file -nargs=* Qa qa<bang>
command! -bang -complete=file -nargs=* QA qa<bang>
command! -bang -range=% -complete=file -nargs=* Wq <line1>,<line2>wq<bang> <args>
command! -bang -range=% -complete=file -nargs=* W <line1>,<line2>w<bang> <args>
command! -bang Q quit<bang>

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
nnoremap <silent> <F5> :call Preserve("%s/\\s\\+$//e")<CR>
" indent whole file
nnoremap <silent> <F6> :call Preserve("normal gg=G")<CR>

" training stuff
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
nnoremap <silent>K <Up>"add"ap<Up>
nnoremap <silent>J "add"ap
" regain J functionality of joining lines by mapping it to Q
nnoremap Q J

" remap : to ç to make commands easier to type on brazilian keyboard
nnoremap ç :
vnoremap ç :

" remap : to ; to make commands easier to type on american keyboard
nnoremap ; :
vnoremap ; :

" regain ; functionality by mapping it to :
nnoremap : ;
vnoremap : ;

" enter paste mode, add new line, paste, leave paste mode
nnoremap <silent> <Leader>p :set paste<CR>o<esc>"*]p:set nopaste<CR>

" toggle language spellcheck
nnoremap <F7> :setlocal spell! spelllang=en<CR>
nnoremap <F8> :setlocal spell! spelllang=pt<CR>
