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

# Tmux session manager
# alias dev="tmux new-session -A -s"

function dev() {
  local project=$(basename $PWD)
  echo $project

  if ! tmux has-session -t $project
  then
    tmux new-session -s $project -n Code -d

    # Create other windows
    tmux new-window -t $project:2 -n Terminal
    tmux new-window -t $project:3 -n Git
    tmux new-window -t $project:4 -n Tests

    # Open Neovim
    tmux send-keys -t $project:1.1 "nvim" C-m

    # Create secondary terminal
    tmux split-window -t $project:2 -h

    # Open lazygit
    tmux send-keys -t $project:3.1 "lazygit" C-m

    # Select Code window
    tmux select-window -t $project:1.1
  fi

  tmux attach -t $project
}
