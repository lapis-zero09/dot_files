#!/bin/sh

cp zshrc ~/.zshrc
cp -r zsh ~/.config/
cp -r dein ~/.config/
cp -r nvim ~/.config/
cp tmux.conf ~/.tmux.conf

source ~/.zshrc
