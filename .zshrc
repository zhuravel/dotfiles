ZSH=$HOME/.oh-my-zsh
ZSH_THEME="gallois"
DISABLE_AUTO_UPDATE="true"

plugins=(git osx colored-man gem brew go bundler rake rails3 zhuravel)

export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin"
export EDITOR="subl -w"

source $ZSH/oh-my-zsh.sh
