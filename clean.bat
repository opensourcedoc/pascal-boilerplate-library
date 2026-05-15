@echo off
setlocal

set "CWD=%~dp0"

call "%CWD%setting.bat"

if exist "%BIN_DIR%" rd /S /Q "%BIN_DIR%"
if exist "%LIB_DIR%" rd /S /Q "%LIB_DIR%"
if exist "%OBJ_DIR%" rd /S /Q "%OBJ_DIR%"

mkdir "%BIN_DIR%"
mkdir "%LIB_DIR%"
mkdir "%OBJ_DIR%"

endlocal