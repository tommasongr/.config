############### PLUGINS CONFIG ###############

# Plugin Config - ZSH_AUTOSUGGESTIONS

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=195"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_USE_ASYNC=false

# Plugin Config - ZSH_SYNTAX_HIGHLIGHTING
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

ZSH_HIGHLIGHT_STYLES[default]=none
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=196
ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=196,standout
ZSH_HIGHLIGHT_STYLES[alias]=fg=014,underline
ZSH_HIGHLIGHT_STYLES[builtin]=fg=014
ZSH_HIGHLIGHT_STYLES[function]=fg=202,bold
ZSH_HIGHLIGHT_STYLES[command]=fg=046
ZSH_HIGHLIGHT_STYLES[precommand]=fg=046,bold
ZSH_HIGHLIGHT_STYLES[commandseparator]=fg=197
ZSH_HIGHLIGHT_STYLES[hashed-command]=fg=009
ZSH_HIGHLIGHT_STYLES[path]=fg=011,underline
ZSH_HIGHLIGHT_STYLES[globbing]=fg=063
ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=white,underline
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=none
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=none
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=013
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=013
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=009
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=009
ZSH_HIGHLIGHT_STYLES[assign]=none

# Plugin Config - ENHANCD

ENHANCD_FILTER=fzy
export ENHANCD_FILTER
