" ===============================================================
" =====                  PLUGINS SETTINGS                   =====
" ===============================================================

" EditorConfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" NERDTree
" toggle directory view
nnoremap <silent> <Leader>t :NERDTreeToggle<CR>
" reveal current file in directory tree
nnoremap <silent> <Leader>r :NERDTreeFind<CR>
" ignore some files
let g:NERDTreeIgnore = ['\.pyc$','\~$']
" release ? for search
let g:NERDTreeMapHelp='<f1>'
" remove help text
let NERDTreeMinimalUI=1

" NERDCommenter
" add space around comment delimiters on NERDCommenter
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'

" Tagbar
" toggle g[o] to navigation
nnoremap <silent> <Leader>g :TagbarToggle<CR>
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_map_help = '<F1>'

" ALE (lint)
" customize linter signs
let g:ale_sign_error = '●'
let g:ale_sign_warning = '•'
" customize linter colours
highlight link ALEErrorSign DiffDelete
" only lint when leaving insert mode after an edit
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
" show error details with m[ore details]
nnoremap <Leader>m :ALEDetail<CR>

" Buffergator
let g:buffergator_viewport_split_policy = "B"
let g:buffergator_autoexpand_on_split = 0
let g:buffergator_split_size = 5
let g:buffergator_suppress_keymaps = 1
" key mapping to l[ist] buffers using buffergator
nnoremap <silent> <Leader>l :BuffergatorToggle<CR>

" ruby-indent
let g:ruby_indent_assignment_style = 'variable'

" use ripgrep over grep
if executable('rg')
  set grepprg=rg\ --no-heading\ --color\ never
endif

" map ripgrep search to <leader>s[search]
nnoremap <leader>s :Rg<CR>
vnoremap <leader>s :call RgVisual()<CR>

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

" auto-pairs
" remove auto-pairs mapping for meta key
let g:AutoPairsShortcutBackInsert = ''
let g:AutoPairsShortcutToggle = ''
let g:AutoPairsShortcutFastWrap = ''
let g:AutoPairsShortcutJump = ''

" airline
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
" don't show current mode down the bottom
set noshowmode
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline

" UltiSnips
" expand snippets with C-space by default so it doesn't override other mappings
let g:UltiSnipsExpandTrigger="<c-space>"

" coc.nvim - autocompletion
" use s-tab to navigate between completion list
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"
" use <tab> for trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <Tab>
  \ coc#pum#visible() ? coc#pum#next(1) :
  \ CheckBackspace() ? "\<Tab>" :
  \ UltiSnips#CanExpandSnippet() ? "\<C-R>=(UltiSnips#ExpandSnippet())<CR>" :
  \ coc#refresh()

" EasyAlign
" start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" quick-scope
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
