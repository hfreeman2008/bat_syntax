:: author hexiaoming
:: pull_data.bat

@title "hexiaoming pull_data.bat"
@color 0f

adb wait-for-device
adb devices

::get data
set YYYYmmdd=%date:~0,4%%date:~5,2%%date:~8,2%
set hhmiss=%time:~1,1%%time:~3,2%%time:~6,2%
::set hhmiss=%time:~1,1%%time:~3,2%%time:~6,2%
set "data_path=data_%YYYYmmdd%_%hhmiss%"
set pull_data_root=pull_data
md %pull_data_root%
::md %pull_data_root%/%data_path%



adb root
:: sleep 1 second
choice /t 1 /d y /n >nul
adb wait-for-device
adb remount
:: sleep 1 second
choice /t 1 /d y /n >nul
adb wait-for-device


::adb pull /data/anr/ ./anr
::set file_name_anr=%data_path%/data_anr
::adb pull /data/anr/ ./%file_name_anr%


::adb pull /storage/emulated/0/logs ./logs
set file_name_logs=%pull_data_root%/%data_path%/
adb pull /storage/emulated/0/logs ./%file_name_logs%

::/product/media/
::set file_name_media=%data_path%/data_media
::adb pull /product/media/ ./%file_name_media%

pause

