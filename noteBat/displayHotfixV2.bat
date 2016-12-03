@ECHO OFF

REM SET /P POS="結果存放在: "

REM systeminfo | findstr "KB"

systeminfo | findstr "KB" > .\info.txt

PAUSE
