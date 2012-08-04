export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

alias be="bundle exec"
alias ll='ls -lah'

# up down substring reverse search
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search
