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

# Quick edit
alias oh='   sudo vim ~/hosts.base && build_hosts'
alias ohp='  sudo vim ~/hosts.personal && build_hosts'
alias bh='   build_hosts'
alias ossh=' sudo vim ~/.ssh/config'
alias ovim=" vim ~/.vimrc"
alias {ozsh,obash}="vim ~/.zshrc"
alias ogit=" vim ~/.oh-my-zsh/plugins/git/git.plugin.zsh"
alias {sbash,zbash}="source ~/.zshrc; clear"
alias bog="  bundle open"
alias opry=" vim ~/.pryrc"
alias psd="open -a /Applications/Adobe\ Photoshop\ 2020/Adobe\ Photoshop\ 2020.app"

# Servers
alias sql=" mysql.server start"
alias ssnr="sudo service nginx restart"
alias ssrn="sudo systemctl restart nginx"
alias sshr="sudo service httpd restart"
alias ssar="sudo service apache2 restart"

# SSH to AWS
alias saws="ssh ec2-user@aws"
alias sd="  ssh ubuntu@dev"
alias sp="  ssh ubuntu@nsr"
alias jsp=" ssh ubuntu@journal"
alias spr=" ssh ubuntu@rails"

# SSH
alias smaxapi='ssh -t root@45.79.108.188'
alias smaxwp=' ssh -t root@198.58.126.101'

# Time
alias retime="sudo ntpdate time.nist.gov"
alias msttime="sudo rm /etc/localtime; sudo ln -s /usr/share/zoneinfo/America/Denver /etc/localtime"
alias fixtime="sudo timedatectl set-timezone America/Denver"

# Mac OS 120.12.6 (16G29)
alias clear_dns="sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder;"

# Movement
alias cdg="cd ~/git"
alias cdd="cd ~/dot_files"

# ls aliases
alias ll="ls -lh"
alias la="ls -lah"
alias ls="ls -la"
