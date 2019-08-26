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
