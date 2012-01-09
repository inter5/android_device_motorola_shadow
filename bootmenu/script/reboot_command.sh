#!/system/bin/sh
#
# Used in Android before reboot, and in all "reboot" shell commands

if [ "$1" = "recovery" ]; then

  echo "recovery" > /cache/.bootmode

fi

if [ "$1" = "bootmenu" ]; then

  echo "bootmenu" > /cache/.bootmode

fi

if [ -z "$1" ]; then
  rm /cache/.bootmode
fi

sync
