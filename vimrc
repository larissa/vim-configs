" swap \ and ', use single quote as leader
" leader needs to be mapped before any other mapping
let mapleader="'"
nnoremap \ '

" vim needs a POSIX compatible shell
if &shell =~# 'fish$'
  set shell=sh
endif

" install plugins
source ~/.nvim/plugins.vim

" misc vim configuration
source ~/.nvim/misc.vim

" plugins custom settings
source ~/.nvim/settings.vim

" theme vim configuration
source ~/.nvim/theme.vim

" custom mappings
source ~/.nvim/mappings.vim
