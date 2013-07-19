# vim-configs
This repo is used to manage my vim configuration.

## installatin
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
