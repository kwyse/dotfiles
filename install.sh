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

deps=(fzf tmux)

for dep in $deps; do
  command -v $dep >/dev/null 2>&1 || `${install_command} $dep`
done

if [[ -z ${DOTFILES_DIR} ]]; then
  echo "Dotfiles directory is not set"
  exit 1
fi


if [ ! -d ${XDG_CONFIG_HOME}/nvim ]; then
  ln -s ${DOTFILES_DIR}/nvim ${XDG_CONFIG_HOME}/nvim
fi

mkdir -p ${XDG_CONFIG_HOME}/nvim/pack/minpac/opt
if [[ -z "$(ls -A ${XDG_CONFIG_HOME}/nvim/pack/minpac/opt)" ]]; then
  git clone https://github.com/k-takata/minpac.git ${XDG_CONFIG_DIR}/nvim/pack/minpac/opt/minpac
fi

if [[ `command -v fzf >/dev/null 2>&1` ]]; then
  # TODO: Cargo and/or the crate bin directory may need to be added to the PATH
  if [[ "$OSTYPE" == darwin* ]]; then
    curl https://sh.rustup.rs -sSf | sh -s -- -y
  else
    `${install_command} rustup`
  fi
fi

command -v racer >/dev/null 2>&1 || cargo install racer

if [[ -z ${RUST_SRC_PATH} ]]; then
  echo "Rust source directory is not set"
  exit 1
fi

if [ ! -d "${RUST_SRC_PATH}" ]; then
  rustup component add rls-preview rust-analysis rust-src
fi
