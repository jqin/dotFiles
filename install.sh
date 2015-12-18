#!/bin/bash
############################
# install.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotFiles
############################

########## Variables

# dotfiles directory
dir=~/dotFiles
# list of files/folders to symlink in homedir
files=".zshrc .bashrc .gitconfig .gitignore .tmux.conf .tmux_snapshot .vimrc .git-completion.bash .git-prompt.sh"

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

# install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install vim theme
mkdir -p ~/.vim/colors
cp ~/dotFiles/.vim/colors/xoria256-pluk.vim ~/.vim/colors/xoria256-pluk.vim

source ~/.zshrc
