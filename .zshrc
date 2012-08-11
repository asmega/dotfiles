export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

export EDITOR=vim # set editor to vim

set -o vi # set vi ri be editor wwith ESC-v

alias be="bundle exec"
alias ll='ls -lah'

# ls output is color coded
export CLICOLOR=1

# up down substring reverse search
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search
