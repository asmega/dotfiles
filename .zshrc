[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="tonotdo"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias be="bundle exec"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(vi-mode rails3 github git-flow gem git ruby bundler rvm)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/var/lib/gems/1.9.1/bin:/home/asmega/.rvm/bin

# vi mode indicator. no idea how it works.
bindkey -v

function my-accept-line {
  POSTDISPLAY=""
  zle .accept-line
}

zle -N my-accept-line
bindkey "^M" my-accept-line
bindkey "^J" my-accept-line

setopt prompt_subst;
PS1=$'%{\e7\e[${COLUMNS}G \e[K-- INSERT --\e8\e[B\e[A%}'"$PS1"
PS2=$'%{\e7\e[${COLUMNS}G \e[K-- INSERT --\e8\e[B\e[A%}'"$PS2"
PS3=$'%{\e7\e[${COLUMNS}G \e[K-- INSERT --\e8\e[B\e[A%}'"$PS3"
PS4=$'%{\e7\e[${COLUMNS}G \e[K-- INSERT --\e8\e[B\e[A%}'"$PS4"

function zle-keymap-select {
  if [[ "$KEYMAP" == vicmd ]]; then
    POSTDISPLAY=$'\n'"-- NORMAL --"
  else
    POSTDISPLAY=$'\n'"-- INSERT --"
  fi
}

zle -N zle-keymap-select

# up down substring reverse search
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search
