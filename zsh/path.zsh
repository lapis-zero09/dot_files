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
  export PATH=$HOME/.rbenv/bin:$PATH
  eval "$(rbenv init -)"

  # node
  export PATH="${HOME}/.ndenv/bin:${PATH}"
  eval "$(ndenv init -)"

  # golang
  export PATH="$HOME/.goenv/bin:$PATH"
  export GOPATH="$HOME/go"
  export PATH="$GOPATH/bin:$PATH"
  eval "$(goenv init -)"

  # The next line updates PATH for the Google Cloud SDK.
  if [ -f '/Users/lapis/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/lapis/google-cloud-sdk/path.zsh.inc'; fi

  # The next line enables shell command completion for gcloud.
  if [ -f '/Users/lapis/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/lapis/google-cloud-sdk/completion.zsh.inc'; fi

  if [[ `hostname` == 'VMax.local' ]]; then
    # added by Anaconda3 installer
    export PATH="/Users/lapis/anaconda3/bin:$PATH"
    export CUDA_HOME=/usr/local/cuda
    export DYLD_LIBRARY_PATH=/usr/local/cuda/lib:/usr/local/cuda/extras/CUPTI/lib
    export LD_LIBRARY_PATH=$DYLD_LIBRARY_PATH
    export PATH=$DYLD_LIBRARY_PATH:$PATH

    eval $(thefuck --alias)
    export PATH="${HOME}/Documents/github.com/phvu/cuda-smi:$PATH"
  else
    # python
    eval "$(pyenv init -)"
  fi
fi
