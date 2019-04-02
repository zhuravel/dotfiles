# Deployment
alias csd='cap bastion deploy'
alias cpd='cap production deploy'
alias cpdm='cap production deploy:migrations'

# Shortcuts
alias m='mate .'
alias s='subl .'
alias o='open'
alias oo='open .'
alias exa='exa -lhbgH --git'
alias rig='command rg' # ripgrep

# A very simple and useful stopwatch (return or ctrl-d to stop)
alias stopwatch='time ( read )'
# Simple calculator ( calc 2*2 => 4 )
alias calc='bc <<<'
# Easily search running processes
alias 'ps?'='ps ax | grep '

# See all processes, ordered by memory usage, with 2 secs refresh
alias topmem='top -s 2 -o mem'
# See all processes, ordered by CPU usage, with 2 secs refresh
alias topcpu='top -s 2 -o cpu'

# Databases
alias mycli='mycli -uroot'
alias mysql='mysql -uroot'
alias mysql-dir='cd /usr/local/var/mysql/'
alias processlist='watch -n 1 mysqladmin --user=root processlist'
alias redis-status='redis-cli ping'

alias prevent-sleep='pmset noidle' # also `caffeinate`
alias fix-camera='sudo killall VDCAssistant'
alias password='pwgen -s 32 1'
alias eye='sudo opensnoop'

alias gzip='gzip -9n' # Set strongest compression level as ‘default’ for gzip
alias ping='ping -c 5' # Ping 5 times ‘by default’
alias ql='qlmanage -p 2>/dev/null' # Preview a file using QuickLook

# IP addresses
alias ip='dig +short myip.opendns.com @resolver1.opendns.com'
alias localip='ipconfig getifaddr en0'
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
alias ips6="ifconfig -a | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //'"

# Flush Directory Service cache
alias flush='dscacheutil -flushcache && killall -HUP mDNSResponder'

# Clean up LaunchServices to remove duplicates in the “Open With” menu
alias lscleanup='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder'

# Get OS X Software Updates, and update oh-my-zsh, installed Ruby gems, Homebrew, and their installed packages
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cask upgrade; brew cleanup; gem update --system; upgrade_oh_my_zsh'

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias empty-trash='sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl'

# Destroy all Docker images and containers
alias docker-cleanup='docker rmi $(docker images -q); docker rmi $(docker images -q)'

# Show/hide hidden files in Finder
alias show='defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder'
alias hide='defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder'

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"

# Lock the screen
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Stuff I never really use but cannot delete either because of http://xkcd.com/530/
alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume 7'"
alias penis='sleep 600; for (( i=10;;i+=10 )); do osascript -e "set volume output volume $i"; say penis; sleep 10; done;'
alias hax="growlnotify -a 'Activity Monitor' 'System error' -m 'WTF R U DOIN'"
