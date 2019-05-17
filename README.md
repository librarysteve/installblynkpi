# Pifighter Installer :rocket:

### Some scripts and config files to make automating the Pifighter project easy. 
#### _This repo is intended for use with the lateset stable Raspbian Lite image_
#### Required Software:
( _These can all be installed with the install.sh script_ )
* Blynk Server - https://github.com/blynkkk/blynk-server
* Blynk Python Module (blinklib)
* RaspAP - https://github.com/billz/raspap-webgui
* Git
* Python3 & pip3
* Java8 (oracle-java8-jdk)
* Adafruit Circuitpython Modules for SBC's - https://github.com/adafruit/Adafruit_Blinka

#### Manual Install

##### Install apt packages
```bash
sudo apt-get update && sudo apt-get upgrade -y  ## Updates, gotta do them

apt install git oracle-java8-jdk python-pip python3-pip -y
```

##### Install Python3 Packages 
