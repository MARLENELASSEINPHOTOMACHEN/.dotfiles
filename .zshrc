# from Stackoverflow
autoload -Uz compinit
compinit -i

# Load Angular CLI autocompletion.
source <(ng completion script)
alias python=/usr/bin/python3
export PATH="$(brew --prefix)/opt/python@3/libexec/bin:$PATH"
alias config='/usr/bin/git --git-dir=/Users/marian/.dotfiles/ --work-tree=/Users/marian'
