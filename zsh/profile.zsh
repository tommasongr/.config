# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"
export HOMEBREW_EVAL_ALL=true

# mise (versions manager)
eval "$(mise activate zsh)"

# 1Password
export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock

# GPG
export GPG_TTY=$(tty)
