@echo off
chcp 65001 >nul
title Проверка автозапуска

cls
echo.
echo ================================================
echo        ПРОВЕРКА НАСТРОЙКИ АВТОЗАПУСКА
echo ================================================
echo.

echo [1] Проверка задач в Планировщике...
echo.
schtasks /query /tn "Naebalovo_Hidden_Startup" 2>nul && (
    echo ✔ Задача 'Naebalovo_Hidden_Startup' найдена
    schtasks /query /tn "Naebalovo_Hidden_Startup" /fo list | findstr "Следующее"
) || echo ❌ Задача не найдена

echo.
echo [2] Проверка файлов автозагрузки...
echo.
if exist "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\_naebalovo_hidden.vbs" (
    echo ✔ Резервный скрипт найден
) else (
    echo ❌ Резервный скрипт не найден
)

echo.
echo [3] Проверка реестра...
echo.
reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "Naebalovo" 2>nul && (
    echo ⚠ Найдена запись в реестре (не рекомендуется)
) || echo ✔ Записей в реестре нет

echo.
echo ================================================
echo.
pause