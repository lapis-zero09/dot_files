# 環境変数
export LANG=ja_JP.UTF-8

# 色を使用出来るようにする
autoload -Uz colors
colors

# emacs 風キーバインドにする
bindkey -e

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# プロンプト
# 1行表示
# PROMPT="%~ %# "
# 2行表示
PROMPT="%{${fg[black]}%}[%n@%m]%{${reset_color}%} %~
%# "


# 単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default
# ここで指定した文字は単語区切りとみなされる
# / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

########################################
# 補完
# 補完機能を有効にする
autoload -Uz compinit
compinit -u

#for zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..

# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'


########################################
# vcs_info
autoload -Uz vcs_info
autoload -Uz add-zsh-hook

zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'

function _update_vcs_info_msg() {
    LANG=en_US.UTF-8 vcs_info
    RPROMPT="${vcs_info_msg_0_}"
}
add-zsh-hook precmd _update_vcs_info_msg


########################################
# オプション
# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# beep を無効にする
setopt no_beep

# フローコントロールを無効にする
setopt no_flow_control

# Ctrl+Dでzshを終了しない
setopt ignore_eof

# '#' 以降をコメントとして扱う
setopt interactive_comments

# ディレクトリ名だけでcdする
setopt auto_cd

# cd したら自動的にpushdする
setopt auto_pushd
# 重複したディレクトリを追加しない
setopt pushd_ignore_dups

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# 高機能なワイルドカード展開を使用する
setopt extended_glob

########################################
# キーバインド

# ^R で履歴検索をするときに * でワイルドカードを使用出来るようにする
bindkey '^R' history-incremental-pattern-search-backward

########################################
# エイリアス

alias gch='git checkout'
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gps='git push origin'
alias gp='git pull'
alias gm='git merge'


alias la='ls -a'
alias ll='ls -l'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias mkdir='mkdir -p'

# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '

# グローバルエイリアス
alias -g L='| less'
alias -g G='| grep'

# C で標準出力をクリップボードにコピーする
# mollifier delta blog : http://mollifier.hatenablog.com/entry/20100317/p1
if which pbcopy >/dev/null 2>&1 ; then
    # Mac
    alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1 ; then
    # Linux
    alias -g C='| xsel --input --clipboard'
elif which putclip >/dev/null 2>&1 ; then
    # Cygwin
    alias -g C='| putclip'
fi


# brew path

alias brew="env PATH=${PATH/\/Users\/KonoShinsaku\/\.pyenv\/shims:/} brew"

export PATH="/usr/local/sbin:$PATH"

########################################
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
########################################
if [[ -s ~/.nvm/nvm.sh ]];
 then source ~/.nvm/nvm.sh
fi
# rbenv
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PATH="$HOME/.gem/ruby/2.2.0/bin:$PATH"

PATH=/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/local/sbin:/Users/KonoShinsaku/.rbenv/shims:/Users/KonoShinsaku/.rbenv/bin:/Users/KonoShinsaku/.rbenv/shims:/Users/KonoShinsaku/.rbenv/bin:/usr/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Users/KonoShinsaku/.rvm/bin

export PATH="/usr/local/bin":$PATH

# tex
export PATH="/usr/local/texlive/2015/bin/x86_64-darwin":$PATH

# nvim
export XDG_CONFIG_HOME=~/.config

# pyenv, virtualenv
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# pylearn2
export PYLEARN2_DATA_PATH=~/Documents/projects/illust_deep
export PATH="$HOME/Documents/projects/illust_deep/pylearn2/pylearn2/scripts":$PATH

# tmux-session
function is_tmux_runnning() { [ ! -z "$TMUX" ]; }
function tmux_automatically_attach_session()
{if is_tmux_runnning; then
        echo "${fg_bold[red]} Hey! This is Tmux. ${reset_color}"
        echo "${fg_bold[red]}  _____  _     _   _______ _______ _                 ${reset_color}"
        echo "${fg_bold[red]} |  __ \(_)   | | |__   __|__   _|(_) ${reset_color}"
        echo "${fg_bold[red]} | |__| |_  __| | ___| | ___ | |   _ _ __ ___   ___ ${reset_color}"
        echo "${fg_bold[red]} |  _  /| |/ _\` |/ _ \ |/ _ \| |  | | '_ \` _ \ / _ \ ${reset_color}"
        echo "${fg_bold[red]} | | \ \| | (_| |  __/ | (_) | |  | | | | | | |  __/ ${reset_color}"
        echo "${fg_bold[red]} |_|  \_\_|\__,_|\___|_|\___/|_|  |_|_| |_| |_|\___| ${reset_color}"
fi}
tmux_automatically_attach_session


# go
export GOPATH=$HOME/.go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export PATH=$PATH:/usr/local/opt/go/libexec/bin


# tensorflow 3.5
export TF_BINARY_URL=https://storage.googleapis.com/tensorflow/mac/tensorflow-0.9.0rc0-py3-none-any.whl

# lesspipe & source highlight
export LESS='-R'

LESSOPEN="|/usr/local/bin/lesspipe.sh %s"
export LESSOPEN
LESS_ADVANCED_PREPROCESSOR=1; export LESS_ADVANCED_PREPROCESSOR
export PATH="/usr/local/sbin:$PATH"
