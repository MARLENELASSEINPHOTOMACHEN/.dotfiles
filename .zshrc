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
setopt CORRECT              # Correct spelling mistakes - more annoying than helpful most of the time but saved my ass some time soo

# Default editor
export EDITOR="nvim"

# Zig compiler - version managed via symlink
# How it works: ~/zig/current is a symlink pointing to the actual version folder
# This way PATH never changes, only the symlink target does
# Setup:
#   1. Go to https://ziglang.org/download/ and download the macOS aarch64 tarball
#   2. Create ~/zig/ if it doesn't exist
#   3. Extract the tarball into ~/zig/ — you should end up with e.g. ~/zig/zig-macos-aarch64-0.14.0/
#   4. Run: use-zig zig-macos-aarch64-0.14.0
#   You can have multiple versions side by side, use-zig just flips the symlink
export PATH="$HOME/zig/current:$PATH"
[[ -L "$HOME/zig/current" && ! -d "$HOME/zig/current" ]] && echo "Warning: ~/zig/current symlink broken - run: use-zig <version>"

use-zig() {
  ln -sfn ~/zig/"$1" ~/zig/current && echo "Now using zig: $1"
}
_use-zig() {
  compadd $(ls ~/zig/ 2>/dev/null | grep -v '^current$')
}
compdef _use-zig use-zig

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

# Go binaries
export PATH="$HOME/go/bin:$PATH"

# Claude CLI
export PATH="$HOME/.local/bin:$PATH"

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# jj completions
source <(COMPLETE=zsh jj)

# # jj completions - cached to avoid running jj on every startup
# _jj_comp="$HOME/.cache/jj/completions.zsh"
# if [[ ! -f "$_jj_comp" || -n ${_jj_comp}(#qN.mh+24) ]]; then
#   mkdir -p "${_jj_comp:h}"
#   COMPLETE=zsh jj > "$_jj_comp" 2>/dev/null
# fi
# [[ -f "$_jj_comp" ]] && source "$_jj_comp"
# unset _jj_comp

# Dotfiles git alias
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Lazygit alias for dotfiles
alias lc='lazygit --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# NVM - lazy-loaded to avoid ~300ms startup penalty
# Default node is added to PATH directly so non-interactive tools (nvim LSP, etc.) can find it
# Full nvm loads on first use of the nvm command
export NVM_DIR="$HOME/.nvm"
_nvm_default=$(ls -d "$NVM_DIR/versions/node/v$(cat "$NVM_DIR/alias/default" 2>/dev/null)"* 2>/dev/null | tail -1)
[[ -n "$_nvm_default" ]] && PATH="$_nvm_default/bin:$PATH"
unset _nvm_default

nvm() {
  unset -f nvm
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
  nvm "$@"
}

# Vim muscle memory
alias :q='exit'
