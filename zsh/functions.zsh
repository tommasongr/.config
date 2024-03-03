############### FUNCTIONS ###############

source /Users/tommaso/.config/broot/launcher/bash/br

function tre() {
	tree -aC -I ".git|node_modules|bower_components" --dirsfirst "$@" | less -FRNX;
}

listenfor() {
  if [ "$1" != "" ]
  then
    lsof -wni tcp:"$1"
  else
    echo "need to enter a port number (i.e. 3000)"
  fi
}

killpid() {
  if [ "$1" != "" ]
  then
    kill -9 "$1"
  else
    echo "need to enter PID number"
  fi
}
