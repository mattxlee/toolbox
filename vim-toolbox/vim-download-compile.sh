#!/bin/bash

OUTPUT_DIR=$PWD/build
VIMDIR=vim74
VERSION=7.4
PATCH_FILE="$PWD/patch-for-vim74.diff"

# make temporary directory
[ ! -d $OUTPUT_DIR ] && mkdir $OUTPUT_DIR
cd $OUTPUT_DIR

# download
[ ! -e vim-$VERSION.tar.bz2 ] && wget ftp://ftp.vim.org/pub/vim/unix/vim-$VERSION.tar.bz2

# extract
tar xf vim-$VERSION.tar.bz2
cd $VIMDIR

# compile source code
patch -p1 < $PATCH_FILE

# the following line is for debian
./configure --with-features=huge --enable-pythoninterp=yes --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu/

make
make install
echo ==== end of compiling vim ====
