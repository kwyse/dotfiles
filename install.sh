#!/bin/bash

function install_brew {
  echo "Installing Homebrew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}


if [[ "$OSTYPE" == darwin* ]] ; then
  command -v brew >/dev/null 2>&1 || install_brew
  XDG_CONFIG_HOME=$HOME/.config
  install_command="brew install"
elif [[ "$OSTYPE" == linux* ]]; then
  command -v emerge >/dev/null 2>&1 && install_command="sudo emerge"
fi

if [[ -z ${install_command} ]]; then
  echo "No suitable package manager found"
  exit 1
fi

deps=(fzf)

for dep in deps; do
  command -v fzf >/dev/null 2>&1 || `${install_command} fzf`
done

if [[ -z ${DEIN_INSTALL_DIR} ]]; then
  echo "Dein install directory for Vim plugins is not set"
  exit 1
fi

if [[ -z ${DOTFILES_DIR} ]]; then
  echo "Dotfiles directory is not set"
  exit 1
fi


if [ ! -d ${DEIN_INSTALL_DIR} ]; then
  curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh -sSf | sh -s -- $DEIN_INSTALL_DIR >/dev/null 2>&1
fi

if [ ! -d ${XDG_CONFIG_HOME}/nvim ]; then
  ln -s ${DOTFILES_DIR}/nvim ${XDG_CONFIG_HOME}/nvim
fi