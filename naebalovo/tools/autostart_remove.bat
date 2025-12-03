@echo off
setlocal enabledelayedexpansion
chcp 65001 >nul
title Удаление автозапуска Naebalovo

:: Проверяем права администратора
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Требуются права администратора!
    echo Запустите этот скрипт от имени администратора.
    echo.
    pause
    exit /b 1
)

cls
echo ========================================
echo    УДАЛЕНИЕ АВТОЗАПУСКА NAEЬALOVO
echo ========================================
echo.
echo [1/3] Удаление задач из Планировщика...
schtasks /delete /tn "Naebalovo" /f 2>nul
schtasks /delete /tn "Naebalovo_Hidden_Startup" /f 2>nul
schtasks /delete /tn "Naebalovo_Autorun" /f 2>nul
echo ✔ Задачи удалены

echo [2/3] Удаление резервных скриптов...
del "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\naebalovo.vbs" 2>nul
del "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\_naebalovo_hidden.vbs" 2>nul
del "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\naebalovo*.vbs" 2>nul
del "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\naebalovo*.bat" 2>nul
echo ✔ Скрипты удалены

echo [3/3] Очистка реестра...
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "Naebalovo" /f 2>nul
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" /v "Naebalovo" /f 2>nul
echo ✔ Реестр очищен

:: Создаем лог удаления
set "LOG_FILE=%~dp0..\autostart_removed.log"
(
echo ========================================
echo АВТОЗАПУСК УДАЛЕН: %date% %time%
echo ========================================
echo Удаленные задачи:
echo - Naebalovo
echo - Naebalovo_Hidden_Startup
echo - Naebalovo_Autorun
echo.
echo Удаленные файлы:
echo - naebalovo.vbs
echo - _naebalovo_hidden.vbs
echo.
echo Очищенный реестр:
echo - HKCU\...\Run\Naebalovo
echo - HKLM\...\Run\Naebalovo
echo ========================================
) > "%LOG_FILE%"

cls
echo ========================================
echo    АВТОЗАПУСК УСПЕШНО УДАЛЕН!
echo ========================================
echo.
echo ✅ Все компоненты автозапуска удалены:
echo.
echo ✔ Задачи Планировщика
echo ✔ Файлы автозагрузки
echo ✔ Записи реестра
echo.
echo ⚠ Naebalovo больше не будет запускаться
echo    автоматически при включении ПК.
echo.
echo 📝 Лог сохранен в: autostart_removed.log
echo ========================================
echo.
pause