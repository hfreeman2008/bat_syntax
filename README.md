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

- 使用自定义变量就得使用set命令

```bat
@echo off
set var=10
echo var=  %var%
pause
```

- set变量的使用

```bat
set YYYYmmdd=%date:~0,4%%date:~5,2%%date:~8,2%
set hhmiss=%time:~0,2%%time:~3,2%%time:~6,2%
set filename=%YYYYmmdd%_%hhmiss%

adb shell screencap /sdcard/%filename%.png
adb pull /sdcard/%filename%.png ./screen_ui/%filename%.png
```



- 如果我们想让用户手工输入变量的值,而不是在代码里指定,可以用用set命令的/p参数

```bat
@echo off
set /p var=pleaes input value
echo var= %var%
pause
```

---

# 组合命令

## & 
语法：第一条命令 & 第二条命令 [& 第三条命令...]

&、&&、||为组合命令，顾名思义，就是可以把多个命令组合起来当一个命令来执行。这在批处理脚本里是允许的，而且用的非常广泛。因为批处理认行不认命令数目。

这个符号允许在一行中使用2个以上不同的命令，当第一个命令执行失败了，也不影响后边的命令执行。

这里&两边的命令是顺序执行的，从前往后执行。

比如：
```bat
dir z:\ & dir y:\ & dir c:\
```

以上命令会连续显示z,y,c盘的内容，不理会该盘是否存在

---

## &&

语法：第一条命令 && 第二条命令 [&& 第三条命令...]

用这种方法可以同时执行多条命令，当碰到执行出错的命令后将不执行后面的命令，如果一直没有出错则一直执行完所有命令
这个命令和上边的类似，但区别是，第一个命令失败时，后边的命令也不会执行

---

## ||

语法：第一条命令 || 第二条命令 [|| 第三条命令...]

用这种方法可以同时执行多条命令，当一条命令失败后才执行第二条命令，当碰到执行正确的命令后将不执行后面的命令，如果没有出现正确的命令则一直执行完所有命令；


---

# if-条件语句

## 查看if帮助命令
```bat
if /?
```

输出：

```bat
执行批处理程序中的条件处理。

IF [NOT] ERRORLEVEL number command
IF [NOT] string1==string2 command
IF [NOT] EXIST filename command

  NOT               指定只有条件为 false 的情况下，Windows 才应该执行该命令。

  ERRORLEVEL number 如果最后运行的程序返回一个等于或大于指定数字的退出代码，指定条件为 true。

  string1==string2  如果指定的文字字符串匹配，指定条件为 true。

  EXIST filename    如果指定的文件名存在，指定条件为 true。

  command           如果符合条件，指定要执行的命令。如果指定的
                    条件为 FALSE，命令后可跟 ELSE 命令，该命令将
                    在 ELSE 关键字之后执行该命令。

ELSE 子句必须出现在同一行上的 IF 之后。例如:

    IF EXIST filename. (
        del filename.
    ) ELSE (
        echo filename. missing.
    )
```

- 命令1：

```bat
if "%1"=="a" format a:
```

- 命令2：
如果存在c:\config.sys文件，则显示它的内容。
```bat
if exist c:\config.sys type c:\config.sys 
```


- 命令3：
```bat
if errorlevel 2 goto x2
```

- 增强用法：
加上/I就不区分大小写
```bat
if [/I] string1 compare-op string2 command
```

增强用法中还有一些用来判断数字的符号：
```bat
EQU - 等于
NEQ - 不等于
LSS - 小于
LEQ - 小于或等于
GTR - 大于
GEQ - 大于或等于
```


---
















---

```bat

```

---

# >  >> 建立新文件或增加文件内容

格式：

```bat
ECHO 文件内容>文件名
ECHO 文件内容>>文件名
```

\>>  追加信息到指定文件
```bat
ping sz.tencent.com > a.txt
ping sz1.tencent.com >> a.txt
.......
ping sz7.tencent.com >> a.txt
exit
```

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

# 参考资料




---




[<font face='黑体' color=#ff0000 size=40 >跳转到文章开始</font>](#bat-syntax)

---

![妹子_01](妹子_01.png)
