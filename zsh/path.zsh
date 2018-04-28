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
  eval "$(rbenv init -)"
  eval "$(pyenv init -)"
fi
