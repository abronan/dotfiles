# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Default editor
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim
export TERM=screen-256color-bce

# Rust
export CARGO=/home/abronan/.cargo
export PATH=$PATH:$CARGO/bin
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
export PATH=$PATH:$RUST_SRC_PATH

# Export nightly channel flag for cargo fmt (rustfmt-nightly)
# See: https://github.com/rust-lang-nursery/rustfmt/issues/2188
export CFG_RELEASE_CHANNEL=nightly

# Project specific
export MANTISSA_BIN=/home/abronan/devenv/mantissa/target/debug
export PATH=$PATH:$MANTISSA_BIN
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:"/usr/local/lib"

# MPD daemon start
[ ! -s ~/.config/mpd/pid ] && mpd ~/.config/mpd/mpd.conf

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

# Special aliases
alias curl='noglob curl'

# Docker aliases
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
