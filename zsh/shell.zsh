source ~/.config/zsh/shell/config.zsh

# Zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Oh my posh
eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/base.yml)"

# Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Snippets
# zinit snippet OMZP::git

# Load completions
ZSH_COMPDUMP="${ZSH_CACHE_FOLDER}/.zcompdump-${(%):-%m}-${ZSH_VERSION}"
autoload -U compinit && compinit

zinit cdreplay -q

# Keybindings
bindkey "^p" history-search-backward
bindkey "^n" history-search-forward

# History
HISTSIZE=5000
HISTFILE=$ZSH_CACHE_FOLDER/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ":completion:*" matcher-list "m:{a-z}={A-Za-z}"
zstyle ":completion:*" list-colors "${(s.:.)LS_COLORS}"
zstyle ":completion:*" menu no
zstyle ":fzf-tab:completion:cd:*" fzf-preview "ls --color $realpath"
zstyle ":fzf-tab:complete:__zoxide:*" fzf-preview "ls --color $realpath"

# Load further configuration files
source ~/.config/zsh/shell/aliases.zsh
source ~/.config/zsh/shell/integrations.zsh
source ~/.config/zsh/shell/functions.zsh
