if [[ `uname` == 'Linux' ]]; then
  export PATH="$HOME/.linuxbrew/bin:$PATH"
  export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
  export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"

  export PATH=$HOME/.rbenv/bin:$PATH
  eval "$(rbenv init -)"

  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi

if [[ `uname` == 'Darwin' ]]; then
  # ruby
  eval "$(rbenv init -)"

  # node
  export PATH="${HOME}/.ndenv/bin:${PATH}"
  eval "$(ndenv init -)"

  # python
  # eval "$(pyenv init -)"
  # added by Anaconda3 installer
  export PATH="/Users/lapis/anaconda3/bin:$PATH"

  # golang
  export PATH="$HOME/.goenv/bin:$PATH"
  export GOPATH="$HOME/go"
  export PATH="$GOPATH/bin:$PATH"
  eval "$(goenv init -)"
fi
