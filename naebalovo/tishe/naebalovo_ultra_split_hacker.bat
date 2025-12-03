@echo off
chcp 65001 >nul
title NAEBALOVO 💥 ULTRA SPLIT HACKER

echo [naebalovo] ULTRA SPLIT HACKER - АГРЕССИВНЫЙ ОБХОД 💥 [ТОП-2]

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

:: ОПТИМИЗИРОВАННАЯ КОМАНДА (убраны конфликтующие параметры)
:: Используем только один основной фильтр вместо нескольких

:: СОЗДАЕМ ВРЕМЕННЫЙ BAT ФАЙЛ ДЛЯ ЗАПУСКА
echo @echo off > ultra_temp.bat
echo winws.exe ^^>> ultra_temp.bat
echo --filter-tcp=80,443,2053,2083,2087,2096,8443 --hostlist="..\files\sites.txt.gz" --dpi-desync=fake --dpi-desync-repeats=6 --dpi-desync-fooling=ts --dpi-desync-fake-tls="bin\tls_clienthello_www_google_com.bin" --new ^^>> ultra_temp.bat
echo --filter-udp=443,3478-3481 --dpi-desync=fake --dpi-desync-repeats=6 --dpi-desync-fake-quic="bin\quic_initial_www_google_com.bin" --new ^^>> ultra_temp.bat
echo --filter-l7=discord,stun --dpi-desync=fake --new ^^>> ultra_temp.bat

:: ЗАПУСКАЕМ ЧЕРЕЗ POWERSHELL СКРЫТО
echo ⚡ Запускаем оптимизированный Ultra Split Hacker...
powershell -WindowStyle Hidden -Command "Start-Process -FilePath 'cmd.exe' -ArgumentList '/c ultra_temp.bat' -WindowStyle Hidden"

:: Ждем и удаляем временный файл
timeout /t 2 >nul
del ultra_temp.bat >nul 2>&1

:: Проверяем запустился ли процесс
timeout /t 3 >nul
tasklist /fi "imagename eq winws.exe" | find /i "winws.exe" >nul
if errorlevel 1 (
    echo ⚠️  winws.exe не запустился с полной командой!
    echo 💡 Пробуем упрощенный вариант...
    
    :: Упрощенная команда (только основные порты)
    echo @echo off > ultra_simple.bat
    echo winws.exe --filter-tcp=80,443 --dpi-desync=fake --dpi-desync-repeats=4 --new ^^>> ultra_simple.bat
    echo --filter-udp=443 --dpi-desync=fake --dpi-desync-repeats=4 --dpi-desync-fake-quic="bin\quic_initial_www_google_com.bin" --new ^^>> ultra_simple.bat
    
    powershell -WindowStyle Hidden -Command "Start-Process -FilePath 'cmd.exe' -ArgumentList '/c ultra_simple.bat' -WindowStyle Hidden"
    
    timeout /t 2 >nul
    del ultra_simple.bat >nul 2>&1
    
    timeout /t 2 >nul
    tasklist /fi "imagename eq winws.exe" | find /i "winws.exe" >nul
    
    if errorlevel 1 (
        echo ❌ winws.exe не запустился!
        echo 💡 Используем базовый обход...
        
        :: Базовый запуск через VBScript
        echo Set WshShell = CreateObject("WScript.Shell") > ultra_base.vbs
        echo WshShell.CurrentDirectory = "%cd%" >> ultra_base.vbs
        echo WshShell.Run "cmd /c winws.exe --filter-tcp=443 --dpi-desync=fake --new", 0, False >> ultra_base.vbs
        wscript.exe //B ultra_base.vbs
        del ultra_base.vbs >nul 2>&1
        
        timeout /t 2 >nul
        tasklist /fi "imagename eq winws.exe" | find /i "winws.exe" >nul
        
        if errorlevel 1 (
            echo ❌ КРИТИЧЕСКАЯ ОШИБКА!
            echo 🔧 Проверь работу winws.exe вручную
        ) else (
            echo ✅ Ultra Split Hacker запущен в базовом режиме!
        )
    ) else (
        echo ✅ Ultra Split Hacker запущен в упрощенном режиме!
    )
) else (
    echo ✅ Naebalovo Ultra Split Hacker запущен и работает!
)

:: Проверяем работу обхода
echo.
echo 🧪 Проверяем работу обхода...
powershell -Command "
    \$success = 0
    \$sites = @('https://google.com', 'https://youtube.com', 'https://twitter.com')
    
    foreach (\$site in \$sites) {
        try {
            \$request = Invoke-WebRequest -Uri \$site -TimeoutSec 3 -UseBasicParsing -ErrorAction Stop
            Write-Host '✅ ' \$site ' - ДОСТУПЕН' -ForegroundColor Green
            \$success++
        } catch {
            Write-Host '❌ ' \$site ' - ЗАБЛОКИРОВАН' -ForegroundColor Red
        }
    }
    
    if (\$success -gt 0) {
        Write-Host '🎯 Обход работает! Доступно сайтов:' \$success 'из' \$sites.Count -ForegroundColor Green
    } else {
        Write-Host '⚠️  Возможны проблемы с обходом' -ForegroundColor Yellow
    }
" 2>nul

timeout /t 1 >nul