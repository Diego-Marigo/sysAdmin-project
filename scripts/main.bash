#!/bin/bash

file_dir="$(dirname "${BASH_SOURCE[0]}")"

# Librerie ausiliarie
source "${file_dir}/codice_base.bash"
source "${file_dir}/stilizzazione.bash"
source "${file_dir}/registrazioni.bash"

# Librerie delle schermate
source "${file_dir}/schermate/schermate.bash"

# Funzione di ingresso
function main() {
    while [[ $# -gt 0 ]]; do        # args = args[0] args[1] ... args[n]
        case $1 in          
        -h | --help)                # Show help
            schermata_manuale
            exit 0
            ;;
        -v | --version)             # Show version
            println "${versione}"
            exit 0
            ;;
        -r | --registro)            # Set log file
            shift
            registro="$1"
            ha_genitore_accessibile "${registro}" | exit 1
            export registro
            ;;
        -d | --debug)               # Enable debug mode
            export DEBUG=1
            ;;
        --no-color)
            export NO_COLOR=1
            ;;
        *)                          # Unrecognized argument
            ARGS+=("$1")
            println "$(come_errore "Errore:") argomento non riconosciuto: $1" >&2
            println "Usa $(come_avviso "--help") per vedere l'elenco degli argomenti disponibili." >&2
            exit 1
            ;;
        esac
        shift                      
    done
    registra_info "Avvio del programma"
    clear
    printlines "" \
        "$(con_grassetto "====================================")" \
        "$(con_grassetto "          ${nome_programma}")" \
        "$(con_grassetto "====================================")" \
        "$(con_grassetto "Versione:") ${versione}" \
        "$(con_grassetto "Autori:") ${autori}" \
        "$(con_grassetto "Descrizione:")" \
        "Programma di amministrazione per sistemi Linux." \
        "Gli autori non si assumono la responsabilità delle azioni eseguite." \
        ""\
        "$(come_avviso "Questo programma è destinato ad essere eseguito come root.")" \
        "$(con_grassetto "====================================")" \ ""
        
        if [ "$(id -u)" -eq 0 ]; then
            println "Autenticazione come root riuscita."
        else
            println "$(come_errore "Autenticazione come root non riuscita.")"
            exit 1;
        fi
    
    println "Premi un tasto per continuare..."
    read -r -n 1 
    schermata_principale
}

function _avviso_se_caricato_come_libreria() {
    printlines "Questo script è pensato per essere lanciato individualmente" \
        "$(come_avviso "Lanciare la funzione $(con_grassetto "main()") dopo averlo importato terminerà con un exit che chiuderà la sessione corrente!")"
}

se_chiamato_come_script_lanciare main "$@"                              # Lancia la funzione main se chiamato come script
se_chiamato_come_libreria_lanciare _avviso_se_caricato_come_libreria    # Lancia la funzione di avviso se chiamato come libreria