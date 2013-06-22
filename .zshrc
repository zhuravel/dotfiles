# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="gallois"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx colored-man gem brew go bundler rake rails3)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:/Users/bohdan/.rvm/gems/ruby-1.9.3-p392@recommender/bin:/Users/bohdan/.rvm/gems/ruby-1.9.3-p392@global/bin:/Users/bohdan/.rvm/rubies/ruby-1.9.3-p392/bin:/Users/bohdan/.rvm/bin:/Users/bohdan/.rvm/bin
bindkey '^R' history-incremental-search-backward

alias ptt='rake parallel:test'
alias pts='rake parallel:spec'
alias combo='rake db:migrate parallel:migrate db:schema:dump'

alias mysql='mysql -u root'
alias mysql-start='launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist'
alias mysql-stop='launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist'
alias mysql-dir='cd /usr/local/var/mysql/'

alias psql='psql -U bohdan postgres'
alias psql-start='launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist'
alias psql-stop='launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist'
