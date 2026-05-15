@echo off

set ENTRY=Logic.pas
set LIBRARY=logic
set DYNAMIC_LIBRARY=%LIBRARY%.dll

set TEST_ENTRY=TestMain.lpr
set TEST_PROGRAM=TestMain
set TEST_EXECUTABLE="%TEST_PROGRAM%.exe"

set "CWD=%~dp0"
if "%CWD:~-1%"=="\" set "CWD=%CWD:~0,-1%"

set "SRC_DIR=%CWD%\src\"
set "BIN_DIR=%CWD%\bin\"
set "INCLUDE_DIR=%CWD%\include\"
set "LIB_DIR=%CWD%\lib\"
set "OBJ_DIR=%CWD%\obj\"
set "TEST_DIR=%CWD%\test\"