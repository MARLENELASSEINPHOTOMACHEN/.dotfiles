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
export PATH=$HOME/.elixir-install/installs/otp/27.1.2/erts-15.1.2/bin:$PATH
export PATH=$HOME/.elixir-install/installs/elixir/1.17.3-otp-27/bin:$PATH

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
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#MARLENE:
alias :q='exit'


# bun completions
[ -s "/Users/marian/.bun/_bun" ] && source "/Users/marian/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# claude local
alias claude="/Users/marian/.claude/local/claude"
