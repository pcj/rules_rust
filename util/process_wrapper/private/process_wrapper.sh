#!/bin/sh

set -eu

# Skip the first argument which is expected to be `--`
shift

n=$#
i=0
while [ $i -lt $n ]; do
    arg="$1"
    shift
    # Check if the argument contains "${PWD}" and replace it with the actual value of PWD
    case "${arg}" in
        *'${pwd}'*)
            arg="$(printf '%s' "${arg}" | sed "s|\${pwd}|${PWD}|g")"
            ;;
    esac
    set -- "$@" "${arg}"
    i=$((i + 1))
done

exec "$@"
