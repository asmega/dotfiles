export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# mac terminal tabs open in same working directory
precmd () {print -Pn "\e]2; %~/ \a"}
preexec () {print -Pn "\e]2; %~/ \a"}

# the thing you see at the start of every line
PROMPT="%n@%m:%~ > "

export EDITOR=vim # set editor to vim
set -o vi # set vi ri be editor wwith ESC-v

setopt extended_glob # allow globbing
setopt autocd # no need for cd command this is implied

alias be="bundle exec"
alias ll='ls -lah'
alias ack-grep='ack'

# ls output is color coded
export CLICOLOR=1

# up down substring reverse search
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search
