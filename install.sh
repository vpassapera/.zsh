#!/usr/bin/env bash

echo "Downloading submodules..."
(cd $HOME/.zsh && git submodule update --init --recursive --remote)

echo "Initializing oh-my-zsh..."
rm -f $HOME/.oh-my-zsh # in case it already exists...
ln -sf $HOME/.zsh/.submodules/oh-my-zsh $HOME/.oh-my-zsh
ln -sf $HOME/.zsh/.submodules/zsh-syntax-highlighting $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
mkdir -p $HOME/.oh-my-zsh/custom/themes/

ln -sf $HOME/.zsh/themes/candy-alt $HOME/.oh-my-zsh/custom/themes
echo "Initializing .zsh"
ln -sf $HOME/.zsh/zaliases $HOME/.zaliases
ln -sf $HOME/.zsh/zenv $HOME/.zenv
ln -sf $HOME/.zsh/zfunctions $HOME/.zfunctions
ln -sf $HOME/.zsh/zprofile $HOME/.zprofile
ln -sf $HOME/.zsh/zprofile $HOME/.zshrc

echo "Resource with \". ~/.zshrc\""
