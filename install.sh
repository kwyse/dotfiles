#!/bin/bash
#
# Installation script to configure links between a dotfiles directory
# and the home directory, and then install zsh.
#

DIR=~/dotfiles
FILES="vimrc zshrc zshenv zlogin"
REPO="https://github.com/kwyse/dotfiles.git"

for FILE in $FILES; do
  echo "Creating symlink to $FILE in home directory."
  ln -s $DIR/$FILE ~/.$FILE
done

install_zsh() {
  # If zsh is already installed
  if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
    # Set the default login shell to zsh if it is not already
    if [[ !$(echo $SHELL) == $(which zsh) ]]; then
      chsh -s $(which zsh)
    fi
  else
    # Install zsh depending on the platform
    PLATFORM=$1;
    if [[ $PLATFORM == "archlinux" ]]; then
      echo "Attempting to install zsh..."
      sudo pacman -S zsh
      install_zsh()
    elif [[ $PLATFORM == "debian" ]]; then
      echo "Attempting to install zsh..."
      sudo apt-get install zsh
      install_zsh()
    elif [[ $PLATFORM == "macosx" ]]; then
      echo "Not attempting to install zsh..."
    else
      echo "Unrecognised platform"
    fi
  fi
}

install_zsh()

