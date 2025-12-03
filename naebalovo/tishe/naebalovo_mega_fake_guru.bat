@echo off
chcp 65001 >nul
title NAEBALOVO 🧠 MEGA FAKE GURU

echo [naebalovo] MEGA FAKE GURU - ИНТЕЛЛЕКТУАЛЬНЫЙ ОБХОД 🧠 [ТОП-3]

:: Проверка прав администратора
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo ❌ Требуются права администратора для запуска обхода!
    timeout /t 3 >nul
    exit /b
)

:: Переход в директорию Uberi_Ruki
cd /d "%~dp0..\core\Uberi_Ruki\"

:: Проверка существования winws.exe
if not exist "winws.exe" (
    echo ❌ Ошибка: winws.exe не найден!
    timeout /t 2 >nul
    exit /b
)

:: СОЗДАЕМ ВРЕМЕННЫЙ BAT ФАЙЛ ДЛЯ ЗАПУСКА
echo @echo off > guru_temp.bat
echo winws.exe --wf-tcp=80,443,2053,2083,2087,2096,8443 --wf-udp=443,3478-3481,50000-65535 ^^>> guru_temp.bat
echo --filter-udp=443 --hostlist="..\files\sites.txt.gz" --ipset="..\files\ipv4.txt.gz" --ipset="..\files\ipv6.txt.gz" --dpi-desync=fake --dpi-desync-repeats=6 --dpi-desync-fake-quic="bin\quic_initial_www_google_com.bin" --new ^^>> guru_temp.bat
echo --filter-udp=3478-3481,50000-65535 --filter-l7=discord,stun --dpi-desync=fake --dpi-desync-repeats=6 --new ^^>> guru_temp.bat
echo --filter-tcp=2053,2083,2087,2096,8443 --hostlist-domains=discord.media --dpi-desync=multisplit --dpi-desync-split-seqovl=681 --dpi-desync-split-pos=1 --dpi-desync-split-seqovl-pattern="bin\tls_clienthello_www_google_com.bin" --new ^^>> guru_temp.bat
echo --filter-tcp=443 --hostlist="..\files\sites.txt.gz" --ip-id=zero --dpi-desync=multisplit --dpi-desync-split-seqovl=681 --dpi-desync-split-pos=1 --dpi-desync-split-seqovl-pattern="bin\tls_clienthello_www_google_com.bin" --new ^^>> guru_temp.bat
echo --filter-tcp=80,443 --hostlist="..\files\sites.txt.gz" --ipset="..\files\ipv4.txt.gz" --ipset="..\files\ipv6.txt.gz" --dpi-desync=multisplit --dpi-desync-split-seqovl=681 --dpi-desync-split-pos=1 --dpi-desync-split-seqovl-pattern="bin\tls_clienthello_www_google_com.bin" --new ^^>> guru_temp.bat
echo --filter-udp=443 --ipset="..\files\ipv4.txt.gz" --ipset="..\files\ipv6.txt.gz" --dpi-desync=fake --dpi-desync-repeats=6 --dpi-desync-fake-quic="bin\quic_initial_www_google_com.bin" --new ^^>> guru_temp.bat
echo --filter-tcp=80,443 --ipset="..\files\ipv4.txt.gz" --ipset="..\files\ipv6.txt.gz" --dpi-desync=multisplit --dpi-desync-split-seqovl=681 --dpi-desync-split-pos=1 --dpi-desync-split-seqovl-pattern="bin\tls_clienthello_www_google_com.bin" --new ^^>> guru_temp.bat
echo --filter-udp=3478-3481,50000-65535 --ipset="..\files\ipv4.txt.gz" --ipset="..\files\ipv6.txt.gz" --dpi-desync=fake --dpi-desync-autottl=2 --dpi-desync-repeats=12 --dpi-desync-any-protocol=1 --dpi-desync-fake-unknown-udp="bin\quic_initial_www_google_com.bin" --dpi-desync-cutoff=n2 >> guru_temp.bat

:: ЗАПУСКАЕМ ЧЕРЕЗ POWERSHELL СКРЫТО
powershell -WindowStyle Hidden -Command "Start-Process -FilePath 'cmd.exe' -ArgumentList '/c guru_temp.bat' -WindowStyle Hidden"

:: Ждем и удаляем временный файл
timeout /t 2 >nul
del guru_temp.bat >nul 2>&1

:: Проверяем запустился ли процесс
tasklist /fi "imagename eq winws.exe" | find /i "winws.exe" >nul
if errorlevel 1 (
    echo ❌ winws.exe не запустился!
    echo 💡 Пробуем альтернативный метод...
    
    :: Альтернативный метод через VBScript
    echo Set WshShell = CreateObject("WScript.Shell") > guru_launch.vbs
    echo WshShell.CurrentDirectory = "%cd%" >> guru_launch.vbs
    echo WshShell.Run "cmd /c winws.exe --filter-tcp=443 --dpi-desync=fake --new", 0, False >> guru_launch.vbs
    wscript.exe //B guru_launch.vbs
    del guru_launch.vbs >nul 2>&1
) else (
    echo ✅ Naebalovo Mega Fake Guru запущен и работает!
)

timeout /t 1 >nul