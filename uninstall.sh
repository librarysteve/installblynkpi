#!/bin/bash

user=$(whoami)

if [[ $user == 'root' ]]; then
    clear
    echo "What would you like to remove?:"
    sleep 0.5
    echo "   1 - Everything (remove all files and remove the autostart)"
    echo "   2 - Reset the server data"
    echo "       (forgot a password or just want to start from a clean install)"
    echo "   3 - Remove the autostart only"
    read -p "[1,2,3]:" ans
    if [[ $ans == '1' ]]; then
        systemctl stop blynk.service
        systemctl disable blynk.service
        rm /etc/systemd/system/blynk.service
        rm -rf /home/pi/blynk_server/
    elif [[ $ans == '2' ]]; then
        systemctl stop blynk.service
        rm -rf /home/pi/blynk_server/data_folder
        mkdir /home/pi/blynk_server/data_folder
        systemctl start blynk.service
    elif [[ $ans == '3' ]]; then
        systemctl stop blynk.service
        systemctl disable blynk.service
        rm /etc/systemd/system/blynk.service
    else
        echo "please select an answer from the menu"
        echo "exiting"
    fi
else
echo "Are you root? Try:"
echo "sudo ./uninstall.sh"
fi
