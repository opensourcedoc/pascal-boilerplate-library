@echo off
setlocal

where fpc >nul 2>nul || (
    echo No Free Pascal on the system >&2
    exit /b 1
)

set "CWD=%~dp0"

call "%CWD%setting.bat"

if not exist "%BIN_DIR%" mkdir "%BIN_DIR%"
if not exist "%OBJ_DIR%" mkdir "%OBJ_DIR%"

if not exist "%LIB_DIR%%DYNAMIC_LIBRARY%" (
    echo Dynamic library not compiled: %LIB_DIR%%DYNAMIC_LIBRARY% >&2
    exit /b 1
)

copy "%LIB_DIR%%DYNAMIC_LIBRARY%" "%BIN_DIR%"

fpc -O3 ^
    "-o%BIN_DIR%%TEST_EXECUTABLE%" ^
    "-Fu%TEST_DIR%" ^
    "-Fi%INCLUDE_DIR%" ^
    "-FU%OBJ_DIR%" ^
    "-FE%BIN_DIR%" ^
    "%TEST_DIR%%TEST_ENTRY%"

if not exist %BIN_DIR%%TEST_EXECUTABLE%" (
    echo Test program not compiled: %BIN_DIR%%TEST_EXECUTABLE%" >&2
    exit /b 1
)

%BIN_DIR%%TEST_EXECUTABLE%"

endlocal