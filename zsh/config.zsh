############### CONFIG ###############

if [ ! -d "$HOME/.cache/zsh" ]; then
    mkdir -p $HOME/.cache/zsh
fi

export ZSH_CACHE_FOLDER="$HOME/.cache/zsh"

# 1Password SSH_AUTH_SOCK
export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR="vim"
else
  export EDITOR="nvim"
  # export EDITOR="nova --wait"
fi

# mise
eval "$(mise activate zsh)"

# GPG
export GPG_TTY=$(tty)

# Homebrew
# eval "$(/opt/homebrew/bin/brew shellenv)"
# export HOMEBREW_EVAL_ALL=true
