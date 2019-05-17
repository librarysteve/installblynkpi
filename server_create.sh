#!/bin/bash


touch blynk.service
echo >> blynk.service "[Unit]"
echo &>> blynk.service "Description=Blynk IOT Server"
echo &>> blynk.service "After=network.target"
echo &>> blynk.service ""
echo &>> blynk.service "[Service]"
echo &>> blynk.service "ExecStart=/bin/bash /home/pi/runblynk.sh"
echo &>> blynk.service "WorkingDirectory=/home/pi/blynk"
echo &>> blynk.service "StandardOutput=inherit"
echo &>> blynk.service "StandardError=inherit"
echo &>> blynk.service "Restart=Always"
echo &>> blynk.service "User=pi"
echo &>> blynk.service ""
echo &>> blynk.service "[Install]"
echo &>> blynk.service "WantedBy=multi-user.target"

