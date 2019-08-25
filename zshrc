export LANG=ja_JP.UTF-8
bindkey -e

# ヒストリの設定
HISTFILE=~/.config/zsh/zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

source ~/.config/zsh/aliases.zsh
source ~/.config/zsh/options.zsh
source ~/.config/zsh/theme.zsh
source ~/.config/zsh/zplug.zsh
source ~/.config/zsh/path.zsh


# The next line updates PATH for the Google Cloud SDK.
# if [ -f '/Users/01024162/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/01024162/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
# if [ -f '/Users/01024162/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/01024162/google-cloud-sdk/completion.zsh.inc'; fi
#
#
source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc


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

