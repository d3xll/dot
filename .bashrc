#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

export http_proxy="http://127.0.0.1:2080"
export https_proxy="http://127.0.0.1:2080"
export all_proxy="socks5://127.0.0.1:2080"
export no_proxy="localhost,127.0.0.1,::1"
