#!/bin/bash
#
# Creates symlinks between repo directory and expected target locations.
#
# If the main config folder doesn't exist, the script will exit before attempting to
# symlink config directories. If any file or folder already exists at the target
# symlink location, it will be skipped.

repo_dir=$(dirname "$(realpath $0)")

# First, symlink individual files expected to exist in $HOME
for file in zshrc
do
  if [ -e "$HOME/.$file" ]; then
    echo ".$file config file already exists in $HOME, skipping"
  else
    ln -s "$repo_dir/config/$file" "$HOME/.$file"
  fi
done

config_root="$HOME/.config"

if [ ! -d "$config_root" ]; then
  echo "config directory $config_root does not exist"
  exit 1
fi

# Next, symlink directories expected to exist in $HOME/.config
for dir in alacritty helix
do
  if [ -e "$config_root/$dir" ]; then
    echo "$dir config dir already exists in $config_root, skipping"
  else
    ln -s "$repo_dir/config/$dir" "$config_root/$dir"
  fi
done
