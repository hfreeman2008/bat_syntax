# bat syntax

bat script syntax(bat 脚本语法)


![美女_01](美女_01.png)


---

# 查看系统给出的帮助文件-/? 

查看系统给出的帮助文件

```bat
for /? 
```


---


# 注释

- 注释:: 

```bat
    ::---------------------------------------------------------------------- 
    ::  author:hexiaoming
    ::---------------------------------------------------------------------- 
```


- 注释rem

```bat
rem start work
```

---

# echo-输出消息

```bat
@echo start run bat script
@echo end run bat script
```

输出空白行:
```bat
@echo.
```


@字符放在命令前将关闭该命令回显，无论此时echo是否为打开状态。

echo命令的作用列举如下：
- 打开回显或关闭回显功能

    格式:echo [{ on|off }]

    如果想关闭“ECHO OFF”命令行自身的显示，则需要在该命令行前加上“@”。
- 显示当前ECHO设置状态

    格式:echo
- 输出提示信息

    格式：echo 信息内容



---

# pause-暂停

运行此句会暂停批处理的执行并在屏幕上显示Press any key to continue...的提示，等待用户按任意键后继续

```bat
pause
```

---

# cd-进入路径

```bat
Z:
cd Z:\LINUX\android\out\target\product\
```


---

# 本地路径

%~dp0\

```bat
adb push %~dp0\ATCLogger\ /system/app
adb shell sync
```

---

# call-调用bat脚本

call 调用ucdos.bat脚本
```bat
call c:\ucdos\ucdos.bat
```

---

# %-批处理变量引导符

引用变量用%var%，调用程序外部参数用%1至%9等等

```bat
%0  %1  %2  %3  %4  %5  %6  %7  %8  %9  %*为命令行传递给批处理的参数
%0 批处理文件本身，包括完整的路径和扩展名
%1 第一个参数
%9 第九个参数
%* 从第一个参数开始的所有参数
```



参数%0具有特殊的功能，可以调用批处理自身，以达到批处理本身循环的目的，也可以复制文件自身等等。


最简单的复制文件自身的方法
```bat
copy %0 d:\wind.bat
```


---

# 变量

## 系统变量
他们的值由系统将其根据事先定义的条件自动赋值,也就是这些变量系统已经给他们定义了值,不需要我们来给他赋值,我们只需要调用.


```bat
%ALLUSERSPROFILE% 本地 返回“所有用户”配置文件的位置。
%APPDATA% 本地 返回默认情况下应用程序存储数据的位置。
%CD% 本地 返回当前目录字符串。
%CMDCMDLINE% 本地 返回用来启动当前的 Cmd.exe 的准确命令行。
%CMDEXTVERSION% 系统 返回当前的“命令处理程序扩展”的版本号。
%COMPUTERNAME%  系统 返回计算机的名称。
%COMSPEC%  系统 返回命令行解释器可执行程序的准确路径。
%DATE%  系统 返回当前日期。使用与 date /t 命令相同的格式。由 Cmd.exe 生成有关
```

- 命令：
```bat
@echo off
echo ALLUSERSPROFILE =  %ALLUSERSPROFILE%
echo APPDATA =  %APPDATA%
echo CD =  %CD%
echo CMDCMDLINE =  %CMDCMDLINE%
echo CMDEXTVERSION =  %CMDEXTVERSION%
echo COMPUTERNAME =  %COMPUTERNAME%
echo COMSPEC =  %COMSPEC%
echo DATE =  %DATE%

pause
```


- 输出：

```bat
ALLUSERSPROFILE =  C:\ProgramData
APPDATA =  C:\Users\240500008\AppData\Roaming
CD =  D:\bat测试
CMDCMDLINE =  C:\Windows\system32\cmd.exe /c ""D:\bat测试\test.bat" "
CMDEXTVERSION =  2
COMPUTERNAME =  HYT240500008
COMSPEC =  C:\Windows\system32\cmd.exe
DATE =  2024/07/21 周日
```


---

## 自定义变量

使用自定义变量就得使用set命令

```bat
@echo off
set var=10
echo var=  %var%
pause
```

如果我们想让用户手工输入变量的值,而不是在代码里指定,可以用用set命令的/p参数

```bat
@echo off
set /p var=pleaes input value
echo var= %var%
pause
```




---


```bat

```

---


# 参考资料




---




[<font face='黑体' color=#ff0000 size=40 >跳转到文章开始</font>](#bat-syntax)

---

![妹子_01](妹子_01.png)
