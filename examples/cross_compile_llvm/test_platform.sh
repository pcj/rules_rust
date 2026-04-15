#!/bin/sh

set -eu

if [ $# -ne 2 ]; then
    echo >&2 "Usage: $0 /path/to/binary file-output"
    exit 1
fi

binary="$1"
want_file_output="$2"

out="$(file -L "${binary}")"

case "${out}" in
    *"${want_file_output}"*) ;;
    *)
        echo >&2 "Wrong file type: ${out}"
        exit 1
        ;;
esac
