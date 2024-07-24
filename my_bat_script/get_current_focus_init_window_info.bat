:: author hexiaoming
:: get_current_focus_init_window_info.bat

::::::::::::::::::::::::::::::bat start:::::::::::::::::::::::::::::::::::::::::

@echo off

@title "hexiaoming get_current_focus_init_window_info.bat"
@color 0f

adb wait-for-device
adb devices

echo.
echo "=======001 get focus activity info====================================="


::get focus activity
adb shell "dumpsys activity | grep  Focused"


echo.
echo "=======002 get init window info======================================="


::get init window
adb shell "dumpsys window | grep  init"


pause
::::::::::::::::::::::::::::::bat end:::::::::::::::::::::::::::::::::::::::::