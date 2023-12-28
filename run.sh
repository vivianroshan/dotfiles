#!/bin/sh
script_dir=$(dirname "$(readlink -f "$0")")
ln -s "$script_dir/nvim" ~/.config/
ln -s "$script_dir/tmux" ~/.config/
ln -s "$script_dir/.vimrc" ~/

