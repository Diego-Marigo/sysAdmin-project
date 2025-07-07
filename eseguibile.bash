#!/usr/bin/env bash

file_dir="$(dirname "${BASH_SOURCE[0]}")"

echo "${file_dir}/scripts/main.bash"

exec "${file_dir}/scripts/main.bash" "$@"

