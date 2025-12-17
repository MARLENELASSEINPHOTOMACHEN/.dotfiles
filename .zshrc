# Completion with 24-hour cache (avoids recompiling every startup)
autoload -Uz compinit
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

# Shell behavior improvements
setopt AUTO_CD              # Type directory name to cd into it
setopt HIST_IGNORE_DUPS     # Don't save duplicate commands in history
setopt INTERACTIVE_COMMENTS # Allow # comments in interactive shell (for pasting)
setopt RM_STAR_WAIT         # 10-second wait before rm * (panic protection)

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

# NVM - lazy-loaded to avoid ~300ms startup penalty
# Loads automatically on first use of nvm/node/npm/npx
export NVM_DIR="$HOME/.nvm"

nvm() {
  unset -f nvm node npm npx
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
  nvm "$@"
}
node() { nvm; node "$@"; }
npm() { nvm; npm "$@"; }
npx() { nvm; npx "$@"; }

#MARLENE:
alias :q='exit'


# bun completions
[ -s "/Users/marian/.bun/_bun" ] && source "/Users/marian/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# claude local
export PATH="$HOME/.local/bin:$PATH"
