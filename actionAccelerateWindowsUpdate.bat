@ECHO OFF

REM Step 1: 請先下載以下離線安裝檔，google就有了(並且有繁體中文下載頁面)：
REM Windows6.1-KB3020369-x64.msu
REM Windows6.1-KB3050265-x64.msu
REM Windows6.1-KB3065987-v2-x64.msu
REM Windows6.1-KB3102810-x64.msu      
REM Windows6.1-KB3135445-x64.msu
REM Windows6.1-KB3138612-x64.msu
REM Windows6.1-KB3161664-x64.msu
REM Windows6.1-KB3172605-x64.msu

REM Step 2: 以下腳本會背景安裝離線更新檔，請先更改兩行路徑！

FOR /f %%i IN ('dir /b C:\Users\user\Documents\MustInstalledV2\Windows6.1-KB*.msu') DO (
  NET STOP wuauserv > nul
  timeout 1 > nul
  start /wait C:\Users\user\Documents\MustInstalledV2\%%i /quiet /norestart > nul
  ECHO %%i is finished!
)

ECHO The whole work is finished!
ECHO Completed time: %date% %time%

PAUSE
