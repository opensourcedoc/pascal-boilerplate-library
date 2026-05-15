@echo off
setlocal

where fpc >nul 2>nul || (
    echo No Free Pascal on the system >&2
    exit /b 1
)

set "CWD=%~dp0"

call "%CWD%setting.bat"

if not exist "%LIB_DIR%" mkdir "%LIB_DIR%"
if not exist "%OBJ_DIR%" mkdir "%OBJ_DIR%"

fpc -O3 ^
    "-o%LIB_DIR%%DYNAMIC_LIBRARY%" ^
    "-Fu%SRC_DIR%" ^
    "-Fi%INCLUDE_DIR%" ^
    "-FU%OBJ_DIR%" ^
    "-FE%LIB_DIR%" ^
    "%SRC_DIR%%ENTRY%"

endlocal