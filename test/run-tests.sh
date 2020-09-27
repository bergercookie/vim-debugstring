#!/usr/bin/env bash
# file taken directly from https://github.com/junegunn/vader.vim

set -e


oldpwd=$PWD
cd $(dirname $(readlink -f $0))/..
test -d vader.vim || git clone https://github.com/junegunn/vader.vim.git
test -d vim-repeat || git clone https://github.com/tpope/vim-repeat.git
command vim -Nu test/vimrc -c 'Vader! test/*'
cd $oldpwd
