#!/bin/bash

user=$(whoami)

apt_needed="openjdk-8-jdk"

blynk_jar="https://github.com/blynkkk/blynk-server/releases/download/v0.41.10/server-0.41.10-java8.jar"

### Update and upgrade because you should :)
updateUpgrade() {
	echo "Updating and installing java package"
	apt-get update
	apt-get upgrade
}

### Install Openjdk 8
installJDK() {
	echo "Installing openjdk 8"
	apt-get install $apt_needed
	echo "Openjdk 8 Installed"
}

### Download JAR server file
getJARfile() {
	echo "Downloading server-0.41.10-java8.jar"
	wget "$blynk_jar"
	echo "Download Complete"
}

### Create Server Folders
makeFolders() {
	echo "Creating Server Folders"
	mkdir /home/user/pi/blynk_server
	echo "Server main folder created at ~/blynk_server"
	mkdir /home/user/pi/blynk_server/data_folder
	echo "Server data folder created at ~/blynk_server/data_folder"
}

### Install Blynk as a service on start
installService() {
	mv server-0.41.10-java8.jar /home/pi/blynk_server/server-0.41.10-java8.jar
	cp /blynk/blynk.service /ets/systemd/system/blynk.service
	systemctl start blynk.service
	systemctl enable blynk.service
}

if [[ $user == 'root' ]]; then
	updateUpgrade
	installJDK
	getJARfile
	makeFolders
	clear
	echo "Would you like to install blynk as a service on startup? (reccomended)"
	read -p "[y/n]:" ans
	if [[ $ans == 'y' ]]; then
		installService
		echo "All Done!"
		echo "reboot reccomended"
	else
		echo "The main componants are installed run:"
		echo "start_blynk_server.sh"
		echo "to start the server"
	fi
	
else
	echo "Must have root access to install server."
	echo "Maybe try again with:   sudo ./install.sh "
fi

