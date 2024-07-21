# bat syntax

bat script syntax(bat 脚本语法)


![美女_01](美女_01.png)


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


```bat

```

---


# 参考资料




---




[<font face='黑体' color=#ff0000 size=40 >跳转到文章开始</font>](#bat-syntax)

---

![妹子_01](妹子_01.png)
