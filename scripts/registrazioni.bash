#!/bin/bash

# Setup
if [[ -z "${registro}" ]]; then                 # Se il registro non è definito, allora usa il valore di default
    file_dir="$(dirname "${BASH_SOURCE[0]}")"
    registro="${file_dir}/log.txt"
fi

unalias date 2>/dev/null                        # Rimuovo l'alias di date, se esiste, per evitare problemi con il timestamp
function _timestamp() { date "+%T";  }          # Funzione per ottenere il timestamp in formato HH:MM:SS
touch "${registro}"                             # Crea il file di registro se non esiste 

# Funzioni di registrazione
function registra_info() { printf "%s [INFO]  %s\n" "$(_timestamp)" "$*" >>"${registro}"; }
function registra_avviso() { printf "%s [WARN]  %s\n" "$(_timestamp)" "$*" >>"${registro}"; }
function registra_errore() { printf "%s [ERROR] %s\n" "$(_timestamp)" "$*" >>"${registro}"; }
function registra_debug() { printf "%s [DEBUG] %s\n" "$(_timestamp)" "$*" >>"${registro}"; }

# Funzione di lettura
function apri_registro() { cat "${registro}" ;}
