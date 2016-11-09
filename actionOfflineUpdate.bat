@ECHO OFF

FOR /f %%i IN ('dir /b C:\Users\user\Documents\wuau\step1\Windows6.1-KB*.msu') DO (
  NET STOP wuauserv > nul
  timeout 1 > nul
  start /wait C:\Users\user\Documents\wuau\step1\%%i /quiet /norestart > nul
  ECHO %%i is finished!
)

ECHO The whole work is finished!

REM 程式說明：
REM 1. 開始此腳本前，要先關掉windows auto-update服務(wuauserv)，而且每執行完一次都要關掉一次服務，否則會有wusa程式駐留(工作管理員/處理程序)
REM 2. start /wait表示等這步執行完才會繼續
REM 3. /quiet省略互動模式
REM 4. /norestart省略重新啟動(ps: 最後裝完還是要重新啟動)
