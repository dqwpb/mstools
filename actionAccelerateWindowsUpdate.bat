@ECHO OFF

REM Step 0: 前置作業
REM Step 0.1: 請先以系統管理員執行命令列：net stop wuauserv
REM Step 0.2: 把C:\Windows\SoftwareDistribution\DataStore\內的檔案全部清除 -- 這個資料夾會下載更新暫存檔到資料庫檔案(.edb)和快取(.log)
REM Step 0.3: 把C:\Windows\SoftwareDistribution\Download\內的檔案全部清除 -- 已經安裝的更新(hotfix)的殘留檔，不需留著
REM psStep 0.4: Step 0.3路徑會用在確認更新是否順利進行

REM Step 1: 請先下載以下離線安裝檔，google就有了(並且有繁體中文下載頁面)：
REM Windows6.1-KB3020369-x64.msu
REM Windows6.1-KB3050265-x64.msu
REM Windows6.1-KB3065987-v2-x64.msu
REM Windows6.1-KB3102810-x64.msu      
REM Windows6.1-KB3135445-x64.msu
REM Windows6.1-KB3138612-x64.msu
REM Windows6.1-KB3161664-x64.msu
REM Windows6.1-KB3172605-x64.msu

REM Step 2: 以下腳本會背景安裝離線更新檔，請先更改兩行路徑並以系統管理員身分執行此bat！

FOR /f %%i IN ('dir /b C:\Users\user\Documents\MustInstalledV2\Windows6.1-KB*.msu') DO (
  NET STOP wuauserv > nul
  timeout 1 > nul
  start /wait C:\Users\user\Documents\MustInstalledV2\%%i /quiet /norestart > nul
  ECHO %%i is finished!
)

ECHO The whole work is finished!
ECHO Completed time: %date% %time%

REM 此步驟做完要先重開機一次！

REM Step 3: 重新執行Windows Update並觀察Step 0.3中資料庫檔案是否持續增大，有就表示檔案正在下載了，否則極有可能為SRV14問題或防火牆問題！

PAUSE
