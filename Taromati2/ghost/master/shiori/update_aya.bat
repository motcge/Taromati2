﻿
@echo off
chcp 65001
rem 此脚本只适用于Taromati2，除非你给你的人格也配备上ghost_terminal和reload快捷指令
cd /d %~dp0
del tmp
ren aya.dll tmp
copy %1 aya.dll
..\saori\ghost_terminal.exe -g Taromati2 -c reload
timeout /t 7
del tmp
exit
@echo on
