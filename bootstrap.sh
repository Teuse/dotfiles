#!/bin/bash
# This script creates symlinks from the home directory to any desired dotfiles
# in ~/dotfiles

#-------------------------------------------------------------------------------
dir=~/Develop/dotfiles                    # dotfiles directory
olddir=~/Develop/dotfiles_old             # old dotfiles backup directory
files="vimrc gitignore_global lldbinit inputrc zshrc"    # list of files/folders to symlink in homedir

#-------------------------------------------------------------------------------
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir

#-------------------------------------------------------------------------------
echo "Moving any existing dotfiles from ~ to $olddir as a backup"
for file in $files; do
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

echo "Successful... Cheers"
