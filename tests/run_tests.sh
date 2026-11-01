#!/usr/bin/env bash
# Task 3 tests for legacy_log_parser_fixed. Run from hw3/.
BIN=./legacy_log_parser_fixed
T=tests/data; mkdir -p "$T" markers; rm -f markers/ret2win.txt
pass=0; fail=0
check() { # name expected_exit file
  out=$("$BIN" "$3" 2>&1); rc=$?
  if [ "$rc" -eq "$2" ]; then echo "PASS  $1 (exit $rc)"; pass=$((pass+1))
  else echo "FAIL  $1 (exit $rc, expected $2)"; fail=$((fail+1)); fi
  echo "      > $out"
}
printf 'INFO boot ok\n'            > "$T/short.log"
head -c 128 /dev/zero | tr '\0' 'B' > "$T/max.log"
head -c 129 /dev/zero | tr '\0' 'C' > "$T/over.log"
python3 src/make_payload.py >/dev/null && mv payload.bin "$T/payload.bin"

check "valid short input"      0 "$T/short.log"
check "exactly 128 bytes"      0 "$T/max.log"
check "129 bytes (1 over)"     2 "$T/over.log"
check "missing file"           1 "$T/does_not_exist.log"
check "original exploit"       2 "$T/payload.bin"
if [ -e markers/ret2win.txt ]; then echo "FAIL  marker was created"; fail=$((fail+1))
else echo "PASS  no markers/ret2win.txt created"; pass=$((pass+1)); fi
echo "== $pass passed, $fail failed =="
