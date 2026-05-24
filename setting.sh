IS_WINDOWS ()
{
    case "$(uname -s)" in
        CYGWIN*|MINGW*|MSYS*)
            return 0
            ;;
        *)
            return 1
            ;;
    esac
}

IS_MACOS ()
{
    [ "$(uname -s)" = "Darwin" ]
}

ENTRY=Logic.pas
LIBRARY=$(echo "${ENTRY%.*}" | tr '[:upper:]' '[:lower:]')
if IS_WINDOWS; then
    DYNAMIC_LIBRARY="${LIBRARY}.dll"
elif IS_MACOS; then
    DYNAMIC_LIBRARY="lib${LIBRARY}.dylib"
else
    DYNAMIC_LIBRARY="lib${LIBRARY}.so"
fi

TEST_ENTRY=TestMain.lpr
TEST_PROGRAM=TestMain
if IS_WINDOWS; then
    TEST_EXECUTABLE="${TEST_PROGRAM}.exe"
else
    TEST_EXECUTABLE="${TEST_PROGRAM}"
fi

CWD=$(cd "$(dirname "$0")" && pwd)

SRC_DIR="${CWD}/src"
BIN_DIR="${CWD}/bin"
INCLUDE_DIR="${CWD}/include"
LIB_DIR="${CWD}/lib"
OBJ_DIR="${CWD}/obj"
TEST_DIR="${CWD}/test"