#!/usr/bin/env bash
cd ../..
./.venv/bin/pip install -r requirements.txt
sleep 5
./.venv/bin/nuitka main.py --onefile --include-data-dir=shaders=shaders --output-dir=./build/unix
