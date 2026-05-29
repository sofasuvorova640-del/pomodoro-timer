@echo off
chcp 65001 >nul
title Сборка Помидорка Таймера
color 0A

echo ========================================
echo      ПОМИДОРКА ТАЙМЕР - СБОРКА
echo ========================================
echo.

echo [1/3] Устанавливаю PyInstaller...
pip install pyinstaller

if errorlevel 1 (
    echo Ошибка! PyInstaller не установился.
    pause
    exit
)

echo.
echo [2/3] Собираю приложение...
pyinstaller --onefile --windowed --icon=tomato_icon.ico --add-data "meme.jpg;." --add-data "tomato.png;." --add-data "tomato_icon.ico;." main.py

if errorlevel 1 (
    echo Ошибка! Не удалось собрать приложение.
    pause
    exit
)

echo.
echo [3/3] Копирую готовый файл на рабочий стол...
copy /Y dist\main.exe "%USERPROFILE%\Desktop\Помидорка.exe"

echo.
echo ========================================
echo           ГОТОВО!
echo ========================================
echo.
echo Файл Помидорка.exe лежит на рабочем столе
echo.
pause