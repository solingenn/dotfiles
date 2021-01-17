# Set up the prompt
zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' matcher-list ''
zstyle ':completion:*' max-errors 5 numeric
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' original false
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' verbose true

# Use modern completion system
autoload -Uz compinit
compinit

# Keep 2000 lines of history within the shell and save it to ~/.zsh_history:
HISTFILE=~/.histfile
HISTSIZE=2000
SAVEHIST=2000
HISTFILE=~/.zsh_history

# Use vim keybindings and vim as default editor
bindkey -v
export VISUAL="/usr/bin/vim"
export EDITOR="$VISUAL"

# zsh configuration
source  ~/.powerlevel9k/powerlevel9k.zsh-theme

# Left prompt elements
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir dir_writable vcs)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="╭"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="╰❱❱ "

# Right prompt elements
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator)
POWERLEVEL9K_BACKGROUND_JOBS_VERBOSE=true

# Prompt elements visual settings
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='red'
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND=''
POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND='red'
POWERLEVEL9K_CONTEXT_SUDO_FOREGROUND='red' 
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='black'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='red'
POWERLEVEL9K_ROOT_INDICATOR_BACKGROUND='grey'

# Aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -l'

alias dev='./dev'
alias dev-vpn='sudo openvpn --config Foreo.ovpn --verb 8'
alias dev-acc='sudo vim ~/Documents/Accounts.txt'

# Docker configuration (OS project)
export OS_XDEBUG_HOST=$(ip route get 1 | awk '{print $3;exit}')
export OS_APP_PORT=80
export OS_DOCKER_MOUNT=./:/var/www
export SCANING_PORT=8081
export DOCKER_ALL_XDEBUG=$(ip route get 1 | awk '{print $3;exit}')
export DOCKER_ALL_PORT=8082
