# vim: set filetype=bash
alias osk='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --app=https://configure.ergodox-ez.com/moonlander/layouts/omqjl/latest/0'

# Basic
alias vi=vim
alias h="history|grep "
alias f="find . |grep "
alias p="ps aux |grep "
alias a="alias  |grep "
alias c="clear"
alias g='grep -rnw . -e'
alias {:q,:Q,:qa}="exit"
alias bs="bundle show |grep "
alias fing="sudo"
alias Kill="sudo kill -s SIGTERM "
alias fing-dots="find . -type f -name '._*' -exec rm {} +"
alias perms="sudo chown -R msmith:_www * && sudo chmod -R 775 *"
alias {archive,compress}="tar -czvf"

# Quick edit
alias oh='   sudo vim /etc/hosts'
alias ossh=' sudo vim ~/.ssh/config'
alias ovim=" vim ~/.vimrc"
alias {ozsh,obash}="vim ~/.zshrc"
alias ogit=" vim ~/.oh-my-zsh/plugins/git/git.plugin.zsh"
alias {sbash,zbash}="source ~/.zshrc; clear"
alias bog="  bundle open"
alias opry=" vim ~/.pryrc"
alias psd="open -a /Applications/Adobe\ Photoshop\ 2020/Adobe\ Photoshop\ 2020.app"

# Servers
alias ns="  npm start"
alias sql=" mysql.server start"
alias ssnr="sudo service nginx restart"
alias ssrn="sudo systemctl restart nginx"
alias sshr="sudo service httpd restart"
alias ssar="sudo service apache2 restart"

alias pws="METEOR_OFFLINE_CATALOG=1 meteor run --settings dev-settings.json  --no-release-check  --exclude-archs web.browser.legacy"

# Mac OS 120.12.6 (16G29)
alias clear_dns="sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder;"

# Movement
alias cdd="cd ~/dot_files"
alias pw="cd ~/code/prendaverse/prendaworld"
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'

# ls aliases
alias ll="ls --color=auto -lh"
alias la="ls --color=auto -lah"
alias ls="ls --color=auto -la"
alias llm="ls --color=auto -al | more"
