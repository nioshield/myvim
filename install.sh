#!/bin/bash

CURRENT_DIR=`pwd`

lnif() {
    if [ -e "$1" ]; then
        ln -sf "$1" "$2"
    fi
}

echo "Step1: backing up current vim config"
today=`date +%Y%m%d`
for i in $HOME/.vim $HOME/.vimrc  $HOME/.vimrc.plug; do [ -e $i ] && [ ! -L $i ] && mv $i $i.$today; done
for i in $HOME/.vim $HOME/.vimrc  $HOME/.vimrc.plug; do [ -L $i ] && unlink $i ; done

echo "Step2: setting up symlinks"
lnif $CURRENT_DIR/vimrc $HOME/.vimrc
lnif $CURRENT_DIR/vimrc.plug $HOME/.vimrc.plug
lnif $CURRENT_DIR/ $HOME/.vim
mkdir -p $CURRENT_DIR/autoload
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Step3: update/install plugins using Vim-plug"
system_shell=$SHELL
export SHELL="/bin/sh"
vim -u $HOME/.vimrc.plug +PlugInstall! +PlugClean! +qall
export SHELL=$system_shell

echo "Install Done!"
