" ===============================================================
" =====                     PLUGINS                         =====
" ===============================================================

"required for vundle
filetype off

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"Plugins
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'rking/ag.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-cucumber'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'mattn/gist-vim'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-haml'
Plugin 'othree/html5.vim'
Plugin 'tpope/vim-markdown'
Plugin 'chrisbra/NrrwRgn'
Plugin 'tpope/vim-rails'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'honza/vim-snippets'
Plugin 'kana/vim-submode'
Plugin 'tpope/vim-surround'
Plugin 'w0rp/ale'
Plugin 'majutsushi/tagbar'
Plugin 'timcharper/textile.vim'
Plugin 'SirVer/ultisnips'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'tpope/vim-bundler'
Plugin 'asux/vim-capybara'
Plugin 'kchmck/vim-coffee-script'
Plugin 'junegunn/vim-easy-align'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'jamessan/vim-gnupg'
Plugin 'henrik/vim-indexed-search'
Plugin 'itspriddle/vim-jquery'
Plugin 'airblade/vim-rooter'
Plugin 'vim-ruby/vim-ruby'
Plugin 'hallison/vim-ruby-sinatra'
Plugin 'tpope/vim-rvm'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'kana/vim-textobj-user'
Plugin 'skalnik/vim-vroom'
Plugin 'mattn/webapi-vim'
Plugin 'vim-scripts/ZoomWin'
Plugin 'vim-scripts/TaskList.vim'
Plugin 'vim-scripts/matchit.zip'
Plugin 'vim-scripts/CSApprox'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'posva/vim-vue'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'thaerkh/vim-indentguides'
"setup only for neovim
Plugin 'neoclide/coc.nvim'

"All of your Plugins must be added before the following line
call vundle#end()            " required
