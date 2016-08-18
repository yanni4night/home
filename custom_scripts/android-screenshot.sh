#!/bin/bash

if [ '' = `which adb`];then
    echo 'adb is required'
    exit
fi

adb shell /system/bin/screencap -p /sdcard/screenshot.png
adb pull /sdcard/screenshot.png ~/Downloads/