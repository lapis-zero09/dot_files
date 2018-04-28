#!/bin/sh -eu

if ! type brew > /dev/null 2&>1; then
  if [[ `uname` == 'Darwin' ]]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
     #ndenv
    # zplug
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh
    # tpm
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    # git clone https://github.com/riywo/node-build.git $(ndenv root)/plugins/node-build

    echo "Write /usr/local/bin/zsh in /etc/shells"
    echo "chsh -s /usr/local/bin/zsh"
  else
    echo 'This system is not Darwin.'
    exit 1
  fi
fi

if ! type apm > /dev/null 2&>1; then
    brew install curl wget git tmux zsh nvim docker pyenv rbenv ruby-build powerline ghq
    brew cask install atom slack notion spotify mendeley firefox google-chrome docker basictex
    brew tap sanemat/font
    brew install ricty --patch-in-place --powerline --vim-powerline
    cp -f /usr/local/opt/ricty/share/fonts/Ricty*.ttf ~/Library/Fonts/
    fc-cache -vf
    git config --global ghq.root ~/Documents
fi
