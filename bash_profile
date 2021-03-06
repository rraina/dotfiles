
#BASH INFO: http://wiki.bash-hackers.org/syntax/
# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
# Adding GOLANG to path
PATH="$PATH:/usr/local/opt/go/libexec/bin"
PATH="/usr/local/opt/elasticsearch@2.4/bin:$PATH"
export PATH

export CLICOLOR=1

# Opendoor Config
# Load rbenv automatically
eval "$(rbenv init -)"



#Come in pairs (forgroundBackground)
# http://www.norbauer.com/rails-consulting/notes/ls-colors-and-terminal-app.html

#Coloring Position
#1. direcotry 2. symbolic link 3. socket 4. pipe 5. exec 6. block device
#7. character device 8.exec with setuid set 9. exec with setguid set 
#10. dir writable by others, with sticky bit 11. dir writable by others, w/o sticky bit


export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
alias ls="ls -G"
#alias g++="g++-4.7"
shopt -s extglob
export HISTCONTROL=ignoredups

#------------------------ GitHub Controls-----------------------------
Black='\[\e[0;30m\]'
Gray='\[\e[1;30m\]'
gray='\[\e[0;37m\]'
Blue='\[\e[0;34m\]'
blue='\[\e[1;34m\]'
Green='\[\e[0;32m\]'
green='\[\e[1;32m\]'
Cyan='\[\e[0;36m\]'
cyan='\[\e[1;36m\]'
Red='\[\e[0;31m\]'
red='\[\e[1;31m\]'
Purple='\[\e[0;35m\]'
purple='\[\e[1;35m\]'
Brown='\[\e[0;33m\]'
Yellow='\[\e[1;33m\]'
White='\[\e[1;37m\]'
NC='\e[0m\]' # No Color

# Source the git bash completion file
if [ -e ~/.git-completion.bash ]; then
    source ~/.git-completion.bash
    export GIT_PS1_SHOWDIRTYSTATE=true
    export GIT_PS1_SHOWSTASHSTATE=true
    export GIT_PS1_SHOWUPSTREAM="auto"

    PS1="${White}["'$(getShortTime)'"]""${green}"'$(__git_ps1)'" ${cyan}"'$(getShortPWD 3)'"$red$ "

else
    PS1="${White}["'$(getShortTime)'"] ${cyan}"'$(getShortPWD 3)'"$red$ "
  
fi

export PS1

function getShortTime
{
  temp=$(date)
  temp=$(echo $temp | rev | cut -d ' ' -f 3 | rev)
  echo ${temp:(-8):5}
}
function getShortPWD
{
  echo $( echo ${PWD} | rev | cut -d / -f -$1 | rev )
}

function g
{

  if [ "$#" -gt "0" ]; then
    if [ "$1" == "od" ]; then
      cd ~/Documents/opendoor
    elif [ "$1" == "dt" ]; then
      cd ~/Desktop
    elif [ "$1" == "web" ]; then
        if [ "$2" == "load" ]; then
            brew services run postgresql
            brew services run redis
            brew services run elasticsearch@2.4
        elif [ "$2" == "start" ]; then
            ~/Documents/opendoor/web/bin/server --tabs
        else
            echo 'Invalid command provided'
        fi
    else
      echo 'Invalid command provided'  
    fi
  else
    echo 'No command provided'
  fi
  
  return 0

}

# Function that helps create temporary aliases
# using the PWD at the time function is called
# helpful for creating markers when navigating 
# file systems or new projects
function alias-create 
{
  
  if [ $# == 1 ]; then
    echo "Creating alias using '$1' for location '$PWD'"
    alias $1="cd $PWD"
  
  else
    echo 'Please provide alias name for PWD'
  fi

}

# Function that sets your computers Wifi card 
# MAC address to a new random HEX value.
# Note: Your MAC address will reset to the 
# default value upon restarting your mac
function spoof-mac-addr
{

  echo "Old MAC Address: $(ifconfig en1 | grep ether)"
  rand_mac=$(openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//')
  $(sudo ifconfig en1 ether $rand_mac)
  echo "New MAC Address: $(ifconfig en1 | grep ether)"

}


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
