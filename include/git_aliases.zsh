# vim: set filetype=bash

alias gs='git status'
alias gpo='git pull origin'
alias gPo='git push origin'
alias gcos='git checkout staging'
alias gpos='git pull origin staging'
alias gcom='git checkout master'
alias gpom='git pull origin master'
alias gbdm='git branch --merged | egrep -v "(^\*|master|staging)" | xargs git branch -d && gbp'
alias gbp='git fetch origin --prune'
alias gd='clear && git diff'
alias gbn='git branch -M'
alias gcm='git commit -m'
alias gms='git merge staging'
alias gmm='git merge master'

alias gl=" git log --pretty=format:'%C(yellow)%h%C(reset) - %an [%C(green)%ar%C(reset)] %s'"
alias glm=" git log --author='$(git config user.name)' --pretty=format:'%C(yellow)%h%C(reset) [%C(green)%ar%C(reset)] %s'"

alias overview='open "https://github.com/strikemike2k?tab=overview&from='$(date '+%Y-%m-%d')'"'
