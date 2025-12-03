@echo off
chcp 65001 >nul
title NAEBALOVO ⚡ LIGHTNING GAMER

set "ROOT_DIR=%~dp0.."
cd /d "%ROOT_DIR%\core\Uberi_Ruki"

:: Проверка прав администратора
net session >nul 2>&1
if %errorLevel% neq 0 exit /b

:: Проверка существования winws.exe
if not exist "winws.exe" exit /b

:: Останавливаем предыдущие экземпляры
taskkill /f /im winws.exe >nul 2>&1

:: Создаем временный файл с командой
set "TEMP_BAT=%TEMP%\gamer_%RANDOM%.bat"

(
echo @echo off
echo winws.exe ^
echo --filter-tcp=80,443 --dpi-desync=fake --dpi-desync-repeats=3 --new ^
echo --filter-udp=3478-3481,50000-65535 --filter-l7=discord,stun --dpi-desync=fake --new ^
echo --filter-tcp=2053,2083,2087,2096,8443 --hostlist-domains=discord.media --dpi-desync=fake --new ^
echo --filter-udp=443 --dpi-desync=fake --dpi-desync-repeats=3 --dpi-desync-fake-quic="bin\quic_initial_www_google_com.bin" --new
) > "%TEMP_BAT%"

:: Запускаем скрыто через PowerShell
if exist "%TEMP_BAT%" (
    powershell -WindowStyle Hidden -Command "Start-Process -FilePath 'cmd.exe' -ArgumentList '/c \"\"%TEMP_BAT%\"\"' -WindowStyle Hidden" >nul 2>&1
    timeout /t 2 >nul
    del "%TEMP_BAT%" >nul 2>&1
)

exit