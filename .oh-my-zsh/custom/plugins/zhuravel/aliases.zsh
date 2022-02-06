alias mysql='mysql -uroot'
alias ping='ping -c 5' # Ping 5 times ‘by default’
alias prevent-sleep='pmset noidle' # also `caffeinate`
alias 'ps?'='ps ax | grep ' # Easily search running processes
alias pull='gh pr checkout'
alias reload="exec $SHELL -l" # Reload the shell (i.e. invoke as a login shell)

# Get macOS Software Updates, and update oh-my-zsh, installed Ruby gems, Homebrew, and their installed packages
alias update='sudo softwareupdate -ia; brew update; brew upgrade; brew upgrade --cask; brew cleanup; gem update --system; omz update'
