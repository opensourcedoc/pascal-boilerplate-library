JOIN ()
(
    RESULT=""
    for S in "$@"; do
        RESULT="${RESULT}${RESULT:+ }${S}"
    done
    printf '%s\n' "$RESULT"
)

SMOKE_RUN ()
{
    echo "[Smoke] $(JOIN "$@")"
    "$@"
}

EXPECT_SUCCEED ()
(
    stdout_log=$(mktemp) || exit 1
    stderr_log=$(mktemp) || exit 1
    trap 'rm -f "$stdout_log" "$stderr_log"' EXIT INT TERM

    "$@" >"$stdout_log" 2>"$stderr_log"
    exit_code=$?

    if [ "$exit_code" -eq 0 ]; then
        echo "[Expect] $(JOIN "$@")"
        cat "$stdout_log"
        return 0
    else
        echo "[Fail] $(JOIN "$@")" >&2
        cat "$stderr_log" >&2
        return "$exit_code"
    fi
)

EXPECT_FAIL ()
(
    stdout_log=$(mktemp) || exit 1
    stderr_log=$(mktemp) || exit 1
    trap 'rm -f "$stdout_log" "$stderr_log"' EXIT INT TERM

    "$@" >"$stdout_log" 2>"$stderr_log"
    exit_code=$?

    if [ "$exit_code" -eq 0 ]; then
        echo "[Fail] $(JOIN "$@")" >&2
        cat "$stdout_log" >&2
        return 1
    else
        echo "[Expect] $(JOIN "$@")"
        cat "$stderr_log"
        return 0
    fi
)
