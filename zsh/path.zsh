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
  export PATH=$HOME/.nodebrew/current/bin:$PATH
  export PATH=$PATH:./node_modules/.bin

  # golang
  export PATH="$HOME/.goenv/bin:$PATH"
  export GOPATH="$HOME/go"
  export PATH="$GOPATH/bin:$PATH"
  eval "$(goenv init -)"


  eval $(thefuck --alias)
  export PATH="/usr/local/opt/inetutils/libexec/gnubin:$PATH"
  alias telnet=/usr/local/bin/telnet
  eval "$(direnv hook zsh)"

  if [[ `hostname` == 'shinsk.local' ]]; then
    source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
    source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
  fi

  if [[ `hostname` == 'CA4004.local' ]]; then
    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/anaconda3/etc/profile.d/conda.sh" ]; then
            . "/anaconda3/etc/profile.d/conda.sh"
        else
            export PATH="/anaconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup
    # <<< conda initialize <<<

    source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
    source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
  fi

  if [[ `hostname` == 'VMax.local' ]]; then
    # added by Anaconda3 installer
    export PATH="/Users/lapis/anaconda3/bin:$PATH"
    export CUDA_HOME=/usr/local/cuda
    export DYLD_LIBRARY_PATH=/usr/local/cuda/lib:/usr/local/cuda/extras/CUPTI/lib
    export LD_LIBRARY_PATH=$DYLD_LIBRARY_PATH
    export PATH=$DYLD_LIBRARY_PATH:$PATH

    # The next line updates PATH for the Google Cloud SDK.
    if [ -f '/Users/lapis/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/lapis/google-cloud-sdk/path.zsh.inc'; fi
    # The next line enables shell command completion for gcloud.
    if [ -f '/Users/lapis/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/lapis/google-cloud-sdk/completion.zsh.inc'; fi

    export PATH="${HOME}/Documents/github.com/phvu/cuda-smi:$PATH"
  fi

  if [[ `hostname` == 'CA3447.local' ]]; then
    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('/usr/local/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/usr/local/anaconda3/etc/profile.d/conda.sh" ]; then
            . "/usr/local/anaconda3/etc/profile.d/conda.sh"
        else
            export PATH="/usr/local/anaconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup
    # <<< conda initialize <<<
    source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
    source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
  fi
fi
