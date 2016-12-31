#!/bin/bash

if [ "$(id -u)" != "0" ]; then  #Check if script is being run as root
   echo "This script must be run as root" 1>&2
   exit 1
fi
if [ ! $? = 0 ]; then
   exit 1
else
   mkdir "/opt/piswitch"
   cp -a softshut.py /opt/piswitch
   cp -a piswitch.service /etc/systemd/system

   systemctl enable /etc/systemd/system/piswitch.service
   systemctl start piswitch.service
   whiptail --title "Installation complete" --msgbox "piSwitch installation complete. You can now safely shutdown your Raspberry Pi and insert the micro SD card into your Raspberry Pi Zero." 8 78
fi
