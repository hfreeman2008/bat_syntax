:: author hexiaoming
:: get_system_performance_data.bat

@title "hexiaoming get_system_performance_data.bat"
@color 0f

adb wait-for-device
adb devices

::get data
set YYYYmmdd=%date:~0,4%%date:~5,2%%date:~8,2%
set hhmiss=%time:~0,2%%time:~3,2%%time:~6,2%
::set hhmiss=%time:~1,1%%time:~3,2%%time:~6,2%
set "data_path=data_%YYYYmmdd%_%hhmiss%"

md %data_path%


::adb shell dumpsys cpuinfo
set file_name_dumpsys_cpuinfo=%data_path%/data_dumpsys_cpuinfo.txt
echo ====== adb shell dumpsys cpuinfo ====== > %file_name_dumpsys_cpuinfo%
echo ====================================== >> %file_name_dumpsys_cpuinfo%
adb shell dumpsys cpuinfo >> %file_name_dumpsys_cpuinfo%


::adb shell iotop -m 40 -n 1
set file_name_iotop=%data_path%/data_iotop.txt
echo ====== adb shell iotop -m 40 -n 1 ====== > %file_name_iotop%
echo ====================================== >> %file_name_iotop%
adb shell iotop -m 40 -n 1 >> %file_name_iotop%


::adb shell dumpsys meminfo
set file_name_dumpsys_meminfo=%data_path%/data_dumpsys_meminfo.txt
echo ###====== adb shell dumpsys meminfo ======> %file_name_dumpsys_meminfo%
echo ======================================>> %file_name_dumpsys_meminfo%
adb shell dumpsys meminfo >> %file_name_dumpsys_meminfo%


::adb shell cat /proc/meminfo
set file_name_proc_meminfo=%data_path%/data_proc_meminfo.txt
echo ###====== adb shell cat /proc/meminfo ======> %file_name_proc_meminfo%
echo ======================================>> %file_name_proc_meminfo%
adb shell cat /proc/meminfo >> %file_name_proc_meminfo%


::adb shell cat /proc/buddyinfo
set file_name_proc_buddyinfo=%data_path%/data_proc_buddyinfo.txt
echo ###====== adb shell cat /proc/buddyinfo ======> %file_name_proc_buddyinfo%
echo ======================================>> %file_name_proc_buddyinfo%
adb shell cat /proc/buddyinfo >> %file_name_proc_buddyinfo%

::adb shell vmstat 2 10
set file_name_vmstat=%data_path%/data_vmstat.txt
echo ###====== adb shell vmstat 2 10 ======> %file_name_vmstat%
echo ======================================>> %file_name_vmstat%
adb shell vmstat 2 10 >> %file_name_vmstat%


::adb shell df -ha
set file_name_df=%data_path%/data_proc_df.txt
echo ###====== adb shell df -ha ======> %file_name_df%
echo ======================================>> %file_name_df%
adb shell df -ha >> %file_name_df%


::adb shell cat /proc/stat
set file_name_proc_stat=%data_path%/data_proc_stat.txt
echo ###====== adb shell cat /proc/stat ======> %file_name_proc_stat%
echo ======================================>> %file_name_proc_stat%
adb shell cat /proc/stat >> %file_name_proc_stat%


::adb shell ps -AT
set file_name_ps=%data_path%/data_ps.txt
echo ###====== adb shell ps -AT ======> %file_name_ps%
echo ======================================>> %file_name_ps%
adb shell ps -AT >> %file_name_ps%


::adb shell dumpsys activity
set file_name_dumpsys_activity=%data_path%/data_dumpsys_activity.txt
echo ###====== adb shell dumpsys activity ======> %file_name_dumpsys_activity%
echo ======================================>> %file_name_dumpsys_activity%
adb shell dumpsys activity >> %file_name_dumpsys_activity%


::adb shell dumpsys window
set file_name_dumpsys_window=%data_path%/data_dumpsys_window.txt
echo ###====== adb shell dumpsys window ======> %file_name_dumpsys_window%
echo ======================================>> %file_name_dumpsys_window%
adb shell dumpsys window >> %file_name_dumpsys_window%


::adb shell dumpsys batterystats
set file_name_dumpsys_batterystats=%data_path%/data_dumpsys_batterystats.txt
echo ###====== adb shell dumpsys batterystats ======> %file_name_dumpsys_batterystats%
echo ======================================>> %file_name_dumpsys_batterystats%
adb shell dumpsys batterystats >> %file_name_dumpsys_batterystats%


::adb shell dumpsys SurfaceFlinger
set file_name_dumpsys_SurfaceFlinger=%data_path%/data_dumpsys_SurfaceFlinger.txt
echo ###====== adb shell dumpsys SurfaceFlinger ======> %file_name_dumpsys_SurfaceFlinger%
echo ======================================>> %file_name_dumpsys_SurfaceFlinger%
adb shell dumpsys SurfaceFlinger >> %file_name_dumpsys_SurfaceFlinger%


::adb shell dumpsys procstats
set file_name_dumpsys_procstats=%data_path%/data_dumpsys_procstats.txt
echo ###====== adb shell dumpsys procstats ======> %file_name_dumpsys_procstats%
echo ======================================>> %file_name_dumpsys_procstats%
adb shell dumpsys procstats >> %file_name_dumpsys_procstats%


::adb shell dumpsys activity oom
set file_name_oom=%data_path%/data_dumpsys_activity_oom.txt
echo ###====== adb shell dumpsys activity oom ======> %file_name_oom%
echo ======================================>> %file_name_oom%
adb shell dumpsys activity oom >> %file_name_oom%


::adb shell getprop
set file_name_prop=%data_path%/data_prop.txt
echo ###====== adb shell getprop ======> %file_name_prop%
echo ======================================>> %file_name_prop%
adb shell getprop >> %file_name_prop%


::adb shell cat /proc/version
set file_name_kernel_verion=%data_path%/data_kernel_version.txt
echo ###====== adb shell cat /proc/version ======> %file_name_kernel_verion%
echo ======================================>> %file_name_kernel_verion%
adb shell cat /proc/version >> %file_name_kernel_verion%


::adb shell pm list package
set file_name_pm_list_package=%data_path%/data_pm_list_package.txt
echo ###====== adb shell pm list package ======> %file_name_pm_list_package%
echo ======================================>> %file_name_pm_list_package%
adb shell pm list package >> %file_name_pm_list_package%


::adb shell wm size
set file_name_wm_size=%data_path%/data_wm_size.txt
echo ###====== adb shell wm size ======> %file_name_wm_size%
echo ======================================>> %file_name_wm_size%
adb shell wm size >> %file_name_wm_size%

::adb shell cat /proc/kmsg
set file_name_proc_kmsg=%data_path%/data_proc_kmsg.txt
echo ###====== adb shell cat /proc/kmsg ======> %file_name_proc_kmsg%
echo ======================================>> %file_name_proc_kmsg%
adb shell cat /proc/kmsg >> %file_name_proc_kmsg%

::adb shell dmesg
set file_name_dmesg=%data_path%/data_dmesg.txt
echo ###====== adb shell dmesg ======> %file_name_dmesg%
echo ======================================>> %file_name_dmesg%
adb shell dmesg >> %file_name_dmesg%


adb root
:: sleep 1 second
choice /t 1 /d y /n >nul
adb wait-for-device
adb remount
:: sleep 1 second
choice /t 1 /d y /n >nul
adb wait-for-device

::adb shell procrank
set file_name_procrank=%data_path%/data_procrank.txt
echo ###====== adb shell procrank ======> %file_name_procrank%
echo ======================================>> %file_name_procrank%
adb shell procrank >> %file_name_procrank%


::adb pull /data/anr/ ./anr
set file_name_anr=%data_path%/data_anr
adb pull /data/anr/ ./%file_name_anr%


::adb pull /data/system/users/0 ./data_system_users_0/
set file_name_data_system_users_0=%data_path%/data_system_users_0
adb pull /data/system/users/0 ./%file_name_data_system_users_0%


::adb pull /data/tombstones ./tombstones
set file_name_tombstones=%data_path%/data_tombstones
adb pull /data/tombstones ./%file_name_tombstones%


::adb pull /data/system/dropbox/ ./dropbox
set file_name_dropbox=%data_path%/data_dropbox
adb pull /data/system/dropbox/ ./%file_name_dropbox%

::adb pull /data/system/packages.xml ./data_system/
::adb pull /data/system/packages.list ./data_system/
set file_name_data_system=%data_path%/data_system
adb pull /data/system/packages.xml ./%file_name_data_system%
adb pull /data/system/packages.list ./%file_name_data_system%


pause