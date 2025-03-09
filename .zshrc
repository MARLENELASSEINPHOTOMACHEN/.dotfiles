#enable completion
autoload -Uz compinit && compinit

# Load Angular CLI autocompletion.
# source <(ng completion script)

#python map to python3
alias python=/usr/bin/python3
export PATH="$(brew --prefix)/opt/python@3/libexec/bin:$PATH"

#path to zig
export PATH=$PATH:~/zig/zig-macos-aarch64-0.13.0

#path to elixir
export PATH=$HOME//opt/homebrew/Cellar/erlang/27.1.2/lib/erlang/erts-15.1.2/bin:$PATH
export PATH=$HOME//opt/homebrew/bin:$PATH

#hot reload air for go
alias air='~/go/bin/air'

#dotiles git alias
alias config='/usr/bin/git --git-dir=/Users/marian/.dotfiles/ --work-tree=/Users/marian'

#lazygit alias for dotfiles
alias lc='lazygit --git-dir=$HOME/.dotfiles --work-tree=$HOME'

#alias for common folder:
alias cw='cd ~/Developer/work/cat/cat_web_new'

#nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

#MARLENE:
alias :q='exit'


# bun completions
[ -s "/Users/marian/.bun/_bun" ] && source "/Users/marian/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
