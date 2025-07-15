#!/usr/bin/env bash

source_or_stop() {
    local path="$1"
    if ! source "$path"; then
        println "$(come_errore "Errore durante il caricamento di: $path")"
        exit 1
    fi
}

file_dir="$(dirname "${BASH_SOURCE[0]}")"

# Librerie ausiliarie
source_or_stop "${file_dir}/codice_base.bash"
source_or_stop "${file_dir}/stilizzazione.bash"
source_or_stop "${file_dir}/registrazioni.bash"

# Librerie delle schermate
source_or_stop "${file_dir}/../schermate/schermate.bash"

function main() {
    # Processione degli argomenti
    while [[ $# -gt 0 ]]; do # while len(args) > 0:
        case $1 in 
        -c | --check)
            printlines "" \
                "$(con_grassetto "========================================")" \
                "$(con_grassetto "          Controllo Requisiti")" \
                "$(con_grassetto "========================================")" \
                "$(come_avviso "Controllo dei requisiti di sistema in corso...")" \
                ""

            if [[ -f /etc/debian_version ]]; then
                println "Sistema operativo Debian/Ubuntu rilevato."
            else
                println "$(come_errore "Questo programma è destinato a sistemi Debian/Ubuntu.")"
            fi
            if [[ "$(id -u)" -eq 0 ]]; then
                println "Autenticazione come root riuscita."
            else
                println "$(come_errore "Autenticazione come root non riuscita.")"
            fi

            requisiti fdisk check
            requisiti mkfs check
            requisiti fsck check
            requisiti rsync check
            requisiti apt check
            requisiti ip check
            requisiti systemctl check
            requisiti iftop check
            requisiti ifconfig check
            requisiti ufw check
            requisiti ping check
            requisiti useradd check
            requisiti usermod check
            requisiti chpasswd check
            requisiti userdel check
            requisiti chage check
            requisiti top check
            requisiti free check
            requisiti df check
            requisiti netstat check
            requisiti systemctl check
            requisiti who check
            requisiti journalctl check
            requisiti tail check
            requisiti loginctl check
            println "$(con_grassetto "========================================")"
            exit 0
            ;;
        -h | --help)
            schermata_manuale
            exit 0
            ;;
        --no-color)
            export NO_COLOR=1
            ;;
        -r | --register)
            shift
            registro="$1"
            ha_genitore_accessibile "${registro}" || exit 1
            export registro
            ;;
        -v | --version)
            println "$(con_grassetto "Versione:") ${versione}"
            println "$(con_grassetto "Autori:") ${autori}"
            exit 0
            ;;
        *)
            ARGS+=("$1")
            println "$(come_errore "Errore:") argomento non riconosciuto: $1" >&2
            println "Usa $(come_avviso "--help") per vedere l'elenco degli argomenti disponibili." >&2
            exit 1
            ;;
        esac
        shift # args = args[1:]
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
        "" \
        "$(come_avviso "Questo programma è destinato ad essere eseguito come root.")" \
        "$(con_grassetto "====================================")" \ ""

    # Controllo dei requisiti di sistema
    # - programma avviato come root
    # - sistema operativo Linux Ubuntu/Debian
    if [ "$(id -u)" -eq 0 ]; then
        println "Autenticazione come root riuscita."
    else
        println "$(come_errore "Autenticazione come root non riuscita.")"
        exit 1
    fi
    if [[ -f /etc/debian_version ]]; then
        println "Sistema operativo Debian/Ubuntu rilevato."
    else
        println "$(come_errore "Questo programma è destinato a sistemi Debian/Ubuntu.")"
        exit 1
    fi

    println ""
    read -rp "Premi INVIO per continuare..."
    schermata_principale
}

function _avviso_se_caricato_come_libreria() {
    printlines "Questo script è pensato per essere lanciato individualmente" \
        "$(come_avviso "Lanciare la funzione $(con_grassetto "main()") dopo averlo importato terminerà con un exit che chiuderà la sessione corrente!")"
}

se_chiamato_come_script_lanciare main "$@"
se_chiamato_come_libreria_lanciare _avviso_se_caricato_come_libreria
