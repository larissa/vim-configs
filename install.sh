#!/bin/sh

if [ $(uname -s) = 'Linux' ]
then
  echo "---------------------------------------------------------"
  echo "$(tput setaf 2)Preparing dependencies for Linux:$(tput sgr 0)"
  echo "$(tput setaf 2)universal-ctags, ncurses-term, ripgrep, fzf, neovim, fonts$(tput sgr 0)"
  echo "---------------------------------------------------------"

  echo "---------------------------------------------------------"
  echo "$(tput setaf 2)Installing system packages.$(tput sgr 0)"
  echo "---------------------------------------------------------"

  sudo apt-get install -y universal-ctags ncurses-term ripgrep fzf fonts-powerline neovim
else
  echo "---------------------------------------------------------"
  echo "$(tput setaf 2)Preparing dependencies for MacOS:$(tput sgr 0)"
  echo "$(tput setaf 2)homebrew, neovim, fonts$(tput sgr 0)"
  echo "---------------------------------------------------------"

  which brew > /dev/null 2>&1
  if [ $? -eq 0 ]
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
  echo "$(tput setaf 2)Installing ripgrep, fzf, and neovim as system packages.$(tput sgr 0)"
  echo "---------------------------------------------------------"

  for package in ripgrep fzf neovim
  do
    brew install $package
    echo "---------------------------------------------------------"
  done

  echo "---------------------------------------------------------"
  echo "$(tput setaf 2)JARVIS: Installing system fonts.$(tput sgr 0)"
  echo "---------------------------------------------------------"

  brew tap homebrew/cask-fonts
  brew install --cask font-dejavu-sans-mono-for-powerline font-fira-mono font-fira-mono-for-powerline font-fira-mono-nerd-font font-dejavu-sans-mono-nerd-font
fi

echo "---------------------------------------------------------"
echo "$(tput setaf 2)Linking dotfiles.$(tput sgr 0)"
echo "---------------------------------------------------------"

ln -s ~/.nvim ${XDG_CONFIG_HOME:-$HOME/.config}/nvim

echo "---------------------------------------------------------"
echo "$(tput setaf 2)Install complete.$(tput sgr 0)"
echo "---------------------------------------------------------"

exit 0
