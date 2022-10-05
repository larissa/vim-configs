#!/bin/sh

if [ $(uname -s) = 'Linux' ]
then
  if ! [ $SPIN ]; then
    echo "---------------------------------------------------------"
    TERM=${TERM:-unknown} echo "$(tput setaf 2)Preparing dependencies for Linux:$(tput sgr 0)"
    TERM=${TERM:-unknown} echo "$(tput setaf 2)universal-ctags, ncurses-term, ripgrep, fzf, nodejs, yarn, neovim, fonts$(tput sgr 0)"
    echo "---------------------------------------------------------"

    echo "---------------------------------------------------------"
    TERM=${TERM:-unknown} echo "$(tput setaf 3)Adding yarn's debian package repository.$(tput sgr 0)"
    echo "---------------------------------------------------------"

    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
    sudo apt-get update

    echo "---------------------------------------------------------"
    TERM=${TERM:-unknown} echo "$(tput setaf 2)Installing system packages.$(tput sgr 0)"
    echo "---------------------------------------------------------"

    sudo apt-get install -y universal-ctags ncurses-term ripgrep fzf fonts-powerline nodejs yarn neovim python3-pip
  fi

  echo "---------------------------------------------------------"
  TERM=${TERM:-unknown} echo "$(tput setaf 2)Installing Ruby neovim package.$(tput sgr 0)"
  echo "---------------------------------------------------------"

  which rvm > /dev/null 2>&1
  if [ $? -eq 0 ]
  then
    rvm @global do gem install neovim --no-ri --no-rdoc
  else
    sudo gem install neovim --no-ri --no-rdoc
  fi

  echo "---------------------------------------------------------"
  TERM=${TERM:-unknown} echo "$(tput setaf 2)Installing Python neovim package.$(tput sgr 0)"
  echo "---------------------------------------------------------"

  pip3 install neovim

  echo "---------------------------------------------------------"
  TERM=${TERM:-unknown} echo "$(tput setaf 2)Installing node neovim package$(tput sgr 0)"
  echo "---------------------------------------------------------"

  yarn global add neovim --ignore-optional
else
  echo "---------------------------------------------------------"
  TERM=${TERM:-unknown} echo "$(tput setaf 2)Preparing dependencies for MacOS:$(tput sgr 0)"
  TERM=${TERM:-unknown} echo "$(tput setaf 2)homebrew, nodejs, yarn, neovim, python, fonts$(tput sgr 0)"
  echo "---------------------------------------------------------"

  which brew > /dev/null 2>&1
  if [ $? -eq 0 ]
  then
    echo "---------------------------------------------------------"
    TERM=${TERM:-unknown} echo "$(tput setaf 3)homebrew already installed, skipping.$(tput sgr 0)"
    echo "---------------------------------------------------------"
  else
    echo "---------------------------------------------------------"
    TERM=${TERM:-unknown} echo "$(tput setaf 2)Installing Homebrew.$(tput sgr 0)"
    echo "---------------------------------------------------------"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  echo "---------------------------------------------------------"
  TERM=${TERM:-unknown} echo "$(tput setaf 2)Installing ripgrep, fzf, node, yarn, neovim and python as system packages.$(tput sgr 0)"
  echo "---------------------------------------------------------"

  for package in ripgrep fzf node yarn neovim python3
  do
    brew install $package
    echo "---------------------------------------------------------"
  done

  echo "---------------------------------------------------------"
  TERM=${TERM:-unknown} echo "$(tput setaf 2)Installing Ruby neovim package.$(tput sgr 0)"
  echo "---------------------------------------------------------"

  sudo gem install neovim

  echo "---------------------------------------------------------"
  TERM=${TERM:-unknown} echo "$(tput setaf 2)Installing Python neovim package.$(tput sgr 0)"
  echo "---------------------------------------------------------"

  pip3 install neovim

  echo "---------------------------------------------------------"
  TERM=${TERM:-unknown} echo "$(tput setaf 2)Installing node neovim package$(tput sgr 0)"
  echo "---------------------------------------------------------"

  yarn global add neovim --ignore-optional

  echo "---------------------------------------------------------"
  TERM=${TERM:-unknown} echo "$(tput setaf 2)JARVIS: Installing system fonts.$(tput sgr 0)"
  echo "---------------------------------------------------------"

  brew tap homebrew/cask-fonts
  brew install --cask font-dejavu-sans-mono-for-powerline font-fira-mono font-fira-mono-for-powerline font-fira-mono-nerd-font
fi

echo "---------------------------------------------------------"
TERM=${TERM:-unknown} echo "$(tput setaf 2)Linking dotfiles.$(tput sgr 0)"
echo "---------------------------------------------------------"

ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc

NVIM_DIR=${XDG_CONFIG_HOME:-$HOME/.config}/nvim

mkdir -p $NVIM_DIR/
ln -s ~/.vim/init.vim $NVIM_DIR/init.vim
ln -s ~/.vim/coc-settings.json $NVIM_DIR/coc-settings.json

echo "---------------------------------------------------------"
TERM=${TERM:-unknown} echo "$(tput setaf 2)Installing plugins.$(tput sgr 0)"
echo "---------------------------------------------------------"

cd ~/.vim
curl -fLo autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim -es -i NONE -u 'init.vim' -c 'PlugInstall' -c 'qa'
nvim -es -i NONE -u 'init.vim' -c 'UpdateRemotePlugins' -c 'qa'
nvim -es -i NONE -u 'init.vim' -c 'call coc#util#install()' -c 'qa'

echo "---------------------------------------------------------"
TERM=${TERM:-unknown} echo "$(tput setaf 2)Installing autocomplete tools.$(tput sgr 0)"
echo "---------------------------------------------------------"

which rvm > /dev/null 2>&1
if [ $? -eq 0 ]
then
  rvm @global do gem install solargraph --no-ri --no-rdoc
else
  sudo gem install solargraph --no-ri --no-rdoc
fi

nvim -es -i NONE -u 'init.vim' -c 'CocInstall coc-json' -c 'qa'
nvim -es -i NONE -u 'init.vim' -c 'CocInstall coc-solargraph coc-tsserver coc-css' -c 'qa'

echo "---------------------------------------------------------"
TERM=${TERM:-unknown} echo "$(tput setaf 2)Installing linters.$(tput sgr 0)"
echo "---------------------------------------------------------"

which rvm > /dev/null 2>&1
if [ $? -eq 0 ]
then
  rvm @global do gem install rubocop --no-ri --no-rdoc
else
  sudo gem install rubocop --no-ri --no-rdoc
fi

yarn global add eslint eslint-plugin-vue babel-eslint eslint-plugin-react --ignore-optional
yarn global add stylelint stylelint-scss --ignore-optional

echo "---------------------------------------------------------"
TERM=${TERM:-unknown} echo "$(tput setaf 2)Install complete.$(tput sgr 0)"
echo "---------------------------------------------------------"

exit 0
