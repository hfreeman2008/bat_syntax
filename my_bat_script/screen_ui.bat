set YYYYmmdd=%date:~0,4%%date:~5,2%%date:~8,2%
::set hhmiss=%time:~0,2%%time:~3,2%%time:~6,2%
set hhmiss=%time:~1,1%%time:~3,2%%time:~6,2%
set filename=%YYYYmmdd%_%hhmiss%

adb shell screencap -p /sdcard/%filename%.png
adb pull /sdcard/%filename%.png ./%filename%.png

start explorer %cd%

pause