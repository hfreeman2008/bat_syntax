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

# for-循环命令

查看帮助命令：
```bat
for /?
```


输出：
```bat
对一组文件中的每一个文件执行某个特定命令。

FOR %variable IN (set) DO command [command-parameters]

  %variable  指定一个单一字母可替换的参数。
  (set)      指定一个或一组文件。可以使用通配符。
  command    指定对每个文件执行的命令。
  command-parameters   为特定命令指定参数或命令行开关。

在批处理程序中使用 FOR 命令时，指定变量请使用 %%variable 而不要用 %variable。变量名称是区分大小写的，所以 %i 不同于 %I.

如果启用命令扩展，则会支持下列 FOR 命令的其他格式:

FOR /D %variable IN (set) DO command [command-parameters]

    如果集中包含通配符，则指定与目录名匹配，而不与文件名匹配。

FOR /R [[drive:]path] %variable IN (set) DO command [command-parameters]

    检查以 [drive:]path 为根的目录树，指向每个目录中的 FOR 语句。
    如果在 /R 后没有指定目录规范，则使用当前目录。如果集仅为一个单点(.)字符，
    则枚举该目录树。

FOR /L %variable IN (start,step,end) DO command [command-parameters]

    该集表示以增量形式从开始到结束的一个数字序列。因此，(1,1,5)将产生序列
    1 2 3 4 5，(5,-1,1)将产生序列(5 4 3 2 1)

FOR /F ["options"] %variable IN (file-set) DO command [command-parameters]
FOR /F ["options"] %variable IN ("string") DO command [command-parameters]
FOR /F ["options"] %variable IN ('command') DO command [command-parameters]

    或者，如果有 usebackq 选项:

FOR /F ["options"] %variable IN (file-set) DO command [command-parameters]
FOR /F ["options"] %variable IN ("string") DO command [command-parameters]
FOR /F ["options"] %variable IN ('command') DO command [command-parameters]

    fileset 为一个或多个文件名。继续到 fileset 中的下一个文件之前，
    每份文件都被打开、读取并经过处理。处理包括读取文件，将其分成一行行的文字，
    然后将每行解析成零或更多的符号。然后用已找到的符号字符串变量值调用 For 循环。
    以默认方式，/F 通过每个文件的每一行中分开的第一个空白符号。跳过空白行。
    你可通过指定可选 "options" 参数替代默认解析操作。这个带引号的字符串包括一个
    或多个指定不同解析选项的关键字。这些关键字为:
        eol=c           - 指一个行注释字符的结尾(就一个)
        skip=n          - 指在文件开始时忽略的行数。
        delims=xxx      - 指分隔符集。这个替换了空格和制表符的默认分隔符集。
        tokens=x,y,m-n  - 指每行的哪一个符号被传递到每个迭代的for本身。这会导致额外变量名称的分配。m-n
                          格式为一个范围。通过 nth 符号指定 mth。如果符号字符串中的最后一个字符星号，
                          那么额外的变量将在最后一个符号解析之后分配并接受行的保留文本。
        usebackq        - 指定新语法已在下类情况中使用:
                          在作为命令执行一个后引号的字符串并且一个单
                          引号字符为文字字符串命令并允许在 file-set
                          中使用双引号扩起文件名称。

    某些范例可能有助:

FOR /F "eol=; tokens=2,3* delims=, " %i in (myfile.txt) do @echo %i %j %k

    会分析 myfile.txt 中的每一行，忽略以分号打头的那些行，将
    每行中的第二个和第三个符号传递给 for 函数体，用逗号和/或
    空格分隔符号。请注意，此 for 函数体的语句引用 %i 来
    获得第二个符号，引用 %j 来获得第三个符号，引用 %k
    来获得第三个符号后的所有剩余符号。对于带有空格的文件
    名，你需要用双引号将文件名括起来。为了用这种方式来使
    用双引号，还需要使用 usebackq 选项，否则，双引号会
    被理解成是用作定义某个要分析的字符串的。

    %i 在 for 语句中显式声明，%j 和 %k 是通过
    tokens= 选项隐式声明的。可以通过 tokens= 一行
    指定最多 26 个符号，只要不试图声明一个高于字母 "z" 或
    "Z" 的变量。请记住，FOR 变量是单一字母、分大小写和全局的变量；
    而且，不能同时使用超过 52 个。

    还可以在相邻字符串上使用 FOR /F 分析逻辑，方法是，
    用单引号将括号之间的 file-set 括起来。这样，该字符
    串会被当作一个文件中的一个单一输入行进行解析。

    最后，可以用 FOR /F 命令来分析命令的输出。方法是，将
    括号之间的 file-set 变成一个反括字符串。该字符串会
    被当作命令行，传递到一个子 CMD.EXE，其输出会被捕获到
    内存中，并被当作文件分析。如以下例子所示:

      FOR /F "usebackq delims==" %i IN (`set`) DO @echo %i

    会枚举当前环境中的环境变量名称。

另外，FOR 变量参照的替换已被增强。你现在可以使用下列
选项语法:

     %~I          - 删除任何引号(")，扩展 %I
     %~fI        - 将 %I 扩展到一个完全合格的路径名
     %~dI        - 仅将 %I 扩展到一个驱动器号
     %~pI        - 仅将 %I 扩展到一个路径
     %~nI        - 仅将 %I 扩展到一个文件名
     %~xI        - 仅将 %I 扩展到一个文件扩展名
     %~sI        - 扩展的路径只含有短名
     %~aI        - 将 %I 扩展到文件的文件属性
     %~tI        - 将 %I 扩展到文件的日期/时间
     %~zI        - 将 %I 扩展到文件的大小
     %~$PATH:I   - 查找列在路径环境变量的目录，并将 %I 扩展
                   到找到的第一个完全合格的名称。如果环境变量名
                   未被定义，或者没有找到文件，此组合键会扩展到
                   空字符串

可以组合修饰符来得到多重结果:

     %~dpI       - 仅将 %I 扩展到一个驱动器号和路径
     %~nxI       - 仅将 %I 扩展到一个文件名和扩展名
     %~fsI       - 仅将 %I 扩展到一个带有短名的完整路径名
     %~dp$PATH:I - 搜索列在路径环境变量的目录，并将 %I 扩展
                   到找到的第一个驱动器号和路径。
     %~ftzaI     - 将 %I 扩展到类似输出线路的 DIR

在以上例子中，%I 和 PATH 可用其他有效数值代替。%~ 语法
用一个有效的 FOR 变量名终止。选取类似 %I 的大写变量名
比较易读，而且避免与不分大小写的组合键混淆。

```

命令1：

显示当前目录下所有以bat和txt为扩展名的文件的内容。
```bat
for %%c in (*.bat *.txt) do type %%c
pause
```


for有4个参数 /d   /l   /r   /f

## 参数 /d--指定为文件目录
    
如果集中包含通配符，则指定与目录名匹配，而不与文件名匹配。

如果 Set (也就是我上面写的 "相关文件或命令") 包含通配符（* 和 ?），将对与 Set 相匹配的每个目录（而不是指定目录中的文件组）执行指定的 Command。
这个参数主要用于目录搜索,不会搜索文件

命令2：

运行会把C盘根目录下的全部目录名字打印出来,而文件名字一个也不显示!

```bat
@echo off
for /d %%i in (c:\*) do echo %%i
pause
```
输出：

```bat
c:\DrvPath
c:\MyFileAudit
c:\PerfLogs
c:\Program Files
c:\Program Files (x86)
c:\Quarantine
c:\Temp
c:\Users
c:\Windows
```

## 参数 /R--递归
```bat
FOR /R [[drive:]path] %variable IN (set) DO command [command-parameters]

    检查以 [drive:]path 为根的目录树，指向每个目录中的 FOR 语句。
    如果在 /R 后没有指定目录规范，则使用当前目录。如果集仅为一个单点(.)字符，
    则枚举该目录树。
```

命令3：
把C盘根目录,和每个目录的子目录下面全部的EXE文件都列出来了
```bat
@echo off
for /r c:\ %%i in (*.exe) do echo %%i
pause
```


命令4：
当前目录为和他下面的子目录的全部EXE文件列出来
```bat
@echo off
for /r %%i in (*.exe) do @echo %%i
pause
```


命令5：
枚举了c盘所有目录
```bat
@echo off
for /r c:\ %%i in (boot.ini) do echo %%i
pause
```

命令6：
为了只列举boot.ini存在的目录
```bat
@echo off
for /r c:\ %%i in (boot.ini) do if exist %%i echo %%i
pause
```

## 参数 /L
```bat
FOR /L %variable IN (start,step,end) DO command [command-parameters]

    该集表示以增量形式从开始到结束的一个数字序列。因此，(1,1,5)将产生序列
    1 2 3 4 5，(5,-1,1)将产生序列(5 4 3 2 1)
```

命令7：
打印从1 2 3 4 5  这样5个数字
```bat
@echo off
for /l %%i in (1,1,5) do @echo %%i
pause
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

# errorlevel-程序返回码
```bat
echo %errorlevel%
```

IF ERRORLEVEL 是用来测试它的上一个DOS命令的返回值的，注意只是上一个命令的返回值，而且返回值必须依照从大到小次序顺序判断。

因此下面的批处理文件是错误的：
```bat
@ECHO OFF 
XCOPY C:\AUTOEXEC.BAT D:\ 
IF ERRORLEVEL 0 ECHO 成功拷贝文件 
IF ERRORLEVEL 1 ECHO 未找到拷贝文件 
IF ERRORLEVEL 2 ECHO 用户通过ctrl-c中止拷贝操作 
IF ERRORLEVEL 3 ECHO 预置错误阻止文件拷贝操作 
IF ERRORLEVEL 4 ECHO 拷贝过程中写盘错误
```


---

# title-设置窗口的标题

```bat
title "hello_title"
```


---


# color-设置控制台前景和背景颜色

查看帮助命令：
```bat
color /?
```

输出：
```bat
设置默认的控制台前景和背景颜色。
COLOR [attr]
  attr        指定控制台输出的颜色属性。

颜色属性由两个十六进制数字指定 -- 第一个对应于背景，第二个对应于前景。每个数字可以为以下任何值:
    0 = 黑色       8 = 灰色
    1 = 蓝色       9 = 淡蓝色
    2 = 绿色       A = 淡绿色
    3 = 浅绿色     B = 淡浅绿色
    4 = 红色       C = 淡红色
    5 = 紫色       D = 淡紫色
    6 = 黄色       E = 淡黄色
    7 = 白色       F = 亮白色

如果没有给定任何参数，此命令会将颜色还原到 CMD.EXE 启动时的颜色。这个值来自当前控制台窗口、/T 命令行开关或 DefaultColor 注册表值。

如果尝试使用相同的前景和背景颜色来执行
 COLOR 命令，COLOR 命令会将 ERRORLEVEL 设置为 1。

示例: "COLOR fc" 在亮白色上产生淡红色
```



黑景亮白字：
```bat
color 0f
```

---

# choice
使用此命令可以让用户输入一个字符（用于选择），从而根据用户的选择返回不同errorlevel，然后于if errorlevel配合，根据用户的选择运行不同的命令。

查看帮助命令：
```bat
choice /?
```

输出：
```bat
CHOICE [/C choices] [/N] [/CS] [/T timeout /D choice] [/M text]
描述:
    该工具允许用户从选择列表选择一个项目并返回所选项目的索引。
参数列表:
   /C    choices       指定要创建的选项列表。默认列表是 "YN"。
   /N                  在提示符中隐藏选项列表。提示前面的消息得到显示，选项依旧处于启用状态。
   /CS                 允许选择分大小写的选项。在默认情况下，这个工具是不分大小写的。
   /T    timeout       做出默认选择之前，暂停的秒数。可接受的值是从 0到 9999。如果指定了 0，就不会有暂停，默认选项会得到选择。
   /D    choice        在 nnnn 秒之后指定默认选项。字符必须在用 /C 选项指定的一组选择中; 同时，必须用 /T 指定 nnnn。
   /M    text          指定提示之前要显示的消息。如果没有指定，工具只显示提示。
   /?                  显示此帮助消息。

   注意:
   ERRORLEVEL 环境变量被设置为从选择集选择的键索引。列出的第一个选择返回 1，第二个选择返回 2，等等。如果用户按的键不是有效的选择，该工具会发出警告响声。如果该工具检测到错误状态，它会返回 255 的ERRORLEVEL 值。
   如果用户按 Ctrl+Break 或 Ctrl+C 键，该工具会返回 0 的 ERRORLEVEL 值。在一个批程序中使用 ERRORLEVEL 参数时，将参数降序排列。

示例:
   CHOICE /?
   CHOICE /C YNC /M "确认请按 Y，否请按 N，或者取消请按 C。"
   CHOICE /T 10 /C ync /CS /D y
   CHOICE /C ab /M "选项 1 请选择 a，选项 2 请选择 b。"
   CHOICE /C ab /N /M "选项 1 请选择 a，选项 2 请选择 b。"
```


test.bat的内容如下（注意，用if errorlevel判断返回值时，要按返回值从高到低排列）: 
```bat
@echo off 
choice /C dme /M "defrag,mem,end"
if errorlevel 3 goto end
if errorlevel 2 goto mem 
if errotlevel 1 goto defrag
:defrag 
c:\dos\defrag 
goto end
:mem 
mem 
goto end
:end 
echo good bye
```



---

# find-在文件中搜索字符串

查看find帮助命令：
```bat
find /?
```


输出：
```bat
在文件中搜索字符串。

FIND [/V] [/C] [/N] [/I] [/OFF[LINE]] "string" [[drive:][path]filename[ ...]]

  /V         显示所有未包含指定字符串的行。
  /C         仅显示包含字符串的行数。
  /N         显示行号。
  /I         搜索字符串时忽略大小写。
  /OFF[LINE] 不要跳过具有脱机属性集的文件。
  "string" 指定要搜索的文本字符串。
  [drive:][path]filename
             指定要搜索的文件。

如果没有指定路径，FIND 将搜索在提示符处键入
的文本或者由另一命令产生的文本。
```



Find常和type命令结合使用
```bat
Type [drive:][path]filename | find "string" [>tmpfile] #挑选包含string的行
Type [drive:][path]filename | find /v "string" #剔除文件中包含string的行
Type [drive:][path]filename | find /c #显示文件行数
```


命令：
```bat
@echo off
echo 111 >test.txt
echo 222 >>test.txt
find "111" test.txt
find /n "111" test.txt
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
