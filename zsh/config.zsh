############### CONFIG ###############

# Load custom binaries
path+=("$HOME/.config/zsh/bin")
export PATH

export ZSH_CACHE_FOLDER="$HOME/.cache/zsh"

HISTFILE=$ZSH_CACHE_FOLDER/.zsh_history
SAVEHIST=1000

# 1Password SSH_AUTH_SOCK
export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR="vim"
else
  export EDITOR="nvim"
  # export EDITOR="nova --wait"
fi

# Silently ignore all insecure files and directories
autoload -Uz compinit
if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]; then
  compinit
else
  compinit -C
fi
# compinit -i

# rbenv source
eval "$(rbenv init - zsh)"

# ruby-build
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@3)"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# GPG
export GPG_TTY=$(tty)

# VIM FZF
export FZF_DEFAULT_COMMAND="fd --type f"

export HOMEBREW_EVAL_ALL=true
