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
Plug 'tpope/vim-markdown'
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
Plug 'junegunn/vim-easy-align'
Plug 'Lokaltog/vim-easymotion'
Plug 'jamessan/vim-gnupg'
Plug 'mattn/webapi-vim'
Plug 'thaerkh/vim-indentguides'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'dag/vim-fish'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'RRethy/nvim-treesitter-textsubjects'
Plug 'RRethy/nvim-base16'

"All of your Plugins must be added before the following line. Automatically
"executes filetype plugin indent on and syntax enable
call plug#end()
