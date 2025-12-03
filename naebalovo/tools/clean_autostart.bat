@echo off
chcp 65001 >nul
title Очистка старого автозапуска NAEBALOVO
echo ========================================
echo ПОЛНАЯ ОЧИСТКА СТАРОГО АВТОЗАПУСКА
echo ========================================
echo.

:: 1. Удаляем ВСЕ задачи Планировщика
echo [1] Удаляем задачи Планировщика...
schtasks /delete /tn "Naebalovo*" /f >nul 2>&1
schtasks /delete /tn "NAEBALOVO*" /f >nul 2>&1

:: 2. Удаляем ВСЕ VBS из автозагрузки
echo [2] Удаляем VBS из автозагрузки...
del "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\*naebalovo*.vbs" >nul 2>&1
del "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\naebalovo.*" >nul 2>&1

:: 3. Удаляем из реестра
echo [3] Очищаем реестр...
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "Naebalovo" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "Naebalovo" /f >nul 2>&1

:: 4. Удаляем временные VBS
echo [4] Удаляем временные VBS...
del "%TEMP%\*naebalovo*.vbs" >nul 2>&1
del "%TEMP%\*naebalovo_hidden*" >nul 2>&1

:: 5. Сохраняем конфиг если он есть
if exist "%~dp0..\tools\autostart_config.txt" (
    echo 📄 Сохранен конфиг автозапуска для переустановки
)

echo.
echo ✅ СТАРЫЙ АВТОЗАПУСК ПОЛНОСТЬЮ ОЧИЩЕН!
echo.
echo Теперь настрой автозапуск заново через главное меню.
echo.
pause