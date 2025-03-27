#!/bin/bash
script_dir=$(dirname "$(readlink -f "$0")")

set -x
ln -s "$script_dir/.zshrc"           ~/
ln -s "$script_dir/nvim/init.vim"    ~/.vimrc
ln -s "$script_dir/git"              ~/.config/
ln -s "$script_dir/nvim"             ~/.config/
ln -s "$script_dir/tmux"             ~/.config/
ln -s "$script_dir/ghostty"          ~/.config/
ln -s "$script_dir/karabiner"        ~/.config/
set +x

# rm -rf ~/.zshrc ~/.vimrc ~/.config/git ~/.config/nvim ~/.config/tmux ~/.config/ghostty ~/.config/karabiner
