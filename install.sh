# ------------------------------
#       Geth installer
# ------------------------------
# Required actions:
# > need to confirm installation
# > install
# ------------------------------
#
# Functions :
#
function go-install {
  echo "----------Installing Go version 1.15----------"
  sudo apt-get update
  sudo apt-get -y upgrade
  sudo apt-get -y install make
  sudo apt-get -y install build-essential

  cd /tmp
  wget https://dl.google.com/go/go1.15.linux-amd64.tar.gz
  sudo tar -xvf go1.15.linux-amd64.tar.gz
  sudo mv go /usr/local

  echo "----------Setting Go environment variables----------"
  export GOROOT=/usr/local/go
  export GOPATH=$HOME/go
  export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
  source ~/.profile

  echo "----------Remove unused file----------"
  sudo rm -rf go1.15.linux-amd64.tar.gz
  sleep 1;
}

function geth-install {
  echo "----------Cloning go-ethereum git----------"
  git clone https://github.com/ethereum/go-ethereum.git
  cd go-ethereum/

  echo "----------Installing Geth command----------"
  make geth
  sleep 1;
  make all
  sleep 1;
  cd build/bin/
  ls -all

  echo "----------Copy Geth command file to local bin directory----------"
  cp geth /usr/local/bin/

  echo "----------Testing Geth command----------"
  geth version
  geth --help
}

#
# Body of the script ---------------------------------------------
#

echo -e "\n----------Verify Go installation----------"
output=$(go version)
if [ -z "$output" ]
then
  echo -e "Go is not installed!\n"
  echo -e "Checking for local installation."
  output=$(find /usr/local/go)
  if [ -z "$output" ]
  then
    echo "Local installation not found. Installing..."
    go-install
  fi
fi
echo -e "\nGo is installed."
echo -e "\n---------Verify Geth installation---------\n"

output2=$(geth version)
if [ -z "$output2" ]
then
  echo -e "Geth is not installed!\n"
  geth-install
else
  echo -e "Geth is already installed.\n"
fi
echo "------------------------------------------"
echo -e "\nGO: $output\n\n------------------------------------------\n$output2\n------------------------------------------"
#ver=$(echo "$output2" | awk 'FNR==2 {print $2}')
#var=${ver:0:4}


#
# Argument to make change if geth version is 1.10 up
#

#if echo "$var > 1.09" | bc -l | grep -q 1
#then
#  echo "Success."
#fi
