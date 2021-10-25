#! /bin/bash

echo "Welcome to sanjay's files repository"

echo "What is your computer username?"
read name
dest_dir="/home/$name/"

echo "Would you like to download the files? [Y/n]"
read files

if [[ ${files,,} =~ y ]]
    then
        echo "Downloading the files"
        cp -v Pictures/* $dest_dir/Pictures/
        cp -v  dotfiles/zshrc $dest_dir/.zshrc
        cp -v dotfiles/bash_aliases $dest_dir/.bash_aliases
        cp -fv dotfiles/config/* $dest_dir/.config/
        echo "Finished downloading the files"

else
    echo "Abort"

fi

exit

