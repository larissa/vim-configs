# vim-configs
This repo is used to manage my vim configuration. This setup is heavily based on akitaonrails' vimfiles.

## plugins
* [ag-vim] (https://github.com/rking/ag.vim)
* [auto-pairs] (http://www.vim.org/scripts/script.php?script_id=3599)
* [CSApprox] (http://www.vim.org/scripts/script.php?script_id=2390)
* [ctrp] (https://github.com/kien/ctrlp.vim)
* [cucumber] (http://www.vim.org/scripts/script.php?script_id=2973)
* [emmet-vim] (https://github.com/mattn/emmet-vim)
* [endwise] (http://www.vim.org/scripts/script.php?script_id=2386)
* [fugitive] (http://www.vim.org/scripts/script.php?script_id=2975)
* [gist-vim] (http://www.vim.org/scripts/script.php?script_id=2423)
* [git] (http://www.vim.org/scripts/script.php?script_id=1654)
* [haml] (http://www.vim.org/scripts/script.php?script_id=1433)
* [html5.vim] (http://www.vim.org/scripts/script.php?script_id=3236)
* [markdown] (https://github.com/tpope/vim-markdown)
* [matchit] (http://www.vim.org/scripts/script.php?script_id=39)
* [NERDcommenter] (http://www.vim.org/scripts/script.php?script_id=1218)
* [NERDtree] (http://www.vim.org/scripts/script.php?script_id=1658)
* [NrrRgn] (https://github.com/chrisbra/NrrwRgn)
* [rails] (http://www.vim.org/scripts/script.php?script_id=1567)
* [scss-syntax] (https://github.com/cakebaker/scss-syntax.vim)
* [snipmate] (http://www.vim.org/scripts/script.php?script_id=2540)
* [supertab] (http://www.vim.org/scripts/script.php?script_id=1643)
* [surround] (http://www.vim.org/scripts/script.php?script_id=1697)
* [syntastic] (http://www.vim.org/scripts/script.php?script_id=2736)
* [tagbar] (https://github.com/majutsushi/tagbar)
* [tasklist] (https://github.com/vim-scripts/TaskList.vim)
* [textile] (http://www.vim.org/scripts/script.php?script_id=2305)
* [unimpaired] (https://github.com/tpope/vim-unimpaired)
* [vim-airline] (https://github.com/bling/vim-airline)
* [vim-buffergator] (http://www.vim.org/scripts/script.php?script_id=3619)
* [vim-bundler] (http://www.vim.org/scripts/script.php?script_id=4280)
* [vim-capybara] (https://github.com/asux/vim-capybara)
* [vim-coffee-script] (http://www.vim.org/scripts/script.php?script_id=3590)
* [vim-easy-align] (https://github.com/junegunn/vim-easy-align)
* [vim-easymotion] (http://www.vim.org/scripts/script.php?script_id=3526)
* [vim-indexed-search] (http://www.vim.org/scripts/script.php?script_id=1682)
* [vim-jquery] (http://www.vim.org/scripts/script.php?script_id=2416)
* [vim-rooter] (https://github.com/airblade/vim-rooter)
* [vim-ruby] (https://github.com/vim-ruby/vim-ruby)
* [vim-ruby-sinatra] (http://www.vim.org/scripts/script.php?script_id=2942)
* [vim-rvm] (http://www.vim.org/scripts/script.php?script_id=4269)
* [vim-textobj-rubybloc] (http://vimcasts.org/blog/2010/12/a-text-object-for-ruby-blocks/)
* [vim-textobj-user] (https://github.com/kana/vim-textobj-user)
* [vim-vroom] (https://github.com/skalnik/vim-vroom)
* [yankring] (https://github.com/vimx/YankRing.vim)
* [ZoomWin] (https://github.com/vim-scripts/ZoomWin)
* [deoplete.nvim] (https://github.com/Shougo/deoplete.nvim)

## installation
    git clone git://github.com/larissa/vim-configs.git ~/.vim
    cd ~/.vim
    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/gvimrc ~/.gvimrc
    git clone https://github.com/VundleVim/Vundle.vim.git bundle/Vundle.vim

at first usage, execute
    :BundleInstall

## debian dependencies
    apt-get install exuberant-ctags ncurses-term

## Using neovim
    apt-get install neovim python3-pip python-pip ruby-neovim
    pip install neovim
    pip3 install neovim
    mkdir ~/.config/nvim/
    ln -s ~/.vim/init.vim ~/.config/nvim/init.vim

at first usage, execute
    :UpdateRemotePlugins

## credits
* Plugins belong to their authors.
* Credit for much of the vimrc goes to @akitaonrails.
