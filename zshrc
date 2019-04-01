export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export ZSH=$HOME/.oh-my-zsh

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
# ZSH_THEME="awesomepanda"
ZSH_THEME="agnoster"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


########################################################3
# User configuration

prompt_context(){}

alias ll='ls -la'
alias vim='nvim'
alias dd='cd $HOME/Library/Developer/Xcode/DerivedData'

export EDITOR=nvim
export PATH="$HOME/.fastlane/bin:$PATH"

# GO
export GOPATH="${HOME}/.go:${HOME}/Develop/go_i18n"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"


########################################################3
# DAIMLER TSS
export http_proxy="localhost:3128"
export HTTP_PROXY="localhost:3128"
export https_proxy="localhost:3128"
export HTTPS_PROXY="localhost:3128"

# I18N
export DBHOST='localhost'
export DBPORT='5432'
export BASEURL='http://localhost:8081'

function proxyon() {
   export http_proxy="localhost:3128"
   export HTTP_PROXY="localhost:3128"
   export https_proxy="localhost:3128"
   export HTTPS_PROXY="localhost:3128"
   git config --global https.proxy https://localhost:3128
   git config --global http.proxy http://localhost:3128
   npm config --global set proxy http://localhost:3128
   npm config --global set https-proxy http://localhost:3128
   echo "PROXY is ON"
}

function proxyoff() {
   unset http_proxy
   unset https_proxy
   npm config --global rm proxy
   npm config --global rm https-proxy
   git config --global --unset http.proxy
   git config --global --unset https.proxy
   echo "PROXY is OFF"
}

