" ===============================================================
" =====                  PLUGINS SETTINGS                   =====
" ===============================================================

" EditorConfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" NERDTree
" toggle directory view
nnoremap <silent> <Leader>d :NERDTreeToggle<CR>
" reveal current file in directory tree
nnoremap <silent> <Leader>r :NERDTreeFind<CR>
" ignore some files
let NERDTreeIgnore = ['\.pyc$','\~$']

" NERDCommenter
" add space around comment delimiters on NERDCommenter
let NERDSpaceDelims = 1

" Tagbar
" toggle g[o] to navigation
nnoremap <silent> <Leader>g :TagbarToggle<CR>
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1

" ALE (lint)
" customize linter signs
let g:ale_sign_error = '●'
let g:ale_sign_warning = '•'
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

" Submode
" key mapping for split resize
let g:submode_timeoutlen = 2000
call submode#enter_with('resize-window', 'n', '', '<c-w>k', '<c-w>-')
call submode#enter_with('resize-window', 'n', '', '<c-w>j', '<c-w>+')
call submode#enter_with('resize-window', 'n', '', '<c-w>h', '<c-w>>')
call submode#enter_with('resize-window', 'n', '', '<c-w>l', '<c-w><')
call submode#map('resize-window', 'n', '', 'k', '<c-w>-')
call submode#map('resize-window', 'n', '', 'j', '<c-w>+')
call submode#map('resize-window', 'n', '', 'h', '<c-w>>')
call submode#map('resize-window', 'n', '', 'l', '<c-w><')

" ruby-indent
let g:ruby_indent_assignment_style = 'variable'

" CtrlP
" key mapping for b[uffer] search
nnoremap <silent> <Leader>b :CtrlPBuffer<CR>
" key mapping for f[ile] search
let g:ctrlp_map = '<Leader>f'
" use the silver searcher with ctrlp
if executable('ag')
  " use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  " use ag in ctrlp for listing files. lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" vim-rooter
" use vim-rooter manually
let g:rooter_manual_only = 1
" set vim-rooter map to c[hange]r[oot]
map <silent> <unique> <Leader>cr <Plug>RooterChangeToRootDirectory

" auto-pairs
" remove auto-pairs mapping for meta key
let g:AutoPairsShortcutBackInsert = ''
let g:AutoPairsShortcutToggle = ''
let g:AutoPairsShortcutFastWrap = ''
let g:AutoPairsShortcutJump = ''

" airline
let g:airline_theme="wombat"
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
" don't show current mode down the bottom
set noshowmode
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline

" UltiSnips
" expand snippets with C-space by default so it doesn't override other mappings
let g:UltiSnipsExpandTrigger="<c-space>"

" coc.nvim - autocompletion
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

" EasyAlign
" start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

