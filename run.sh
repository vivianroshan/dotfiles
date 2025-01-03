#!/bin/bash
script_dir=$(dirname "$(readlink -f "$0")")

set -x
ln -s "$script_dir/.zshrc"  ~/
ln -s "$script_dir/.vimrc"  ~/
ln -s "$script_dir/nvim"    ~/.config/
ln -s "$script_dir/tmux"    ~/.config/
ln -s "$script_dir/ghostty" ~/.config
set +x

