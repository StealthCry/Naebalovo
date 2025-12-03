@echo off
chcp 65001 >nul
title NAEBALOVO 🧠 MEGA FAKE GURU

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
set "TEMP_BAT=%TEMP%\guru_%RANDOM%.bat"

(
echo @echo off
echo winws.exe --wf-tcp=80,443,2053,2083,2087,2096,8443 --wf-udp=443,3478-3481,50000-65535 ^
echo --filter-udp=443 --hostlist="..\files\sites.txt.gz" --ipset="..\files\ipv4.txt.gz" --ipset="..\files\ipv6.txt.gz" --dpi-desync=fake --dpi-desync-repeats=6 --dpi-desync-fake-quic="bin\quic_initial_www_google_com.bin" --new ^
echo --filter-udp=3478-3481,50000-65535 --filter-l7=discord,stun --dpi-desync=fake --dpi-desync-repeats=6 --new ^
echo --filter-tcp=2053,2083,2087,2096,8443 --hostlist-domains=discord.media --dpi-desync=multisplit --dpi-desync-split-seqovl=681 --dpi-desync-split-pos=1 --dpi-desync-split-seqovl-pattern="bin\tls_clienthello_www_google_com.bin" --new ^
echo --filter-tcp=443 --hostlist="..\files\sites.txt.gz" --ip-id=zero --dpi-desync=multisplit --dpi-desync-split-seqovl=681 --dpi-desync-split-pos=1 --dpi-desync-split-seqovl-pattern="bin\tls_clienthello_www_google_com.bin" --new ^
echo --filter-tcp=80,443 --hostlist="..\files\sites.txt.gz" --ipset="..\files\ipv4.txt.gz" --ipset="..\files\ipv6.txt.gz" --dpi-desync=multisplit --dpi-desync-split-seqovl=681 --dpi-desync-split-pos=1 --dpi-desync-split-seqovl-pattern="bin\tls_clienthello_www_google_com.bin" --new ^
echo --filter-udp=443 --ipset="..\files\ipv4.txt.gz" --ipset="..\files\ipv6.txt.gz" --dpi-desync=fake --dpi-desync-repeats=6 --dpi-desync-fake-quic="bin\quic_initial_www_google_com.bin" --new ^
echo --filter-tcp=80,443 --ipset="..\files\ipv4.txt.gz" --ipset="..\files\ipv6.txt.gz" --dpi-desync=multisplit --dpi-desync-split-seqovl=681 --dpi-desync-split-pos=1 --dpi-desync-split-seqovl-pattern="bin\tls_clienthello_www_google_com.bin" --new ^
echo --filter-udp=3478-3481,50000-65535 --ipset="..\files\ipv4.txt.gz" --ipset="..\files\ipv6.txt.gz" --dpi-desync=fake --dpi-desync-autottl=2 --dpi-desync-repeats=12 --dpi-desync-any-protocol=1 --dpi-desync-fake-unknown-udp="bin\quic_initial_www_google_com.bin" --dpi-desync-cutoff=n2
) > "%TEMP_BAT%"

:: Запускаем скрыто через PowerShell
if exist "%TEMP_BAT%" (
    powershell -WindowStyle Hidden -Command "Start-Process -FilePath 'cmd.exe' -ArgumentList '/c \"\"%TEMP_BAT%\"\"' -WindowStyle Hidden" >nul 2>&1
    timeout /t 2 >nul
    del "%TEMP_BAT%" >nul 2>&1
)

exit