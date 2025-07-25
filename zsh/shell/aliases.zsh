############### ALIASES ###############

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Brew update
alias brewup="brew update; brew outdated; brew upgrade; brew cleanup"

# Reload the shell
alias reload="source ~/.zshrc"

# System
alias ls="eza --color=always --icons=always --long --git --no-user --no-permissions"
alias la="ls -a"
alias tree="eza --tree --level=3"
alias c="clear"
alias ..="cd .."
alias config="cd ~/.config; nvim"

# Ghostty
alias settings="cd ~/.config/ghostty; nvim ./config"

# Zellij
alias z="zellij"

# Neovim
alias n="nvim"
alias vim="nvim"
alias ncleanup="rm -rf ~/.local/state/nvim/swap/"

# Lazy Git
alias lg="lazygit"

# Lazy Docker
alias lr="lazydocker"

# Lazy SQL
alias lq="lazysql"

# OMM (Tasks manager)
alias tasks="omm"

# Hours
alias hours="hours -d ~/Cellar/Personal/hours.db -t catppuccin-mocha"
