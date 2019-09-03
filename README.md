# :books: Install Blynk Server on Raspberry Pi :rocket:

## Quick Install

1) Clone and run this repo

```shell
git clone https://github.com/librarysteve/installblynkpi.git
```
```shell
cd ./installblynkpi
sudo chmod +x ./install.sh
sudo ./install.sh
```
## Manual Install 
1) Update, upgrade, and install openjdk 8
```shell
sudo apt-get update && sudo apt-get -y upgrade
```
```shell
sudo apt-get insta;; -y openjdk-8-jdk
```
2) Download a copy of the latest blynk server from [The Blynk Server Repo](https://github.com/blynkkk/blynk-server/releases)
or via wget
```shell
wget https://github.com/blynkkk/blynk-server/releases/download/v0.41.10/server-0.41.10-java8.jar
```
3) Create a folder for everything Blynk Server related
```shell
mkdir blynk_server
```
4) Make a folder for server data
```shell
mkdir ./blynk_server/server_data
```
5) Create a shell script to start the server
something like:
```shell
#!/bin/bash
$(java -jar /home/pi/blynk_server/server-0.41.10-java8.jar -dataFolder /home/pi/blynk_server/data_folder)
```
6) Create a service "Unit File" so the server will start on boot using systemd 
```shell
sudo nano /etc/systemd/system/blynk.service
```
__Example Unit File:__
```
[Unit]
Description=Blynk IoT Server
After=network.target

[Service]
ExecStart=/home/pi/blynk_server/start_blynk_server.sh
WorkingDirectory=/home/pi/blynk_server
StandardOutput=inherit
StandardError=inherit
Restart=Always
User=pi

[Install]
WantedBy=multi-user.target
```
7) Enable the service with systemctl
First start the service
```shell
sudo systemctl start blynk.service
```
Then enable
```shell
sudo systemctl enable blynk.service
```
Then check to see if it is running
```shell
sudo systemctl status blynk
```
*if you see an "actiuve" message (usually in green) you're good to go*

### To access the admin pannel

1) Browse to https://<RPi IP ADDRESS>:9443

2) Login with default credentials
  User/Email:admin@blynk.cc
  Password:admin
__NOTE: Unless you have an email server running, there will be no email sent. That means no password reset__ 
