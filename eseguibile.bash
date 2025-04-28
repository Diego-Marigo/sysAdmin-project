#!/usr/bin/env bash

file_dir="$(dirname "${BASH_SOURCE[0]}")"

# Questa linea chiama l'esatto file di ingresso, inoltrando tutti gli argomenti
exec "${file_dir}/scripts/main.bash" "$@"
