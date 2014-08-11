#
# Executes commands at the start of an interactive session. [Prezto]
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export SCALA_HOME=/usr/local/opt/scala/idea
export ANDROID_HOME=/usr/local/opt/android-sdk

export EDITOR=vim

export GOPATH=$HOME/go

export DOCKER_HOST=tcp://192.168.59.103:2375

export PATH=$PATH:$GOPATH/bin

eval "$(direnv hook $0)"

# Git aliases

alias gst='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias gogo='git checkout '
alias gk='gitk --all&'
alias gx='gitx --all'

alias got='git '
alias get='git '

# Other aliases (project based)

alias gomlv='cd ~/go/src/github.com/abronan/mileva'
alias gostock='cd ~/go/src/github.com/abronan/stock'
