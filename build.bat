@echo off

echo ======================================================================
echo [WARNING] This .bat script is DEPRECATED and no longer maintained.
echo Please run the POSIX sh script in WSL or GNU/Linux instead.
echo ======================================================================

setlocal

where fpc >nul 2>nul || (
    echo No Free Pascal on the system >&2
    exit /b 1
)

set "CWD=%~dp0"
set "SETTING=%CWD%setting.bat"

if not exist "%SETTING%" (
    echo Error: Unable to load the repository setting: %SETTING% >&2
    exit /b 1
)

call "%SETTING%"

if not exist "%LIB_DIR%" mkdir "%LIB_DIR%"
if not exist "%OBJ_DIR%" mkdir "%OBJ_DIR%"

fpc -O2 -Xs -CX -XX ^
    "-o%BIN_DIR%%DYNAMIC_LIBRARY%" ^
    "-Fu%SRC_DIR%" ^
    "-Fi%INCLUDE_DIR%" ^
    "-FU%OBJ_DIR%" ^
    "-FE%LIB_DIR%" ^
    "%SRC_DIR%\%ENTRY%"

if %ERRORLEVEL% neq 0 (
    echo Error: Compilation failed. >&2
    exit /b %ERRORLEVEL%
)

endlocal