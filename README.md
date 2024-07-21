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

## 自定义变量-set

- set帮助命令：
```bat
set /? 
```

输出:
```bat
显示、设置或删除 cmd.exe 环境变量。
SET [variable=[string]]
  variable  指定环境变量名。
  string    指定要指派给变量的一系列字符串。
要显示当前环境变量，键入不带参数的 SET。

如果命令扩展被启用，SET 会如下改变:

可仅用一个变量激活 SET 命令，等号或值不显示所有前缀匹配
SET 命令已使用的名称的所有变量的值。例如:
    SET P

会显示所有以字母 P 打头的变量

如果在当前环境中找不到该变量名称，SET 命令将把 ERRORLEVEL
设置成 1。

SET 命令不允许变量名含有等号。

在 SET 命令中添加了两个新命令行开关:
    SET /A expression
    SET /P variable=[promptString]
```

- 命令1：

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

# goto

批处理文件运行到这里将跳到goto所指定的标号(标号即label，标号用:后跟标准字符串来定义)处，goto语句一般与if配合使用，根据不同的条件来执行不同的命令组。

命令1：
```bat
goto end
:end 
echo this is the end
```

标号用“:字符串”来定义，标号所在行不被执行。
```bat
:start
set /a var+=1
echo %var%
if %var% leq 3 GOTO start
pause
```

---


# 函数

## 函数定义
以:func开始以goto:eof结束。:func和goto:eof之间的为函数内容

```bat
:func
echo this is a bat func
goto:eof
```

## 函数调用 call:func
```bat
call:func
pause

:func
echo this is a bat func
goto:eof
```


## bat函数返回值
目前bat函数返回值的获取有如下两种方法：
- 使用参数带回
- 使用全局变量带回
```bat
echo off
color 0d
echo bat Function example

echo =================================
echo ==========Func No paramter ======
echo =================================
echo before call myFuncNoPara
call:myFuncNoPara
echo after call myFuncNoPara

echo =================================
echo ===========Func has 2 paramter=====
echo =================================
echo before call myFuncHasPara
call:myFuncHasPara 123 abc
echo after call myFuncHasPara


echo =================================
echo =======Func with return value====
echo =================================
set return=123
set returnPara=321
echo return:%return%
echo returnPara:%returnPara%
echo befora call myFuncReturnValue
call:myFuncReturnValue returnPara abc
echo after call myFuncReturnValue
echo return:%return%
echo returnPara:%returnPara%

pause
goto:eof
 
pause

:myFuncNoPara
echo myFuncNoPara enter
echo myFuncNoPara First para:%1
echo myFuncNoPara Second para:%2
echo myFuncNoPara Third para:%3
::pause
::echo myFuncNoPara exit
goto:eof
 
:myFuncHasPara
echo myFuncHasPara enter
echo myFuncHasPara First para:%1
echo myFuncHasPara Second para:%2
echo myFuncHasPara Third para:%3
::pause
::echo myFuncHasPara exit
goto:eof
 
:myFuncReturnValue
echo myFuncReturnValue
echo myFuncReturnValue First para:%1
echo myFuncReturnValue Second para:%2
set "%~1=%2%"
set return=%2
::pause
goto:eof
```

输出：
```bat
bat Function example
=================================
==========Func No paramter ======
=================================
before call myFuncNoPara
myFuncNoPara enter
myFuncNoPara First para:
myFuncNoPara Second para:
myFuncNoPara Third para:
after call myFuncNoPara
=================================
===========Func has 2 paramter=====
=================================
before call myFuncHasPara
myFuncHasPara enter
myFuncHasPara First para:123
myFuncHasPara Second para:abc
myFuncHasPara Third para:
after call myFuncHasPara
=================================
=======Func with return value====
=================================
return:123
returnPara:321
befora call myFuncReturnValue
myFuncReturnValue
myFuncReturnValue First para:returnPara
myFuncReturnValue Second para:abc
after call myFuncReturnValue
return:abc
returnPara:abc
```


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

# start-命令

批处理中调用外部程序的命令（该外部程序在新窗口中运行，批处理程序继续往下执行，不理会外部程序的运行状况），如果直接运行外部程序则必须等外部程序完成后才继续执行剩下的指令

命令1：
调用图形界面打开D盘
```bat
start explorer d:\
```

命令2：
打开当前文件的路径：
```bat
start explorer %cd%
```


---

# 时间延迟

## (1)利用ping命令延时
解说：用到了ping命令的“/n”参数，表示要发送多少次请求到指定的ip。

本例中要发送5次请求到本机的ip（127.0.0.1）。127.0.0.1可简写为127.1。“>nul”就是屏蔽掉ping命令所显示的内容。
```bat
@echo off
echo before time: %time%
ping /n 5 127.0.0.1 >nul
echo after  time: %time%
pause
```

 
## (2)choice 睡眠几秒钟：
```bat
:: sleep 6 second
choice /t 6 /d y /n >nul
```


## (3)利用for命令延时
```bat
@echo off
echo before: %time%
for /l %%i in (1,1,50000) do echo %%i>nul
echo after : %time%
pause
```



---


# 参考资料




---




[<font face='黑体' color=#ff0000 size=40 >跳转到文章开始</font>](#bat-syntax)

---

![妹子_01](妹子_01.png)
