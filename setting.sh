#!/bin/sh

ENTRY=Logic.pas
LIBRARY=logic
if [ "$(uname -s)" = "Darwin" ]; then
    DYNAMIC_LIBRARY="lib${LIBRARY}.dylib"
else
    DYNAMIC_LIBRARY="lib${LIBRARY}.so"
fi

TEST_ENTRY=TestMain.lpr
TEST_PROGRAM=TestMain
TEST_EXECUTABLE="${TEST_PROGRAM}"

CWD=$(cd "$(dirname "$0")" && pwd)

SRC_DIR="${CWD}/src"
BIN_DIR="${CWD}/bin"
INCLUDE_DIR="${CWD}/include"
LIB_DIR="${CWD}/lib"
OBJ_DIR="${CWD}/obj"
TEST_DIR="${CWD}/test"