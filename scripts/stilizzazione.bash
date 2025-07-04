#!/bin/bash

# Variabili coi codici speciali
_RESET='0m'                         # Codice per resettare lo stile
_GRASSETTO='1m'                     # Codice per il grassetto
_CHIUDI_GRASSETTO='22m'             # Codice per chiudere il grassetto
_SOTTOLINEATURA='4m'                # Codice per la sottolineatura
_CHIUDI_SOTTOLINEATURA='24m'        # Codice per chiudere la sottolineatura
_SBARRAMENTO='9m'                   # Codice per il barrato
_CHIUDI_SBARRAMENTO='29m'           # Codice per chiudere il barrato
_INFO='96m'                         # Codice per l'informazione
_SUCCESSO='92m'                     # Codice per il successo
_ERRORE='91m'                       # Codice per l'errore
_AVVISO='93m'                       # Codice per l'avviso
_CHIUDI_COLORAZIONE='39m'           # Codice per chiudere la colorazione

# Codice per risolvere i problema sui byte da stampare
_ESCAPE=$'\033[' # NON TOCCARE!!!!!!!
function print_with_bytes() {
    printf "%b" "${@}"
}

# Funzione generale a cui attingono le altre
_stilizza() {
    local apri_stile="$_ESCAPE${1}"
    local chiudi_stile="$_ESCAPE${2}"
    shift 2

    if [[ $# -gt 0 ]]; then                 # Se ho argomenti
        printf "%b\n" "${apri_stile}$*${chiudi_stile}"
    else                                    # Se leggo da pipe      
        printf "%b" "${apri_stile}"
        while IFS= read -r line; do
            printf "%b\n" "${line}"
        done
        printf "%b" "${chiudi_stile}"
    fi
}

# Funzioni pubbliche del modulo
con_grassetto() { _stilizza $_GRASSETTO $_CHIUDI_GRASSETTO "$@"; }                  # Funzione per il grassetto
con_sottolineatura() { _stilizza $_SOTTOLINEATURA $_CHIUDI_SOTTOLINEATURA "$@"; }   # Funzione per la sottolineatura
con_sbarramento() { _stilizza $_SBARRAMENTO $_CHIUDI_SBARRAMENTO "$@"; }            # Funzione per il barrato
come_info() { _stilizza $_INFO $_CHIUDI_COLORAZIONE "$@"; }                         # Funzione per l'informazione
come_successo() { _stilizza $_SUCCESSO $_CHIUDI_COLORAZIONE "$@"; }                 # Funzione per il successo
come_errore() { _stilizza $_ERRORE $_CHIUDI_COLORAZIONE "$@"; }                     # Funzione per l'errore
come_avviso() { _stilizza $_AVVISO $_CHIUDI_COLORAZIONE "$@"; }                     # Funzione per l'avviso

# Funzioni pubbliche per la stampa
function print() { printf "%s" "$*"; }          # Stampa senza newline
function println() { printf "%s\n" "$*"; }      # Stampa con newline
function printlines() {                         # Stampa ogni argomento su una nuova riga
    for line in "$@"; do
        println "${line}"
    done
}