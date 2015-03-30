# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export SCALA_HOME=/usr/local/opt/scala/idea
export ANDROID_HOME=/usr/local/opt/android-sdk

export EDITOR=vim

# Golang
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
launchctl setenv GOROOT /usr/local/opt/go/libexec
launchctl setenv GOPATH /Users/abronan/go

# Docker related stuff
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/abronan/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

export PATH=$PATH:$GOPATH/bin

eval "$(direnv hook $0)"

# Google Cloud SDK
# The next line updates PATH for the Google Cloud SDK.
source '/usr/local/opt/google-cloud-sdk/path.zsh.inc'

# The next line enables bash completion for gcloud.
source '/usr/local/opt/google-cloud-sdk/completion.zsh.inc'

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

source ~/.zshresources/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zshresources/zsh-history-substring-search/zsh-history-substring-search.zsh

# bind UP and DOWN arrow keys
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Z
. `brew --prefix`/etc/profile.d/z.sh
