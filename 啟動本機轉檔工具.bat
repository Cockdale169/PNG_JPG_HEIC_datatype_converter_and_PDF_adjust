@echo off
chcp 65001 >nul
title 啟動個人轉檔與 PDF 編排工作台

set "DIR=%~dp0"
cd /d "%DIR%"

echo =====================================================
echo  ⚡ 正在啟動個人轉檔與 PDF 編排工作台...
echo =====================================================

REM 優先尋找 bio_env 或系統 python
if exist "C:\Users\csf90\OneDrive\Desktop\Anaconda\envs\bio_env\python.exe" (
    start "" "C:\Users\csf90\OneDrive\Desktop\Anaconda\envs\bio_env\python.exe" "%DIR%server.py"
    goto END
)

where python >nul 2>nul
if %errorlevel% equ 0 (
    start "" python "%DIR%server.py"
    goto END
)

REM 若無 Python，直接以預設瀏覽器開啟本地 index.html
echo 正在直接以預設瀏覽器開啟本地檔案...
start "" "%DIR%index.html"

:END
echo.
echo 服務已在背景啟動！您可以隨時透過瀏覽器書籤連入：
echo http://localhost:8899
echo.
timeout /t 3 >nul
exit
