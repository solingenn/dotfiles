# ~/.zshrc: executed by zsh for interactive shells. Mirrors ~/.bashrc; prompt is starship.

# History: shared live between shells/tmux panes (like the bash history -a/-c/-r setup)
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY HIST_IGNORE_ALL_DUPS HIST_IGNORE_SPACE HIST_REDUCE_BLANKS

setopt INTERACTIVE_COMMENTS
# typing a directory name cd's into it (e.g. `..`)
setopt AUTO_CD
bindkey -e

# changes cursor to I-beam
print -n '\e[5 q'

# make less more friendly for non-text input files, see lesspipe(1)
[[ -x /usr/bin/lesspipe ]] && eval "$(SHELL=/bin/sh lesspipe)"

# enable color support of ls and also add handy aliases
if [[ -x /usr/bin/dircolors ]]; then
    [[ -r ~/.dircolors ]] && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Completion: arrow-key menu, case-insensitive, ls colors
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -l'

# alias to open files in terminal with xdg-open
alias open='xdg-open'

############################################
# Claude Code auto-compact threshold
# (same as ~/.bashrc)
############################################
export CLAUDE_CODE_AUTO_COMPACT_WINDOW=1000000
export CLAUDE_AUTOCOMPACT_PCT_OVERRIDE=70

# Vim configuration
export VISUAL=vim
export EDITOR="$VISUAL"
export PATH="$HOME/.local/bin:$PATH"

. "$HOME/.local/bin/env"

# Starship prompt (config: ~/.config/starship.toml). Loaded before the bell hook so its
# precmd sees the command's real exit status first.
command -v starship >/dev/null && eval "$(starship init zsh)"

# Ring the bell when a command ran 30s or longer (BELL_AFTER overrides); tmux shows it as a red ! on the window
autoload -Uz add-zsh-hook
_bell_preexec() { _bell_cmd_start=$SECONDS }
_bell_after_long_cmd() {
    if [[ -n $_bell_cmd_start ]] && (( SECONDS - _bell_cmd_start >= ${BELL_AFTER:-30} )); then
        print -n '\a'
    fi
    unset _bell_cmd_start
}
add-zsh-hook preexec _bell_preexec
add-zsh-hook precmd _bell_after_long_cmd

# Plugin from apt (zsh-autosuggestions). zsh-syntax-highlighting is installed but not loaded.
[[ -r /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]] &&
    . /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
