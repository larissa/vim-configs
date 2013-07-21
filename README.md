# vim-configs
This repo is used to manage my vim configuration. This setup is heavily based on akitaonrails' vimfiles.

## plugins
* [ack.vim] (http://www.vim.org/scripts/script.php?script_id=2572)
* [Align] (http://www.vim.org/scripts/script.php?script_id=294)
* [auto-pairs] (http://www.vim.org/scripts/script.php?script_id=3599)
* [VimClojure] (http://www.vim.org/scripts/script.php?script_id=2501)
* [CSApprox] (http://www.vim.org/scripts/script.php?script_id=2390)
* [ctrp] (https://github.com/kien/ctrlp.vim)
* [cucumber] (http://www.vim.org/scripts/script.php?script_id=2973)
* [endwise] (http://www.vim.org/scripts/script.php?script_id=2386)
* [fugitive] (http://www.vim.org/scripts/script.php?script_id=2975)
* [gist-vim] (http://www.vim.org/scripts/script.php?script_id=2423)
* [git] (http://www.vim.org/scripts/script.php?script_id=1654)
* [git-vim] (https://github.com/motemen/git-vim)
* [grails-vim] (http://www.vim.org/scripts/script.php?script_id=3120)
* [grep-vim] (http://www.vim.org/scripts/script.php?script_id=311)
* [haml] (http://www.vim.org/scripts/script.php?script_id=1433)
* [html5.vim] (http://www.vim.org/scripts/script.php?script_id=3236)
* [markdown] (https://github.com/tpope/vim-markdown)
* [matchit] (http://www.vim.org/scripts/script.php?script_id=39)
* [NERDcommenter] (http://www.vim.org/scripts/script.php?script_id=1218)
* [NERDtree] (http://www.vim.org/scripts/script.php?script_id=1658)
* [rails] (http://www.vim.org/scripts/script.php?script_id=1567)
* [scala] (https://github.com/akhil/scala-vim-bundle)
* [scss-syntax] (https://github.com/cakebaker/scss-syntax.vim)
* [snipmate] (http://www.vim.org/scripts/script.php?script_id=2540)
* [supertab] (http://www.vim.org/scripts/script.php?script_id=1643)
* [surround] (http://www.vim.org/scripts/script.php?script_id=1697)
* [syntastic] (http://www.vim.org/scripts/script.php?script_id=2736)
* [tabular] (http://www.vim.org/scripts/script.php?script_id=3464)
* [taglist] (http://www.vim.org/scripts/script.php?script_id=273)
* [textile] (http://www.vim.org/scripts/script.php?script_id=2305)
* [vim-buffergator] (http://www.vim.org/scripts/script.php?script_id=3619)
* [vim-bundler] (http://www.vim.org/scripts/script.php?script_id=4280)
* [vim-capybara] (https://github.com/asux/vim-capybara)
* [vim-coffee-script] (http://www.vim.org/scripts/script.php?script_id=3590)
* [vim-easymotion] (http://www.vim.org/scripts/script.php?script_id=3526)
* [vim-golang] (https://github.com/jnwhiteh/vim-golang)
* [vim-indexed-search] (http://www.vim.org/scripts/script.php?script_id=1682)
* [vim-jquery] (http://www.vim.org/scripts/script.php?script_id=2416)
* [vim-rooter] (https://github.com/airblade/vim-rooter)
* [vim-ruby] (https://github.com/vim-ruby/vim-ruby)
* [vim-ruby-sinatra] (http://www.vim.org/scripts/script.php?script_id=2942)
* [vim-rvm] (http://www.vim.org/scripts/script.php?script_id=4269)
* [vim-textobj-rubybloc] (http://vimcasts.org/blog/2010/12/a-text-object-for-ruby-blocks/)
* [vim-textobj-user] (https://github.com/kana/vim-textobj-user)
* [vim-vroom] (https://github.com/skalnik/vim-vroom)
* [vim-yankring] (http://www.vim.org/scripts/script.php?script_id=1234)
* [zencoding-vim] (http://www.vim.org/scripts/script.php?script_id=2981)

## installation
    git clone git://github.com/larissa/vim-configs.git ~/.vim
    cd ~/.vim
    git submodule update --init
    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/gvimrc ~/.gvimrc

at first usage, execute
    :call pathogen#helptags()

## debian dependencies
    apt-get install exuberant-ctags ncurses-term

## credits
* Plugins belong to their authors.
* Credit for most of the vimrc goes to @akitaonrails. 
