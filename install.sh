#!/bin/bash

user=$(whoami)
apt_needed="git python-pip python3-pip oracle-java8-jdk"

blynk_server="https://github.com/blynkkk/blynk-server/releases/download/v0.41.5/server-0.41.5-java8.jar"
raspAp_repo="https://git.io/voEUQ"


installFunk() {
	echo "Installing apt packages"
	apt install $apt_needed
	wget "$blynk_server"
	wget -q $raspAp_repo -O /tmp/raspap
	bash /tmp/raspap < autoprompt.txt
	

}

if [[ $user == 'root' ]]; then
	
	installFunk
else
	echo "dood yooooo nooooot rooooot?"
	echo "Maybe try again with:   sudo ./install.sh "
fi




