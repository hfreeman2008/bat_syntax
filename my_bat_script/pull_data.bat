:: author hexiaoming
:: pull_data.bat

@echo off

@title "hexiaoming pull_data.bat"
@color 0f

adb wait-for-device
adb devices

set local_path=%~dp0

::get data
set YYYYmmdd=%date:~0,4%%date:~5,2%%date:~8,2%
set hhmiss=%time:~1,1%%time:~3,2%%time:~6,2%
::set hhmiss=%time:~1,1%%time:~3,2%%time:~6,2%
set "data_path=data_%YYYYmmdd%_%hhmiss%"
set pull_data_root=pull_data
md %pull_data_root%
cd %pull_data_root%
md %data_path%
cd %local_path%



adb root
:: sleep 1 second
choice /t 1 /d y /n >nul
adb wait-for-device
adb remount
:: sleep 1 second
choice /t 1 /d y /n >nul
adb wait-for-device


::anr
set file_name_anr=%pull_data_root%/%data_path%/anr
adb pull /data/anr/ ./%file_name_anr%


::log
set file_name_logs=%pull_data_root%/%data_path%/log
adb pull /storage/emulated/0/logs ./%file_name_logs%

::/data/user_de/0/com.android.providers.telephony
set file_name_providers_telephony=%pull_data_root%/%data_path%/com.android.providers.telephony/
adb pull /data/user_de/0/com.android.providers.telephony/ ./%file_name_providers_telephony%

::/product/media/
set file_name_product_media=%pull_data_root%/%data_path%/product_media
adb pull /product/media/ ./%file_name_product_media%


::adb shell getprop
set file_name_prop=%pull_data_root%/%data_path%/prop.txt
adb shell getprop >> %file_name_prop%


pause

