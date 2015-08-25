# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Default editor
export EDITOR=vim
export TERM=xterm-termite

# Golang
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH/bin

# Store
export ETCD_PATH="/usr/share/etcd"
export ZK_PATH="/usr/share/zookeeper"
export CONFIG="~/.config"
export PATH=$PATH:$ZK_PATH/bin:$ETCD_PATH

# Docker Experimental/Development Binary
export DOCKER_REPOSITORY=$GOPATH/src/github.com/docker/docker
export DOCKER_DEV=$DOCKER_REPOSITORY/bundles/latest/binary
export DOCKER_EXPERIMENTAL=$HOME/devenv/docker-experimental

# Other
export FLB_PATH=$GOPATH/src/github.com/google/flatbuffers
export PATH=$PATH:$FLB_PATH

# Google Cloud SDK
export CLOUDSDK_PYTHON="/usr/bin/python2.7"

# The next line updates PATH for the Google Cloud SDK.
source '/home/abronan/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
source '/home/abronan/google-cloud-sdk/completion.zsh.inc'

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

# Docker aliases
alias ddevd="sudo nohup ${DOCKER_DEV}/docker daemon -s overlay"
alias ddev=$DOCKER_DEV/docker
alias dxpd="sudo nohup ${DOCKER_EXPERIMENTAL}/docker-latest daemon -s overlay --kv-store=consul:localhost:8500 &"
alias dxp=$DOCKER_EXPERIMENTAL/docker-latest
alias dps='docker ps -a'
alias cclean='docker rm -f $(docker ps -aq)'
alias iclean='docker rmi $(docker images -aq)'

# Zsh
source ~/.zshresources/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zshresources/zsh-history-substring-search/zsh-history-substring-search.zsh

# History UP and DOWN arrow keys
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Z
. /usr/local/etc/profile.d/z.sh

# SSH Agent
SSH_ENV=$HOME/.ssh/environment
 
# start the ssh-agent
function start_agent {
    echo "Initializing new SSH agent..."
    # spawn ssh-agent
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add
}
   
if [ -f "${SSH_ENV}" ]; then
     . "${SSH_ENV}" > /dev/null
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi
