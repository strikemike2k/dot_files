# vim: set filetype=bash
#
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
alias gbn='git pull origin && git checkout -b'
alias gcm='git commit -m'
