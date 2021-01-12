#!/bin/sh

if [ $(uname -s) = 'Linux' ]
then
  echo "---------------------------------------------------------"
  echo "$(tput setaf 2)Preparing dependencies for Linux:$(tput sgr 0)"
  echo "$(tput setaf 2)universal-ctags, ncurses-term, nodejs, yarn, neovim, fonts$(tput sgr 0)"
  echo "---------------------------------------------------------"

  echo "---------------------------------------------------------"
  echo "$(tput setaf 3)Adding yarn's debian package repository.$(tput sgr 0)"
  echo "---------------------------------------------------------"

  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
  sudo apt-get update

  echo "---------------------------------------------------------"
  echo "$(tput setaf 2)Installing system packages.$(tput sgr 0)"
  echo "---------------------------------------------------------"

  sudo apt-get install -y universal-ctags ncurses-term fonts-powerline nodejs yarn neovim ruby-neovim python3-pip python-pip

  echo "---------------------------------------------------------"
  echo "$(tput setaf 2)Installing Ruby neovim package.$(tput sgr 0)"
  echo "---------------------------------------------------------"

  which rvm > /dev/null 2>&1
  if [ $? -eq 0 ]
  then
    rvm @global do gem install neovim
  else
    sudo gem install neovim
  fi

  echo "---------------------------------------------------------"
  echo "$(tput setaf 2)Installing Python neovim package.$(tput sgr 0)"
  echo "---------------------------------------------------------"

  pip2 install neovim
  pip3 install neovim

  echo "---------------------------------------------------------"
  echo "$(tput setaf 2)Installing node neovim package$(tput sgr 0)"
  echo "---------------------------------------------------------"

  yarn global add neovim
else
  echo "---------------------------------------------------------"
  echo "$(tput setaf 2)Preparing dependencies for MacOS:$(tput sgr 0)"
  echo "$(tput setaf 2)homebrew, nodejs, yarn, neovim, python, fonts$(tput sgr 0)"
  echo "---------------------------------------------------------"

  if [[ -f "/usr/local/bin/brew" ]]
  then
    echo "---------------------------------------------------------"
    echo "$(tput setaf 3)homebrew already installed, skipping.$(tput sgr 0)"
    echo "---------------------------------------------------------"
  else
    echo "---------------------------------------------------------"
    echo "$(tput setaf 2)Installing Homebrew.$(tput sgr 0)"
    echo "---------------------------------------------------------"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  echo "---------------------------------------------------------"
  echo "$(tput setaf 2)Installing node, yarn, neovim and python as system packages.$(tput sgr 0)"
  echo "---------------------------------------------------------"

  for package in node yarn neovim python3
  do
    brew install $package
    echo "---------------------------------------------------------"
  done

  echo "---------------------------------------------------------"
  echo "$(tput setaf 2)Installing Ruby neovim package.$(tput sgr 0)"
  echo "---------------------------------------------------------"

  sudo gem install neovim

  echo "---------------------------------------------------------"
  echo "$(tput setaf 2)Installing Python neovim package.$(tput sgr 0)"
  echo "---------------------------------------------------------"

  pip3 install neovim

  echo "---------------------------------------------------------"
  echo "$(tput setaf 2)Installing node neovim package$(tput sgr 0)"
  echo "---------------------------------------------------------"

  yarn global add neovim

  echo "---------------------------------------------------------"
  echo "$(tput setaf 2)JARVIS: Installing system fonts.$(tput sgr 0)"
  echo "---------------------------------------------------------"

  brew tap homebrew/cask-fonts
  brew install --cask font-dejavu-sans-mono-for-powerline
fi

echo "---------------------------------------------------------"
echo "$(tput setaf 2)Linking dotfiles.$(tput sgr 0)"
echo "---------------------------------------------------------"

ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc

NVIM_DIR=${XDG_CONFIG_HOME:-$HOME/.config}/nvim

mkdir -p $NVIM_DIR/
ln -s ~/.vim/init.vim $NVIM_DIR/init.vim
ln -s ~/.vim/coc-settings.json $NVIM_DIR/coc-settings.json

echo "---------------------------------------------------------"
echo "$(tput setaf 2)Installing plugins.$(tput sgr 0)"
echo "---------------------------------------------------------"

cd ~/.vim
curl -fLo autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall +qall
nvim +UpdateRemotePlugins +qall
nvim +'call coc#util#install()' +qall

echo "---------------------------------------------------------"
echo "$(tput setaf 2)Installing autocomplete tools.$(tput sgr 0)"
echo "---------------------------------------------------------"

which rvm > /dev/null 2>&1
if [ $? -eq 0 ]
then
  rvm @global do gem install solargraph
else
  sudo gem install solargraph
fi

nvim +'CocInstall coc-json' +qall
nvim +'CocInstall coc-solargraph coc-tsserver coc-css' +qall

echo "---------------------------------------------------------"
echo "$(tput setaf 2)Installing linters.$(tput sgr 0)"
echo "---------------------------------------------------------"

which rvm > /dev/null 2>&1
if [ $? -eq 0 ]
then
  rvm @global do gem install rubocop
else
  sudo gem install rubocop
fi

yarn global add eslint eslint-plugin-vue babel-eslint eslint-plugin-react
yarn global add stylelint stylelint-scss

echo "---------------------------------------------------------"
echo "$(tput setaf 2)Install complete.$(tput sgr 0)"
echo "---------------------------------------------------------"

exit 0
