@echo on
cd /d ..\..
.venv\Scripts\pip.exe install -r requirements.txt
timeout /t 5 /nobreak >nul
.venv\Scripts\nuitka.exe main.py --onefile --include-data-dir=shaders=shaders --output-dir=.\build\windows
pause
