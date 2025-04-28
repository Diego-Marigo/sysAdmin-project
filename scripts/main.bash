#!/usr/bin/env bash
# File di ingresso del programma

file_path="$(readlink --canonicalize "${BASH_SOURCE[0]}")"
file_dir="$(dirname "${file_path}")"

source "${file_dir}/codice_base.bash"
source "${file_dir}/stampa.bash"
source "${file_dir}/stilizzazione.bash"
source "${file_dir}/registrazioni.bash"
source "${file_dir}/schermate.bash"

# Funzione di ingresso
function main() {
    # Processione degli argomenti
    while [[ $# -gt 0 ]]; do # while len(args) > 0:
        case $1 in           #     match args[0]
        -h | --help)
            schermata_del_manuale
            ;;
        -v | --version)
            println "${versione}"
            exit 0
            ;;
        -r | --registro)
            shift
            registro="$1"
            ha_genitore_accessibile "${registro}" | exit 1
            export registro
            ;;
        -d | --debug)
            export DEBUG=1
            ;;
        --no-color)
            export NO_COLOR=1
            ;;
        *)
            # argomento non riconosciuto???
            ARGS+=("$1")
            #!Aggiungi un avviso che mostri l'argomento sbagliato ed esxi
            ;;
        esac
        shift # args = args[1:]
    done
    schermata_principale
}

function _avviso_se_caricato_come_libreria() {
    printlines "Questo script è pensato per essere lanciato individualmente" \
        "$(come_avviso "Lanciare la funzione $(con_grassetto "main()") dopo averlo importato terminerà con un exit che chiuderà la sessione corrente!")"
}

se_chiamato_come_script_lanciare main "$@"
se_chiamato_come_libreria_lanciare _avviso_se_caricato_come_libreria
