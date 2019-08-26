export LANG=ja_JP.UTF-8
bindkey -e

HISTFILE=~/.config/zsh/zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

source ~/.config/zsh/aliases.zsh
source ~/.config/zsh/options.zsh
source ~/.config/zsh/theme.zsh
source ~/.config/zsh/zplug.zsh
source ~/.config/zsh/path.zsh

if [ -f $(brew --prefix)/etc/brew-wrap ];then
  source $(brew --prefix)/etc/brew-wrap
fi


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

