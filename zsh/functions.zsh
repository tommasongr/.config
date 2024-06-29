############### FUNCTIONS ###############

function killPuma() {
  pkill -9 -f rb-fsevent|rails|spring|puma
}
