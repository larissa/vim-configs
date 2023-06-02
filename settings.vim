" ===============================================================
" =====                  PLUGINS SETTINGS                   =====
" ===============================================================

" fzf customization
" fzf customize tiebreak to favor file name and show preview window
let s:fzf_custom_opts = { 'options': '--tiebreak=end,length,index' }
if executable('rg')
  " also change source of search if rg is installed and ignore sorbet files
  let s:fzf_custom_opts.source = 'rg --files -g "!*.rbi"'
endif
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(s:fzf_custom_opts), <bang>0)

" re-add fzf's Rg command as FuzzyFind to avoid clash with vim-ripgrep
command! -bang -nargs=* FuzzyFind call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case -- ".shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)

" fzf fuzzy search mapping
" key mapping for b[uffer] search
nnoremap <silent> <Leader>b :Buffers<CR>
" key mapping for f[ile] search
nnoremap <silent> <Leader>f :Files<CR>
" key mapping for h[unt] search files for content
nnoremap <silent> <Leader>h :FuzzyFind<CR>
