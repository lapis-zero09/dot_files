alias la='ls -a'
alias ll='ls -l'
alias lla='ls -al'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias mkdir='mkdir -p'
alias sudo='sudo '
alias -g L='| less'
alias -g G='| grep'

alias vim='nvim'
alias vi='nvim'

alias cat='ccat'

if [[ -x `which colordiff` ]]; then
  alias diff='colordiff -u'
else
  alias diff='diff -u'
fi

alias maketex='(){ latexmk -pvc $1 --output-directory=out}'
eval $(thefuck --alias)


if [[ `hostname` == 'VMax.local' ]]; then
    alias nvidia-smi='(){ watch -c -d -n $1 cuda-smi }'
fi

# OS 別の設定
case ${OSTYPE} in
    darwin*)
        #Mac用の設定
        export CLICOLOR=1
        alias ls='ls -G -F'
        ;;
    linux*)
        #Linux用の設定
        alias ls='ls -F --color=auto'
        ;;
esac
