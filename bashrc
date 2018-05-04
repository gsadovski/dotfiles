#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias pacman='pacman --color=auto'
alias grep='grep --color-auto'
alias vim='vim --servername VIM' # needed for Synctex to work (auto sync between source file and pdf output)

set -o vi #add vi shortcuts to bash

#Custom PS1      gsadovski@dell 
#		              L ~$
PS1='\[\e[38;5;33m\] \[\e[1m\]\u\[\e[38;5;136m\]@\h\n              \[\e[39m\]L \w\$\[\e[0m\] '
#PS1='[\u@\h \W]\$ '
export VISUAL=vim
export EDITOR="$VISUAL"
export BROWSER=qutebrowser 
export HISTCONTROL=ignoredups #do not record duplicated commands in the commands history

archey3

#This two lines are responsable to the automatic update of terminal title based on the running app
trap 'echo -ne "\033]2;$(history 1 | sed "s/^[ ]*[0-9]*[ ]*//g")\007"' DEBUG
export PS1="\033]2;st\007$PS1"
