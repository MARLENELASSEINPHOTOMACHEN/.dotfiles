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

# Zig compiler - version managed via symlink
# How it works: ~/zig/current is a symlink pointing to the actual version folder
# To switch versions: use-zig zig-macos-aarch64-0.14.0
# This way PATH never changes, only the symlink target does
export PATH="$HOME/zig/current:$PATH"
[[ -L "$HOME/zig/current" && ! -d "$HOME/zig/current" ]] && echo "Warning: ~/zig/current symlink broken - run: use-zig <version>"

use-zig() {
  ln -sfn ~/zig/"$1" ~/zig/current && echo "Now using zig: $1"
}

# Elixir/OTP - version managed via symlinks (same pattern as zig above)
# How it works: otp-current and elixir-current are symlinks to actual version folders
# To switch versions: use-otp 27.1.2/erts-15.1.2  |  use-elixir 1.17.3-otp-27
export PATH="$HOME/.elixir-install/otp-current/bin:$PATH"
export PATH="$HOME/.elixir-install/elixir-current/bin:$PATH"
[[ -L "$HOME/.elixir-install/otp-current" && ! -d "$HOME/.elixir-install/otp-current" ]] && echo "Warning: otp-current symlink broken - run: use-otp <version>"
[[ -L "$HOME/.elixir-install/elixir-current" && ! -d "$HOME/.elixir-install/elixir-current" ]] && echo "Warning: elixir-current symlink broken - run: use-elixir <version>"

use-otp() {
  ln -sfn ~/.elixir-install/installs/otp/"$1" ~/.elixir-install/otp-current && echo "Now using OTP: $1"
}

use-elixir() {
  ln -sfn ~/.elixir-install/installs/elixir/"$1" ~/.elixir-install/elixir-current && echo "Now using Elixir: $1"
}

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
