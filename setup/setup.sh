#!/bin/sh -eu

if ! type brew > /dev/null 2&>1; then
  if [[ `uname` == 'Darwin' ]]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew install curl wget git tmux zsh nvim rettach-to-user-namespace docker pyenv rbenv ruby-build #ndenv
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh

    # git clone https://github.com/riywo/node-build.git $(ndenv root)/plugins/node-build

    echo "Write /usr/local/bin/zsh in /etc/shells"
    echo "chsh -s /usr/local/bin/zsh"
  else
    echo 'This system is not Darwin.'
    exit 1
  fi
fi

if ! type brew > /dev/null 2&>1; then


if ! type apm > /dev/null 2&>1; then
    brew cask install atom slack notion spotify mendeley firefox google-chrome docker
end
