#!/bin/sh -eu

if ! type brew > /dev/null 2&>1; then
  if [[ `uname` == 'Darwin' ]]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    # zplug
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh
    # tpm
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

    echo "Write /usr/local/bin/zsh in /etc/shells"
    echo "chsh -s /usr/local/bin/zsh"
  else
    echo 'This system is not Darwin.'
    exit 1
  fi
fi

if ! type apm > /dev/null 2&>1; then
    brew install curl wget git tmux zsh nvim docker pyenv rbenv ruby-build powerline ghq
    brew cask install atom slack notion spotify mendeley firefox google-chrome docker postman burp-suite visual-studio-code
    brew tap sanemat/font
    brew install ricty --patch-in-place --powerline --vim-powerline
    cp -f /usr/local/opt/ricty/share/fonts/Ricty*.ttf ~/Library/Fonts/
    fc-cache -vf
    git config --global ghq.root ~/Documents
fi

if ! type ndenv > /dev/null 2&>1; then
    # ndenv
    brew install ndenv
    git clone https://github.com/riywo/node-build.git $(ndenv root)/plugins/node-build
fi
# tex configuration

if ! type tlmgr > /dev/null 2&>1; then
    brew cask install basictex
    sudo tlmgr update --self --all
    sudo tlmgr install uplatex latexmk collection-langjapanese algorithmicx algorithms
    if [[ `uname` == 'Darwin' ]]; then
        cd /usr/local/texlive/2017basic/texmf-dist/scripts/cjk-gs-integrate
        sudo perl cjk-gs-integrate.pl --link-texmf --force
        sudo mktexlsr
        sudo kanji-config-updmap-sys hiragino-elcapitan-pron
    fi
fi
