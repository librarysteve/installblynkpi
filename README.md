# :books: Pifighter Installer :rocket:

# TO DO:
- [x] Find a configuration for Crickit HAT to interface well with the iTelephone :iphone:.
- [ ] Clean up guide by creating a well ordered process
- [ ] Create a compressed and preinstalled SDcard image
- [ ] Clean up installer script and if possible make it a one-liner
- [ ] README Grammar and formatting
- [ ] Make it doable for other people?  :grimacing:

## Here's what I have so far:


### Some scripts and config files to make automating the Pifighter project easy. 
#### _This repo is intended for use with the lateset stable Raspbian Lite image_
#### Required Software:
( _These can all be installed with the install.sh script_ )
* Blynk Server - https://github.com/blynkkk/blynk-server
* RaspAP - https://github.com/billz/raspap-webgui
* Git
* Python3 & pip3
* Java8 (oracle-java8-jdk)

_python modiles are not included in the main install script at the moment_
_as the adafruit crickit module performs environment specific tasks_

##### Fast Method:
Update and upgrade your pi.
```bash
sudo apt-get update && sudo apt-get upgrade -y
```

##### Run the install script as sudo
```bash
sudo ./install.sh
```

##### The last package (_RaspAP_) requires a reboot, the pi should automatically reboot.

##### Activate the client mode in RaspAP from a wireless enabled device: 
(_RaspAP can run in client and AP at the same time without extra hardware, see the RaspAP Link [here](https://github.com/billz/raspap-webgui#simultaneous-ap-and-wifi-client)_) 

Alternatively you could use a dongle or connect viea eithernet. (Hardwired data transfer > Wireless)

##### Install Circuitpython, and RPI.GPIO (no sudo)
```bash
pip3 install adafruit-blinka RPI.GPIO
```
##### Enable i2c in raspi-config
```bash
sudo raspi-config
```
select "interfacing options," i2c, then slect yes 
if propted to reboot select NO, instead when we return to the command line, we will
shut the pi down completely for the hardware install. 

_You will need to have a *PROPER* batterypack connect to the Crickit for the next part_


##### With at LEAST the Crickit HAT connected to the Pi, install the Crickit module
```bash
pip3 instal adafruit-circuitpython-crickit
```
After the install is complete we can check if we did everything correct by using 
i2c-detect in order to view our active i2c addresses. (If you would like to reference the official guide
with examples for all of the Crickit's OI click [here)](https://learn.adafruit.com/adafruit-crickit-hat-for-raspberry-pi-linux-computers/python-installation)

In the pi terminal run
```bash
sudo i2c-detect -y
```
You'll see the number 42 if everything is ok. (and nothin is ever okay :neutral_face:)

##### You're finally ready to log in! 
* While connected to the pi's wifi AP, navigate to https://10.3.141.0:9443 in a web browser
* You'll probably be asked warned about an insecure site, we need to click 
(and that's okay... AS LONG AS YOU DONT EXPOSE IT TO THE INTERNET. Keep it behind the firewall kids.)
* 


#### Manual Install

##### Install apt packages
```bash
sudo apt-get update && sudo apt-get upgrade -y  ## Updates, gotta do them

apt install git oracle-java8-jdk python-pip python3-pip -y
```

##### Install Python3 Packages 
_This section uses the following projects:_
[Adafruit Circuitpython Modules for SBC's](https://github.com/adafruit/Adafruit_Blinka)

[Blynk Python Module](https://github.com/blynkkk/lib-python)

```bash
pip3 install blynklib adafruit-blinka RPI.GPIO 
## The adafruit-circuitpython-crickit module will detect what board you are using
## so wait until you have completed hardware setup to install
pip3 install adafruit-circuitpython-crickit
```
