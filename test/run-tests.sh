#!/usr/bin/env bash

oldpwd=$PWD
cd $(dirname $(readlink -f $0))/..

# make sure dependencies are set up
test -d vader.vim || git clone https://github.com/junegunn/vader.vim.git
test -d vim-repeat || git clone https://github.com/tpope/vim-repeat.git
test -d vader.vim || exit 1
test -d vim-repeat || exit 1

command vim -Nu test/vimrc -c 'Vader! test/*'
ret=$?
cd $oldpwd

exit $ret
