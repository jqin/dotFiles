#!/bin/bash
############################
# install.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotFiles
############################

########## Variables

# dotfiles directory
dir=~/dotFiles
# list of files/folders to symlink in homedir
files=".bashrc .gitconfig .gitignore .tmux.conf .tmux_snapshot .vimrc"

##########

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
    echo "Creating symlink to $file in home directory."
    ln -sf $dir/$file ~/$file
done

source ~/.bashrc
