export ZPLUG_HOME=~/.zplug
source $ZPLUG_HOME/init.zsh

#zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# zplug 'prikhi/molokai-powerline-zsh', as:theme
# zplug 'simnalamburt/shellder', as:theme

zplug 'Tarrasch/zsh-bd'
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "chrissicool/zsh-256color"
zplug "zsh-users/zsh-syntax-highlighting", defer:0
zplug "zsh-users/zsh-history-substring-search", defer:1
zplug "b4b4r07/enhancd", use:enhancd.sh
zplug "plugins/git",   from:oh-my-zsh

zplug "junegunn/fzf-bin", \
    from:gh-r, \
    as:command, \
    rename-to:fzf, \
    use:"*darwin*amd64*"

export FZF_DEFAULT_OPTS='--height 40% --reverse --border'
zplug "lapis-zero09/5b202bbff8f15826ff2cc9e2d36a6efa", from:gist # ghq-fzf.zsh
zplug "lapis-zero09/51d3d15503f07960eb2938ee1b38c2e6", from:gist # history-fzf.zsh
zplug "lapis-zero09/062dd16d8758c77359f21bb0d2470ee7", from:gist # ssh-fzf.zsh
zplug "lapis-zero09/c4c8b5e81b42547b8ed8162134b3c1e7", from:gist # git-branch-fzf.zsh
zplug "lapis-zero09/0120963f277cc1e9b713c4ea6da437a0", from:gist # tree-fzf.zsh
zplug "rupa/z", use:"*.sh"
zplug "b4b4r07/gist", from:gh-r, as:command, use:"*darwin*amd64*"

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load

