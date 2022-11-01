############### FUNCTIONS ###############

source /Users/tommaso/.config/broot/launcher/bash/br

function tre() {
	tree -aC -I ".git|node_modules|bower_components" --dirsfirst "$@" | less -FRNX;
}
