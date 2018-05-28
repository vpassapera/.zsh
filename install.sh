#!/usr/bin/env bash

echo "Downloading submodules..."
(cd $HOME/.zsh && git submodule update --init --recursive --remote)

echo "Initializing oh-my-zsh..."
rm -f $HOME/.oh-my-zsh # in case it already exists...
ln -sf $HOME/.zsh/.submodules/oh-my-zsh $HOME/.oh-my-zsh
ln -sf $HOME/.zsh/.submodules/zsh-syntax-highlighting $HOME/.oh-my-zsh/custom/plugins
mkdir -p $HOME/.oh-my-zsh/custom/themes/

ln -sf $HOME/.zsh/themes/candy-alt $HOME/.oh-my-zsh/custom/themes
ln -sf $HOME/.zsh/.submodules/powerlevel9k $HOME/.oh-my-zsh/custom/themes
echo "Initializing .zsh"
ln -sf $HOME/.zsh/zaliases $HOME/.zaliases
ln -sf $HOME/.zsh/zenv $HOME/.zenv
ln -sf $HOME/.zsh/zfunctions $HOME/.zfunctions
ln -sf $HOME/.zsh/zprofile $HOME/.zprofile
ln -sf $HOME/.zsh/zprofile $HOME/.zshrc
echo "Making tmux pretty..."
ln -sf $HOME/.zsh/tmux/tmux.conf $HOME/.tmux.conf
ln -sf $HOME/.zsh/tmux/tmux.conf.local $HOME/.tmux.conf.local

echo "Resource with \". ~/.zshrc\""
