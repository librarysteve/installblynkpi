#!/bin/bash

user=$(whoami)
apt_needed="openjdk-8-jdk"

blynk_server="https://github.com/blynkkk/blynk-server/releases/download/v0.41.10/server-0.41.10-java8.jar"

installFunk() {
	echo "Updating and installing java package"
	apt-get update && apt-get upgrade && apt-get install $apt_needed
	wget "$blynk_server"
	cp /blynk/blynk.service /ets/systemd/system/blynk.service
	systemctl start blynk.service
	systemctl enable blynk.service
	

}

if [[ $user == 'root' ]]; then
	
	installFunk
else
	echo "Must have root access to install server."
	echo "Maybe try again with:   sudo ./install.sh "
fi




