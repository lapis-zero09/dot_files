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
if [ -f '/Users/01024162/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/01024162/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/01024162/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/01024162/google-cloud-sdk/completion.zsh.inc'; fi
