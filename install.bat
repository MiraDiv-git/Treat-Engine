@echo off
chcp 65001 >nul
setlocal EnableDelayedExpansion

echo.
echo =====================================
echo     Installation of Treat Engine
echo =====================================
echo.

rem 1. Check for Python
echo [INFO] Checking for Python 3.13.3...

set "PYTHON_CMD="
set "PYTHON_FOUND=0"

rem Check python command
python --version >nul 2>&1
if !errorlevel! == 0 (
    for /f "tokens=2" %%i in ('python --version 2^>^&1') do (
        if "%%i"=="3.13.3" (
            set "PYTHON_CMD=python"
            set "PYTHON_FOUND=1"
            echo [INFO] Found Python 3.13.3: python
        ) else (
            echo [WARNING] Found Python %%i, but version 3.13.3 needed
        )
    )
)

rem Check py command
if !PYTHON_FOUND! == 0 (
    py -3.13 --version >nul 2>&1
    if !errorlevel! == 0 (
        for /f "tokens=2" %%i in ('py -3.13 --version 2^>^&1') do (
            if "%%i"=="3.13.3" (
                set "PYTHON_CMD=py -3.13"
                set "PYTHON_FOUND=1"
                echo [INFO] Found Python 3.13.3: py -3.13
            )
        )
    )
)

rem Python not found
if !PYTHON_FOUND! == 0 (
    echo.
    echo [ERROR] Can't find Python 3.13.3.
    echo [INFO] Opening the Python Download Webpage...
    echo.
    pause
    start https://www.python.org/downloads/release/python-3133/
    echo [ERROR] Re-run this script after installation
    pause
    exit /b 1
)

echo [INFO] Python 3.13.3 was found
echo.

rem 2. venv
echo [INFO] Creating virtual environment

if exist ".venv" (
    echo [WARNING] Folder '/.venv' already exists. Recreating the folder...
    rmdir /s /q .venv
)

!PYTHON_CMD! -m venv .venv

if not exist ".venv" (
    echo [ERROR] Virtual environment creation failed.
    pause
    exit /b 1
)

echo [INFO] Virtual environment was created successfully.
echo.

rem 3. Активация виртуального окружения
echo [INFO] Activating virtual environment...

if not exist ".venv\Scripts\activate.bat" (
    echo [ERROR] Can't find virtual environment activation file
    pause
    exit /b 1
)

call .venv\Scripts\activate.bat

echo [INFO] Virtual environment activated.
echo.

rem 4. Установка зависимостей из requirements.txt
echo [INFO] Installing the requirements...

if not exist "requirements.txt" (
    echo [ERROR] Can't find requirements.txt.
    pause
    exit /b 1
)

python -m pip install --upgrade pip
if !errorlevel! neq 0 (
    echo [ERROR] Failed updating pip
    pause
    exit /b 1
)

python -m pip install -r requirements.txt
if !errorlevel! neq 0 (
    echo [ERROR] Error while installing requirements.
    pause
    exit /b 1
)

echo [INFO] Requirements satisfied successfully.
echo.

rem 5. Запуск main.py
echo [INFO] Starting main.py...

if not exist "main.py" (
    echo [ERROR] Can't find main.py
    pause
    exit /b 1
)

python main.py

echo.
echo [INFO] Installation finished
pause
