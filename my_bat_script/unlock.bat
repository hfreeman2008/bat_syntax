echo unlock OEM frist
pause

adb reboot bootloader
fastboot flashing unlock

fastboot getvar unlocked
fastboot reboot
echo please waitreboot 

TIMEOUT /T 50

adb root
adb disable-verity
adb reboot
adb wait-for-device
adb root
adb remount
pause
