# vim: set filetype=bash

# get list of most used commands from history
function comm_cmds() {
  history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n10
}

# open git directory on github
function gh() {
  URL=$(cat .git/config | grep github | sed -E "s/^.*(github\.com):(.*)(\.git)?/http:\/\/\1\/\2/")
  open $URL
}
function lpr() {
  #USER=$1
  #: ${USER:="BCIMedia"}
  #open "https://github.com/prenda-school/prendaworldpulls?utf8=%E2%9C%93&q=is%3Aopen+is%3Apr+user%3A"$USER
  open "https://github.com/prenda-school/prendaworld/pulls?q=is%3Apr+is%3Aopen+draft%3Afalse+-label%3AWIP"
}
function pr(){
  DIR=$(git rev-parse --show-toplevel)
  BRANCH=$(__git_ps1 | tr -d "()" | tr -d "[:space:]")
  if [ -f $DIR/.git/config ]; then
    CONFIG="$DIR/.git/config"
  else
    CONFIG=$(cat .git | sed -e 's/\(gitdir: \)//g')
    CONFIG+='/config'
  fi
  SERVICE_URL=$(cat $CONFIG | grep url\ = -m 1)
  if [[ "${SERVICE_URL}" == *"bitbucket"* ]]; then
    USER=$(cat $CONFIG | grep bitbucket -m 1 | sed -E "s/^.*(bitbucket\.org)\/(.*)\/(.*)\.git?/\2/")
    REPO=$(cat $CONFIG | grep bitbucket -m 1 | sed -E "s/^.*(bitbucket\.org)\/(.*)\/(.*)\.git?/\3/")
    open "https://bitbucket.org/$USER/$REPO/pull-requests/new?source=$USER/$REPO%3A%3A$BRANCH&event_source=branch_list"
  else
    USER=$(cat $CONFIG | grep github -m 1 | sed -E "s/^.*(github\.com)[:\/](.*)\/(.*)\.git?/\2/")
    REPO=$(cat $CONFIG | grep github -m 1 | sed -E "s/^.*(github\.com)[:\/](.*)\/(.*)\.git?/\3/")
    open "https://github.com/$USER/$REPO/compare/$BRANCH?expand=1"
  fi
}

# cat between line numbers
# catb text.txt 5 10
function catb() {
  cat $1 | awk "{if (NR>=$2 && NR<=$3) print}"
}

# hosts sync
# function hostsP() {
#   build_hosts
#   cur_version=$(sed -n '1p' ~/hosts.base | egrep -o '[0-9]+\.[0-9]+')
#   cloud_version=$(aws s3 cp s3://ballantine-dev/hosts.base - | sed -n '1p' | egrep -o '[0-9]+\.[0-9]+')
#   if (( $(echo "$cur_version > $cloud_version" | bc -l))) || [[ $@ == "--force" ]]; then
#     echo "Uploading:" $cur_version
#     aws s3 cp ~/hosts.base s3://ballantine-dev/hosts.base --sse
#   else
#     if (( $(echo "$cur_version == $cloud_version" | bc -l))); then
#       echo "The cloud already has your version."
#     else
#       echo "You are behind the times."
#     fi
#     echo "Local:" $cur_version
#     echo "Cloud:" $cloud_version
#   fi
# }
# function hosts() {
#   cur_version=$(sed -n '1p' ~/hosts.base | egrep -o '[0-9]+\.[0-9]+')
#   cloud_version=$(aws s3 cp s3://ballantine-dev/hosts.base - | sed -n '1p' | egrep -o '[0-9]+\.[0-9]+')
#   if [[ $@ == "--version" ]] || [[ $@ == "-v" ]]; then
#     if (( $(echo "$cur_version < $cloud_version" | bc -l))); then
#       echo "You are behind the times."
#     else
#       if (( $(echo "$cur_version == $cloud_version" | bc -l))); then
#         echo "You are up to date."
#       else
#         echo "You have a newer version."
#       fi
#     fi
#     echo "Local:" $cur_version
#     echo "Cloud:" $cloud_version
#   else
#     if (( $(echo "$cur_version < $cloud_version" | bc -l))) || [[ $@ == "--force" ]]; then
#       echo "Downloading:" $cloud_version
#       aws s3 cp s3://ballantine-dev/hosts.base ~/hosts.base
#       build_hosts
#     else
#       if (( $(echo "$cur_version == $cloud_version" | bc -l))); then
#         echo "You are up to date."
#       else
#         echo "You have a newer version."
#       fi
#       echo "Local:" $cur_version
#       echo "Cloud:" $cloud_version
#     fi
#   fi
# }
# function build_hosts() {
#   sudo sh -c "cat ~/hosts.base ~/hosts.personal > /etc/hosts"
# }

# database sync
# function databaseP() {
#   RESULT=`mysql --user=root --skip-column-names -e "SHOW DATABASES LIKE '$1'"`
#   if [ "$RESULT" == $1 ]; then
#     mysqldump --user=root --databases $1 | gzip > ~/$1.sql.gz
#     aws s3 cp ~/$1.sql.gz s3://ballantine-dev/databases/$1.sql.gz
#     rm ~/$1.sql.gz
#   else
#     echo "Database does not exist"
#   fi
# }
# function database() {
#   aws s3 cp s3://ballantine-dev/databases/$1.sql.gz ~/$1.sql.gz
#   gunzip < ~/$1.sql.gz | mysql --user=root $1
#   rm ~/$1.sql.gz
# }

function rsb() {
  IP=$(ifconfig | grep -Eo "inet (addr:)?([0-9]*\.){3}[0-9]*" | grep -Eo "([0-9]*\.){3}[0-9]*" | grep -v "127.0.0.1" | grep -m1 "")
  rails s -b $IP
}
function speedtest() {
  curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -
}

symlink() {
  cd ~
  rm $1
  ln -sv dot_files/$1 $1
}

tab-color() {
   echo -ne "\033]6;1;bg;red;brightness;$1\a"
   echo -ne "\033]6;1;bg;green;brightness;$2\a"
   echo -ne "\033]6;1;bg;blue;brightness;$3\a"
}
tab-reset() {
  echo -ne "\033]6;1;bg;*;default\a"
}
color-ssh() {
   if [[ -n "$ITERM_SESSION_ID" ]]; then
     if [[ "$*" == *"dev"* ]] || [[ "$*" == *"35.162.254.200"* ]] || [[ "$*" == *"34.209.33.85"* ]]; then
       tab-color  0 128 255 # BLUE
     elif [[ "$*" == *"db"* ]]; then
       tab-color 255 51 255 #HOT PINK
     elif [[ "$*" == *"hub"* ]] || [[ "$*" == *"pj"* ]]; then
       tab-color 255 51 51 # RED
     else
       tab-color  0 255 0 # GREEN
     fi
     ssh $*
   fi
}
alias ssh=color-ssh
alias noc="tab-reset"
brb() {
  open 'https://cdn.dribbble.com/users/410036/screenshots/4689478/brb-dribbble2.gif'
}

