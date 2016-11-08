@ECHO OFF

SET /P POS="結果放置在: "

REM 將主要更新(Hotfix)印出成txt檔：

wmic qfe list brief /format:texttablewsys > "%POS%\hotfix.txt"

REM 將主要更新(Hotfix)印出成html檔：

REM wmic qfe list brief /format:htable > "%POS%\hotfix.html"

PAUSE
