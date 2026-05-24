@echo off

echo ======================================================================
echo [WARNING] This .bat script is DEPRECATED and no longer maintained.
echo Please run the POSIX sh script in WSL or GNU/Linux instead.
echo ======================================================================

setlocal

set "CWD=%~dp0"
set "SETTING=%CWD%setting.bat"

if not exist "%SETTING%" (
    echo Error: Unable to load the repository setting: %SETTING% >&2
    exit /b 1
)

call "%SETTING%"

if exist "%BIN_DIR%" (
    rd /S /Q "%BIN_DIR%"
    if %ERRORLEVEL% neq 0 ( echo Error: Failed to remove BIN_DIR >&2 & exit /b 1 )
)
if exist "%LIB_DIR%" (
    rd /S /Q "%LIB_DIR%"
    if %ERRORLEVEL% neq 0 ( echo Error: Failed to remove OBJ_DIR >&2 & exit /b 1 )
)
if exist "%OBJ_DIR%" (
    rd /S /Q "%OBJ_DIR%"
    if %ERRORLEVEL% neq 0 ( echo Error: Failed to remove OBJ_DIR >&2 & exit /b 1 )
)

mkdir "%BIN_DIR%"
mkdir "%LIB_DIR%"
mkdir "%OBJ_DIR%"

endlocal