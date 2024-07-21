:: author hexiaoming
@title "hexiaoming root remount"
@color 0f

::@echo off

adb devices
adb wait-for-device
adb root
adb wait-for-device
adb remount
adb wait-for-device
adb shell setenforce 0

pause