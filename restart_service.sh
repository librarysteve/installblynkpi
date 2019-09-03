#!/bin/bash
user=$(whoami)

if [[ $user == 'root' ]]; then
  systemctl restart blynk.service
else
  echo "must be root, try:"
  echo "sudo ./restart_service.sh"
fi
