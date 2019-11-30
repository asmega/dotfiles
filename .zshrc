autoload -Uz compinit
compinit
source <(kubectl completion zsh)

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# sorts out mouse
defaults write -g com.apple.mouse.scaling 10

HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history

# mac terminal tabs open in same working directory
precmd () {print -Pn "\e]2; %~/ \a"}
preexec () {print -Pn "\e]2; %~/ \a"}

# the thing you see at the start of every line
PROMPT="%n@%m:%~ > "

export EDITOR=vim # set editor to vim

setopt extended_glob # allow globbing
setopt autocd # no need for cd command this is implied

alias be="bundle exec"
alias ll='ls -lah'
alias ack-grep='ack'
alias rake='noglob rake' # zsh plays funny with rake tasks
alias g='git'
alias gti="git"
alias iphone="open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app"

# ls output is color coded
export CLICOLOR=1

# up down substring reverse search
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

# stop homebrew tracking
export HOMEBREW_NO_ANALYTICS=1
