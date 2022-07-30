autoload -Uz compinit
compinit

if (which kubectl &> /dev/null)
then
  source <(kubectl completion zsh)
fi

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# sorts out mouse
defaults write -g com.apple.mouse.scaling 10

HISTSIZE=1000
SAVEHIST=1000
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
alias prunedocker='docker image prune -a --filter "until=72h"'

# ls output is color coded
export CLICOLOR=1

# up down substring reverse search
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

# stop homebrew tracking
export HOMEBREW_NO_ANALYTICS=1

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"
  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")
    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
