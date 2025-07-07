#!/usr/bin/env bash

file_dir="$(dirname "${BASH_SOURCE[0]}")"

exec "${file_dir}/scripts/main.bash" "$@"