"avoiding annoying CSApprox warning message
let g:CSApprox_verbose_level = 0

"Use Vim settings, rather then Vi settings.
"This must be first, because it changes other options as a side effect.
set nocompatible

" install plugins
source ~/.vim/plugins.vim

" misc vim configuration
source ~/.vim/misc.vim

" plugins custom settings
source ~/.vim/settings.vim

" custom mappings
source ~/.vim/mappings.vim
