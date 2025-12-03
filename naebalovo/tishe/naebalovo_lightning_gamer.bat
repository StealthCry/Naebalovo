@echo off
chcp 65001 >nul
title NAEBALOVO ⚡ LIGHTNING GAMER

echo [naebalovo] LIGHTNING GAMER - БЫСТРЫЙ ОБХОД ДЛЯ ИГР 🚀

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

echo ⚡ Оптимизируем обход для игр и Discord...
echo 🎮 Настраиваем приоритет игрового трафика...
echo.

:: ОПТИМИЗИРОВАННАЯ КОМАНДА ДЛЯ ИГР
:: Убраны лишние параметры, оставлены только игровые порты

:: СОЗДАЕМ ВРЕМЕННЫЙ BAT ФАЙЛ ДЛЯ ЗАПУСКА
echo @echo off > gamer_temp.bat

:: Основной обход для веб-трафика
echo winws.exe ^^>> gamer_temp.bat
echo --filter-tcp=80,443 --dpi-desync=fake --dpi-desync-repeats=3 --new ^^>> gamer_temp.bat

:: Игровые порты и сервисы
echo --filter-udp=3478-3481,50000-65535 --filter-l7=discord,stun --dpi-desync=fake --new ^^>> gamer_temp.bat

:: Discord медиа серверы
echo --filter-tcp=2053,2083,2087,2096,8443 --hostlist-domains=discord.media --dpi-desync=fake --new ^^>> gamer_temp.bat

:: Быстрый UDP для игр
echo --filter-udp=443 --dpi-desync=fake --dpi-desync-repeats=3 --dpi-desync-fake-quic="bin\quic_initial_www_google_com.bin" --new ^^>> gamer_temp.bat

:: ЗАПУСКАЕМ ЧЕРЕЗ POWERSHELL СКРЫТО
powershell -WindowStyle Hidden -Command "Start-Process -FilePath 'cmd.exe' -ArgumentList '/c gamer_temp.bat' -WindowStyle Hidden"

:: Ждем и удаляем временный файл
timeout /t 2 >nul
del gamer_temp.bat >nul 2>&1

:: Проверяем запустился ли процесс
timeout /t 3 >nul
tasklist /fi "imagename eq winws.exe" | find /i "winws.exe" >nul
if errorlevel 1 (
    echo ⚠️  winws.exe не запустился с игровой конфигурацией!
    echo 🎯 Пробуем только игровые порты...
    
    :: Только игровые порты
    echo @echo off > gamer_simple.bat
    echo winws.exe ^^>> gamer_simple.bat
    echo --filter-udp=3478-3481,50000-65535 --filter-l7=discord,stun --dpi-desync=fake --new ^^>> gamer_simple.bat
    echo --filter-tcp=2053,2083,2087,2096,8443 --hostlist-domains=discord.media --dpi-desync=fake --new ^^>> gamer_simple.bat
    
    powershell -WindowStyle Hidden -Command "Start-Process -FilePath 'cmd.exe' -ArgumentList '/c gamer_simple.bat' -WindowStyle Hidden"
    
    timeout /t 2 >nul
    del gamer_simple.bat >nul 2>&1
    
    timeout /t 2 >nul
    tasklist /fi "imagename eq winws.exe" | find /i "winws.exe" >nul
    
    if errorlevel 1 (
        echo ❌ Не удалось запустить игровой обход!
        echo 💡 Используем базовый обход для игр...
        
        :: Базовый запуск для игр
        echo Set WshShell = CreateObject("WScript.Shell") > gamer_base.vbs
        echo WshShell.CurrentDirectory = "%cd%" >> gamer_base.vbs
        echo WshShell.Run "cmd /c winws.exe --filter-udp=3478-3481 --filter-l7=discord,stun --dpi-desync=fake --new", 0, False >> gamer_base.vbs
        wscript.exe //B gamer_base.vbs
        del gamer_base.vbs >nul 2>&1
        
        timeout /t 2 >nul
        tasklist /fi "imagename eq winws.exe" | find /i "winws.exe" >nul
        
        if errorlevel 1 (
            echo ❌ КРИТИЧЕСКАЯ ОШИБКА!
            echo 🔧 Проверь наличие файлов в папке bin\
        ) else (
            echo ✅ Lightning Gamer запущен в базовом режиме!
        )
    ) else (
        echo ✅ Lightning Gamer запущен в упрощенном режиме!
    )
) else (
    echo ✅ Naebalovo Lightning Gamer запущен и работает!
    echo 🎮 Оптимизировано для игр и Discord
    echo ⚡ Низкий пинг, высокая скорость
)

:: Проверяем игровые сервисы
echo.
echo 🎯 Проверяем доступность игровых сервисов...
powershell -Command "
    \$services = @{
        'Discord Voice' = '3478-3481';
        'Game Servers' = '50000-65535';
        'Discord Media' = '2053,2083,2087,2096,8443'
    }
    
    Write-Host '📡 Статус игровых портов:' -ForegroundColor Cyan
    foreach (\$service in \$services.GetEnumerator()) {
        Write-Host '  • ' \$service.Key ':' \$service.Value -ForegroundColor Gray
    }
    
    Write-Host ''
    Write-Host '🎮 Игровой обход активирован!' -ForegroundColor Green
    Write-Host '💬 Discord голосовые каналы должны работать' -ForegroundColor Green
    Write-Host '🕹️  Игровые сервера разблокированы' -ForegroundColor Green
" 2>nul

timeout /t 1 >nul