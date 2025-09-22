export LANG=ja_JP.UTF-8
bindkey -e

HISTFILE=~/.config/zsh/zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# brew setting
eval "$(/opt/homebrew/bin/brew shellenv)"
if [ -f $(brew --prefix)/etc/brew-wrap ];then
  source $(brew --prefix)/etc/brew-wrap
fi

# sheldon settings
export FZF_DEFAULT_OPTS="--height 40% --reverse"
export ENHANCD_FILTER="fzf --height 40%:fzy"
export ENHANCD_HOOK_AFTER_CD="ls"
eval "$(sheldon source)"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# zsh settings
source ~/.config/zsh/aliases.zsh
source ~/.config/zsh/options.zsh
source ~/.config/zsh/theme.zsh
source ~/.config/zsh/path.zsh

