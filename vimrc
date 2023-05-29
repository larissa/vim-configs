" swap \ and ', use single quote as leader
" leader needs to be mapped before any other mapping
let mapleader="'"
nnoremap \ '

" vim needs a POSIX compatible shell
if &shell =~# 'fish$'
  set shell=sh
endif

" install plugins
source ~/.vim/plugins.vim

" misc vim configuration
source ~/.vim/misc.vim

" plugins custom settings
source ~/.vim/settings.vim

" theme vim configuration
source ~/.vim/theme.vim

" custom mappings
source ~/.vim/mappings.vim
