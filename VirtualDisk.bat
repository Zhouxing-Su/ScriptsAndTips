
@echo off
　　subst K: %TEMP%
　　echo 已虚拟K盘，完成软件安装后请任意键删除K盘！
　　pause
    subst K: /D
　　echo 已删除虚拟K盘！
    pause