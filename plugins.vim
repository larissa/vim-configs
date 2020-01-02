" ===============================================================
" =====                     PLUGINS                         =====
" ===============================================================

" vim-plug automatic installaion
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" Specify a directory for plugins
call plug#begin('~/.vim/bundle')

" Plugins
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'jremmen/vim-ripgrep'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'mattn/gist-vim'
Plug 'tpope/vim-git'
Plug 'othree/html5.vim'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-rails'
Plug 'cakebaker/scss-syntax.vim'
Plug 'honza/vim-snippets'
Plug 'kana/vim-submode'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
Plug 'majutsushi/tagbar'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'kchmck/vim-coffee-script'
Plug 'junegunn/vim-easy-align'
Plug 'Lokaltog/vim-easymotion'
Plug 'jamessan/vim-gnupg'
Plug 'henrik/vim-indexed-search'
Plug 'vim-ruby/vim-ruby'
Plug 'hallison/vim-ruby-sinatra'
Plug 'tpope/vim-rvm'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'kana/vim-textobj-user'
Plug 'mattn/webapi-vim'
Plug 'vim-scripts/matchit.zip'
Plug 'editorconfig/editorconfig-vim'
Plug 'posva/vim-vue'
Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mxw/vim-jsx'
Plug 'thaerkh/vim-indentguides'
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

"All of your Plugins must be added before the following line. Automatically
"executes filetype plugin indent on and syntax enable
call plug#end()
