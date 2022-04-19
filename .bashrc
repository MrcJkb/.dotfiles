#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
# Don't do anything if in nix-shell
if [[ -n $IN_NIX_SHELL ]]; then return; fi

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
# source "$HOME/.cargo/env"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
