:: author hexiaoming
:: pull_data.bat

::@echo off

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
set file_name_anr=%pull_data_root%/%data_path%/anr/
echo ###====== adb pull /data/anr/======> %file_name_anr%
echo ====================================== %file_name_anr%
adb pull /data/anr/ ./%file_name_anr%


::log
set file_name_logs=%pull_data_root%/%data_path%/log/
echo ###====== adb pull /storage/emulated/0/logs ======> %file_name_logs%
echo ====================================== %file_name_logs%
adb pull /storage/emulated/0/logs ./%file_name_logs%

::/data/user_de/0/com.android.providers.telephony
set file_name_providers_telephony=%pull_data_root%/%data_path%/com.android.providers.telephony/
echo ###====== adb pull/data/user_de/0/com.android.providers.telephony/ ======> %file_name_providers_telephony%
echo ====================================== %file_name_providers_telephony%
adb pull /data/user_de/0/com.android.providers.telephony/ ./%file_name_providers_telephony%

::/product/media/
set file_name_product_media=%pull_data_root%/%data_path%/product_media/
echo ###====== adb pull /product/media/ ======> %file_name_product_media%
echo ====================================== %file_name_product_media%
adb pull /product/media/ ./%file_name_product_media%


::adb shell getprop
set file_name_prop=%pull_data_root%/%data_path%/prop.txt
echo ###====== adb shell getprop ======> %file_name_prop%
echo ====================================== %file_name_prop%
adb shell getprop >> %file_name_prop%


::adb shell pm list package
set file_name_pm_list_package=%pull_data_root%/%data_path%/pm_list_package.txt
adb shell pm list package >> %file_name_pm_list_package%

::adb shell dumpsys cpuinfo
set file_name_dumpsys_cpuinfo=%pull_data_root%/%data_path%/dumpsys_cpuinfo.txt
echo ====== adb shell dumpsys cpuinfo ====== > %file_name_dumpsys_cpuinfo%
echo ====================================== >> %file_name_dumpsys_cpuinfo%
adb shell dumpsys cpuinfo >> %file_name_dumpsys_cpuinfo%


::adb shell iotop -m 40 -n 1
set file_name_iotop=%pull_data_root%/%data_path%/iotop.txt
echo ====== adb shell iotop -m 40 -n 1 ====== > %file_name_iotop%
echo ====================================== >> %file_name_iotop%
adb shell iotop -m 40 -n 1 >> %file_name_iotop%

::adb shell dumpsys meminfo
set file_name_dumpsys_meminfo=%pull_data_root%/%data_path%/dumpsys_meminfo.txt
echo ###====== adb shell dumpsys meminfo ======> %file_name_dumpsys_meminfo%
echo ======================================>> %file_name_dumpsys_meminfo%
adb shell dumpsys meminfo >> %file_name_dumpsys_meminfo%

::adb shell cat /proc/meminfo
set file_name_proc_meminfo=%pull_data_root%/%data_path%/proc_meminfo.txt
echo ###====== adb shell cat /proc/meminfo ======> %file_name_proc_meminfo%
echo ======================================>> %file_name_proc_meminfo%
adb shell cat /proc/meminfo >> %file_name_proc_meminfo%

::adb shell cat /proc/buddyinfo
set file_name_proc_buddyinfo=%pull_data_root%/%data_path%/proc_buddyinfo.txt
echo ###====== adb shell cat /proc/buddyinfo ======> %file_name_proc_buddyinfo%
echo ======================================>> %file_name_proc_buddyinfo%
adb shell cat /proc/buddyinfo >> %file_name_proc_buddyinfo%

::adb shell vmstat 2 10
::set file_name_vmstat=%pull_data_root%/%data_path%/vmstat.txt
::echo ###====== adb shell vmstat 2 10 ======> %file_name_vmstat%
::echo ======================================>> %file_name_vmstat%
::adb shell vmstat 2 10 >> %file_name_vmstat%


::adb shell df -ha
set file_name_df=%pull_data_root%/%data_path%/df_ha.txt
echo ###====== adb shell df -ha ======> %file_name_df%
echo ======================================>> %file_name_df%
adb shell df -ha >> %file_name_df%

::adb shell cat /proc/stat
set file_name_proc_stat=%pull_data_root%/%data_path%/proc_stat.txt
echo ###====== adb shell cat /proc/stat ======> %file_name_proc_stat%
echo ======================================>> %file_name_proc_stat%
adb shell cat /proc/stat >> %file_name_proc_stat%


::adb shell ps -AT
set file_name_ps=%pull_data_root%/%data_path%/ps.txt
echo ###====== adb shell ps -AT ======> %file_name_ps%
echo ======================================>> %file_name_ps%
adb shell ps -AT >> %file_name_ps%

::adb shell dumpsys activity
set file_name_dumpsys_activity=%pull_data_root%/%data_path%/dumpsys_activity.txt
echo ###====== adb shell dumpsys activity ======> %file_name_dumpsys_activity%
echo ======================================>> %file_name_dumpsys_activity%
adb shell dumpsys activity >> %file_name_dumpsys_activity%


::adb shell dumpsys window
set file_name_dumpsys_window=%pull_data_root%/%data_path%/dumpsys_window.txt
echo ###====== adb shell dumpsys window ======> %file_name_dumpsys_window%
echo ======================================>> %file_name_dumpsys_window%
adb shell dumpsys window >> %file_name_dumpsys_window%


::adb shell dumpsys batterystats
set file_name_dumpsys_batterystats=%pull_data_root%/%data_path%/dumpsys_batterystats.txt
echo ###====== adb shell dumpsys batterystats ======> %file_name_dumpsys_batterystats%
echo ======================================>> %file_name_dumpsys_batterystats%
adb shell dumpsys batterystats >> %file_name_dumpsys_batterystats%


::adb shell dumpsys SurfaceFlinger
set file_name_dumpsys_SurfaceFlinger=%pull_data_root%/%data_path%/dumpsys_SurfaceFlinger.txt
echo ###====== adb shell dumpsys SurfaceFlinger ======> %file_name_dumpsys_SurfaceFlinger%
echo ======================================>> %file_name_dumpsys_SurfaceFlinger%
adb shell dumpsys SurfaceFlinger >> %file_name_dumpsys_SurfaceFlinger%


::adb shell dumpsys procstats
set file_name_dumpsys_procstats=%pull_data_root%/%data_path%/dumpsys_procstats.txt
echo ###====== adb shell dumpsys procstats ======> %file_name_dumpsys_procstats%
echo ======================================>> %file_name_dumpsys_procstats%
adb shell dumpsys procstats >> %file_name_dumpsys_procstats%


::adb shell dumpsys activity oom
set file_name_oom=%pull_data_root%/%data_path%/dumpsys_activity_oom.txt
echo ###====== adb shell dumpsys activity oom ======> %file_name_oom%
echo ======================================>> %file_name_oom%
adb shell dumpsys activity oom >> %file_name_oom%


::adb shell cat /proc/version
set file_name_proc_verion=%pull_data_root%/%data_path%/proc_verion.txt
echo ###====== adb shell cat /proc/version ======> %file_name_kernel_verion%
echo ======================================>> %file_name_kernel_verion%
adb shell cat /proc/version >> %file_name_proc_verion%


::adb shell wm size
set file_name_wm_size=%pull_data_root%/%data_path%/wm_size.txt
echo ###====== adb shell wm size ======> %file_name_wm_size%
echo ======================================>> %file_name_wm_size%
adb shell wm size >> %file_name_wm_size%


::adb shell cat /proc/kmsg
set file_name_proc_kmsg=%pull_data_root%/%data_path%/proc_kmsg.txt
echo ###====== adb shell cat /proc/kmsg ======> %file_name_proc_kmsg%
echo ======================================>> %file_name_proc_kmsg%
adb shell cat /proc/kmsg >> %file_name_proc_kmsg%

::adb shell dmesg
set file_name_dmesg=%pull_data_root%/%data_path%/dmesg.txt
echo ###====== adb shell dmesg ======> %file_name_dmesg%
echo ======================================>> %file_name_dmesg%
adb shell dmesg >> %file_name_dmesg%


::adb shell procrank
set file_name_procrank=%pull_data_root%/%data_path%/procrank.txt
echo ###====== adb shell procrank ======> %file_name_procrank%
echo ======================================>> %file_name_procrank%
adb shell procrank >> %file_name_procrank%


::adb pull /data/tombstones ./tombstones
set file_name_tombstones=%pull_data_root%/%data_path%/tombstones
echo ###====== adb pull /data/tombstones ./tombstones ======> %file_name_tombstones%
echo ======================================>> %file_name_tombstones%
adb pull /data/tombstones ./%file_name_tombstones%


::adb pull /data/system/dropbox/ ./dropbox
set file_name_dropbox=%pull_data_root%/%data_path%/dropbox
echo ###====== adb pull /data/system/dropbox/ ======> %file_name_dropbox%
echo ====================================== %file_name_dropbox%
adb pull /data/system/dropbox/ ./%file_name_dropbox%

::adb pull /data/system/packages.xml ./data_system/
::adb pull /data/system/packages.list ./data_system/
set file_name_data_system=%pull_data_root%/%data_path%/data_system/
echo ###====== adb pull/data/system/packages.xml ======> %file_name_data_system%
echo ====================================== %file_name_data_system%
adb pull /data/system/packages.xml ./%file_name_data_system%
adb pull /data/system/packages.list ./%file_name_data_system%


pause
