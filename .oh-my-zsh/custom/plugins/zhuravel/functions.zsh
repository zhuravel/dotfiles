# Open a man page in Preview
function pman() {
  man -t $1 | open -f -a preview
}

# Create a new directory and enter it
function mkd() {
  mkdir -p "$@" && cd "$@"
}

# Change working directory to the top-most Finder window location
function cdf() { # short for `cdfinder`
  cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')"
}

# Determine size of a file or total size of a directory
function fs() {
  if du -b /dev/null > /dev/null 2>&1; then
    local arg=-sbh
  else
    local arg=-sh
  fi
  [[ -n "$@" ]] && du $arg -- "$@" || du $arg .[^.]* *;
}

# `ls` with numeric chmod
function lsnum() {
  ls -l | awk '{k=0;for(i=0;i<=8;i++)k+=((substr($1,i+2,1)~/[rwx]/) *2^(8-i));if(k)printf("%0o ",k);print}'
}

# Convert unixtime to human-readable
function humantime() {
  perl -le 'print scalar gmtime shift' $1
}

function timestamped() {
  if [ ! -z $1 ]; then
    local format="%Y%m%d%H%M%S_$1.rb"
  else
    local format="%Y%m%d%H%M%S"
  fi
  ruby -e "puts Time.now.strftime('$format')"
}

# Calculator for floating point and powers
# math '((2+1)/7)^3.5' => 0.0515325
function math() {
  awk "BEGIN{ print $* }"
}

# Query Wikipedia via console over DNS
function wiki() {
  dig +short txt "$*".wp.dg.cx
}

# Expand shortened URL
function longurl() {
  curl -sIL $1 2>&1 | awk '/^Location/ {print $2}' | tail -n1
}

# Create a git.io short URL
function gitio() {
  if [ $# -eq 2 ]; then
    curl -i http://git.io/ -F "url=${1}" -F "code=${2}"
  elif [ ! -z $1 ]; then
    curl -i http://git.io/ -F "url=${1}"
  else
    echo 'Usage: gitio http://github.com/link [custom-name]'
    return 1
  fi
}

# Create an l.md short URL
function lmd() {
  if [ $# -eq 2 ]; then
    curl http://l.md/api/post -F "url=${1}" -F "custom=${2}" | json
  elif [ ! -z $1 ]; then
    curl http://l.md/api/post -F "url=${1}" | json
  else
    echo 'Usage: lmd http://example.com/link [custom-name]'
    return 1
  fi
}

# Start an HTTP server from a directory, optionally specifying the port
function server() {
  local port="${1:-8000}"
  sleep 1 && open "http://localhost:${port}/" &
  # Set the default Content-Type to `text/plain` instead of `application/octet-stream`
  # And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
  python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port"
}

# Start a simple SMTP server
function smtp-server() {
  local port="${1:-1025}"
  python -m smtpd -n -c DebuggingServer localhost:${port}
}

# Format JSON strings or files
# Usage: `json '{"foo":42}'` or `echo '{"foo":42}' | json`
function json() {
  [[ -t 0 ]] && python -mjson.tool <<< "$*" || python -mjson.tool
}

# All the dig info
function digga() {
  dig +nocmd "$1" any +multiline +noall +answer
}

# Who is listening on a given TCP port?
function onport() {
  if [ $# -eq 2 ]; then
    lsof -i TCP:$1 -t
  elif [ ! -z $1 ]; then
    lsof -i TCP:$1 | grep LISTEN
  else
    echo 'Usage: onport $PORT [--pid]'
    return 1
  fi
}

# Helps me figure out what I can delete to free some space on SSD
function find-large-files() {
  if [ ! -z $1 ]; then
    sudo find $1 -type f -size +${2:-100M} -exec du -h {} \; 2> /dev/null
  else
    echo 'Usage: find-large-files /path 100M'
    return 1
  fi
}

# Quit an OS X application
function quit() {
  for app in $*; do
    osascript -e 'quit app "'$app'"'
  done
}

# Relaunch an OS X application
function relaunch() {
  for app in $*; do
    osascript -e 'quit app "'$app'"';
    sleep 2;
    open -a $app
  done
}

# Uninstall an app with AppZapper
function zap() {
  open -a AppZapper /Applications/$1.app
}

# This seemed to be the most effective way to get someone to stop using my laptop
function overheat() {
  echo 'The system is overheating and needs to go to sleep now.' | \
  growlnotify -a 'Activity Monitor' 'OVERHEATED'; \
  sleep 1; \
  say 'Overheated system.'
}

function pull_db_backup() {
  cd ~/Downloads
  LAST_DB_BACKUP=$(ssh worker1.curebit.com "ls /media/db-backup/" | tail -1)
  SCP_FROM="worker1.curebit.com:/media/db-backup/$LAST_DB_BACKUP/production_dump.sql.gz"
  SCP_TO="$PWD/production_dump.sql.gz"
  echo "Source: $SCP_FROM"
  echo "Downloading to: $SCP_TO"
  scp $SCP_FROM $SCP_TO
}
