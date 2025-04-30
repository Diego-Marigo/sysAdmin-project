#!/usr/bin/env bash
# **Libreria per la stilizzazione delle stringhe**
#
# Struttura del file
# 0. Variabili coi codici speciali
# 1. Codice per risolvere i problema sui byte da stampare
# 2. Funzione generale _stilizza, a cui attingono le altre
# 3. Funzioni pubbliche del modulo
# 4. Presentazione del modulo

# 0. Variabili coi codici speciali
_RESET='0m'
#
_GRASSETTO='1m'
_CHIUDI_GRASSETTO='22m'
_SOTTOLINEATURA='4m'
_CHIUDI_SOTTOLINEATURA='24m'
_SBARRAMENTO='9m'
_CHIUDI_SBARRAMENTO='29m'
#
_INFO='96m'     # azzurro chiaro
_SUCCESSO='92m' # verde
_ERRORE='91m'   # rosso
_AVVISO='93m'   # arancione chiaro
_CHIUDI_COLORAZIONE='39m'

# 1. Codice per risolvere i problema sui byte da stampare
_ESCAPE=$'\033[' # NON TOCCARE!!!!!!!
function print_with_bytes() {
    printf "%b" "${@}"
} # NON TOCCARE!!!!!!!

# 2. Funzione generale _stilizza, a cui attingono le altre
_stilizza() {
    local apri_stile="$_ESCAPE${1}"
    local chiudi_stile="$_ESCAPE${2}"
    shift 2

    if [[ $# -gt 0 ]]; then
        # Se ho argomenti: unisco tutto in una stringa
        printf "%b\n" "${apri_stile}$*${chiudi_stile}"
    else
        # Se leggo da pipe
        printf "%b" "${apri_stile}"
        while IFS= read -r line; do
            printf "%b\n" "${line}"
        done
        printf "%b" "${chiudi_stile}"
    fi
}

# 3. Funzioni pubbliche del modulo
con_grassetto() { _stilizza $_GRASSETTO $_CHIUDI_GRASSETTO "$@"; }
con_sottolineatura() { _stilizza $_SOTTOLINEATURA $_CHIUDI_SOTTOLINEATURA "$@"; }
con_sbarramento() { _stilizza $_SBARRAMENTO $_CHIUDI_SBARRAMENTO "$@"; }

come_info() { _stilizza $_INFO $_CHIUDI_COLORAZIONE "$@"; }
come_successo() { _stilizza $_SUCCESSO $_CHIUDI_COLORAZIONE "$@"; }
come_errore() { _stilizza $_ERRORE $_CHIUDI_COLORAZIONE "$@"; }
come_avviso() { _stilizza $_AVVISO $_CHIUDI_COLORAZIONE "$@"; }

# 4. Presentazione del modulo in caso di chiamata diretta
file_dir="$(dirname "${BASH_SOURCE[0]}")"

function _presentazione_script() {
    printlines "" \
        "=================================================" \
        "  $(con_grassetto "Libreria per basilari stilizzazioni dei testi")" \
        "=================================================" \
        "" \
        "- $(con_grassetto "testo in grassetto") <- con_grassetto \"testo in grassetto\"" \
        "- $(con_sottolineatura "testo sottolineato") <- con_sottolineatura \"testo sottolineato\"" \
        "- $(con_sbarramento "testo sbarrato") <- con_sbarramento \"testo sbarrato\"" \
        "" \
        "" \
        "È possibile concatenare le 3 funzioni qui sopra:" \
        "$(con_grassetto "stili accumulati" | con_sottolineatura | con_sbarramento) <- con_grassetto \"stili accumulati\" | con_sottolineatura | con_sbarramento" \
        "" \
        "A questi si può aggiungere una chiave cromatica tra info, successo, errore e avviso" \
        "$(come_info "testo informativo") <- come_info \"testo informativo\"" \
        "$(come_successo "testo di conferma") <- come_successo \"testo di conferma\"" \
        "$(come_errore "testo d'errore") <- come_errore \"testo d'errore\"" \
        "$(come_avviso "testo d'allerta") <- come_avviso \"testo d'allerta\"" \
        "" \
        "" \
        "" \
        "" \
        "Usare $(con_sottolineatura "source /questo/file") per provare le funzionalità"
}

se_chiamato_come_script_lanciare _presentazione_script
