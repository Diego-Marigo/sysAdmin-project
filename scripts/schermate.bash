# **Libreria delle schermate del programma**

file_path="$(readlink --canonicalize "${BASH_SOURCE[0]}")"
file_dir="$(dirname "${file_path}")"

source "${file_dir}/codice_base.bash"
source "${file_dir}/stampa.bash"
source "${file_dir}/stilizzazione.bash"
source "${file_dir}/registrazioni.bash"

function schermata_principale() {
    registra_info "Entrato nel top level menu"

    clear
    printlines "" \
        "$(con_grassetto "====================================")" \
        "$(con_grassetto "        MENU AMMINISTRATORE")" \
        "$(con_grassetto "====================================")" \
        "$(con_sbarramento "1) Monitoraggio sistema")" \
        "$(con_sbarramento "2) Gestione disco")" \
        "$(con_sbarramento "3) Gestione pacchetti")" \
        "$(con_sbarramento "4) Gestione servizi")" \
        "$(con_sbarramento "5) Gestione rete")" \
        "$(con_sbarramento "6) Gestione utenti")" \
        "$(con_sbarramento "7) Operazioni di sistema")" \
        "q) Quit" \
        "$(con_grassetto "====================================")"

    read -rp "Seleziona un modulo [1-7,q]: " choice
    case $choice in
    # 1) schermata_per_il_monitoraggio_di_sistema ;;
    # 2) schermata_per_la_gestione_dei_dischi ;;
    # 3) schermata_per_la_gestione_dei_pacchetti ;;
    # 4) schermata_per_la_gestione_dei_servizi ;;
    # 5) schermata_per_la_gestione_delle_connessioni ;;
    # 6) schermata_per_la_gestione_degli_utenti ;;
    # 7) schermata_per_il_registro_di_sistema ;;
    q | Q)
        println "Chiusura menù"
        exit 0
        ;;
    *)
        println "$(come_errore "\nOpzione non valida")"
        sleep .5
        schermata_principale
        ;;
    esac
}

function schermata_di_presentazione() {
    printlines "menù help per il programma ${nome_programma_sysadmin} <DA RIFARE!!>" \
        "" \
        ""
}

function schermata_per_il_manuale() {
    printlines \
        "" \
        "$(con_grassetto "Usage:") $0 [OPZIONI]" \
        "" \
        "$(con_grassetto "-h, --help")        $(con_sottolineatura "Mostra questo messaggio e esce")" \
        "$(con_grassetto "-v, --version")     $(con_sottolineatura "Stampa la versione e esce")" \
        "$(con_grassetto "-r, --registro")     $(con_sottolineatura "<file>")   $(con_sottolineatura "Override del percorso del log (default: ${registro})")" \
        "$(con_grassetto "-d, --debug")       $(con_sottolineatura "Attiva DEBUG=1 per tutta la durata")" \
        "$(con_grassetto "--no-color")        $(con_sottolineatura "Disabilita colori/stilizzazioni nello script")" \
        ""
    exit 0
}
