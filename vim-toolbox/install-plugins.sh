#!/bin/sh

echo Downloading VundleVim ...
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo Copying .vimrc file ...
cp .vimrc ~/.vimrc
cp .tern-project ~/.tern-project
cp .ycm_extra_conf.py ~/.ycm_extra_conf.py

echo Install plugins ...
vim +PluginInstall
