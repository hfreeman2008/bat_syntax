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


```bat

```


---


# 参考资料




---




[<font face='黑体' color=#ff0000 size=40 >跳转到文章开始</font>](#bat-syntax)

---

![妹子_01](妹子_01.png)
