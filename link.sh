#!/bin/sh
mkdir -p ~/.config/nvim


for file in $(ls -A home)
do
  ln -sf $(pwd)/home/$file ~/$file
done

for file in $(ls -A config)
do
  ln -sf $(pwd)/config/$file ~/.config/$file
done

ln -sf $(pwd)/nvim/init.vim ~/.config/nvim/

