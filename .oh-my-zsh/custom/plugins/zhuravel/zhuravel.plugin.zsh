p() { cd ~/Projects/$1; }
_p() { _files -W ~/Projects -/; }
compdef _c c

h() { cd ~/$1; }
_h() { _files -W ~/ -/; }
compdef _h h

# Autocorrect is more annoying than helpful
unsetopt correct_all

# Command line history
bindkey '^R' history-incremental-search-backward

# Add plugin's bin directory to path
export PATH="$(dirname $0)/bin:$PATH"

# Load the shell dotfiles
for file in "$(dirname $0)"/.{exports,aliases,functions}; do
  [ -r "$file" ] && source "$file"
done
unset file
