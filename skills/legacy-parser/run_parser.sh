#! /bin/bash

set -euo pipefail

HW3_DIR="$HOME/CSCE-465-HW3"
INBOX="$HW3_DIR/inbox"
PARSER="$HW3_DIR/legacy_log_parser"

# only accept 1 pos var
if [ "$#" -ne 1 ]; then
        echo "ERR: Too many arguments"
        exit 1
fi 

target="$(readlink -f -- "$1" || true)"
inbox_real="$(readlink -f -- "$INBOX")"

case "$target" in
    "$inbox_real"/*) ;;                                  # inside inbox: allowed
    *) echo "refused: '$1' is not under $INBOX" >&2; exit 1 ;;
esac

[ -f "$target" ] || { echo "no such file: $target" >&2; exit 1; }

# cd so the parsers relative markers/ret2win.txt resolves
cd "$HW3_DIR"
exec "$PARSER" "$target"