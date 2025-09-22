export XDG_CONFIG_HOME=$HOME/.config

if [[ `uname` == 'Darwin' ]]; then
  # golang
  export PATH="$HOME/.goenv/bin:$PATH"
  export GOPATH="$HOME/go"
  export PATH="$GOPATH/bin:$PATH"
  eval "$(goenv init -)"


  eval $(thefuck --alias)
  export PATH="/usr/local/opt/inetutils/libexec/gnubin:$PATH"
  export PATH="/usr/local/opt/curl/bin:$PATH"
  alias telnet=/usr/local/bin/telnet
  eval "$(direnv hook zsh)"

  # conda init "$(basename "${SHELL}")"

  # >>> Pipenv setting >>>
  # eval "$(pipenv --completion)"
  # export PIPENV_VENV_IN_PROJECT=true
  # <<< Pipenv settings <<<

  source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
  source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"

  # mysql client
  export PATH="/usr/local/opt/mysql-client/bin:$PATH"
  export LDFLAGS="-L/usr/local/opt/mysql-client/lib"
  export CPPFLAGS="-I/usr/local/opt/mysql-client/include"

  # libffi
  export LDFLAGS="-L/opt/homebrew/opt/libffi/lib"
  export CPPFLAGS="-I/opt/homebrew/opt/libffi/include"
fi

