############### CONFIG ###############

export ZSH_CACHE_FOLDER="$HOME/.cache/zsh"

HISTFILE=$ZSH_CACHE_FOLDER/.zsh_history
SAVEHIST=1000

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR="vim"
else
  export EDITOR="nvim"
fi

# Silently ignore all insecure files and directories
autoload -Uz compinit
if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]; then
  compinit
else
  compinit -C
fi
# compinit -i

# NVM
export NVM_LAZY=1
# export NVM_DIR="$HOME/.nvm"
# [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
# [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# rbenv source
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"
rbenv() {
  eval "$(command rbenv init -)"
  rbenv "$@"
}
# if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# GPG
export GPG_TTY=$(tty)

# VIM FZF
export FZF_DEFAULT_COMMAND="fd --type f"

# Heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/tommaso/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

# iTerm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
