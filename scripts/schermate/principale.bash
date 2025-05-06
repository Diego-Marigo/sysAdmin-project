function schermata_principale() {
    clear
    printlines "" \
        "$(con_grassetto "====================================")" \
        "$(con_grassetto "        MENU AMMINISTRATORE")" \
        "$(con_grassetto "====================================")" \
        "1) Monitoraggio sistema" \
        "2) Gestione disco" \
        "3) Gestione pacchetti" \
        "$(con_sbarramento "4) Gestione servizi")" \
        "$(con_sbarramento "5) Gestione rete")" \
        "$(con_sbarramento "6) Gestione utenti")" \
        "$(con_sbarramento "7) Operazioni di sistema")" \
        "q) Quit" \
        "$(con_grassetto "====================================")"

    read -rp "Seleziona un modulo [1-7,q]: " principal_choice
    case $principal_choice in
    1 | monitoraggio | schermata_per_il_monitoraggio_di_sistema)
        monitoraggio
        ;;
    2 | gestione_disco | schermata_per_la_gestione_dei_dischi)
        gestione_disco
        ;;
    3 | gestione_pacchetti | schermata_per_la_gestione_dei_pacchetti)
        gestione_pacchetti
        ;;
    4 | gestione_servizi | schermata_per_la_gestione_dei_servizi)
        gestione_servizi
        ;;
    5 | gestione_rete | schermata_per_la_gestione_delle_connessioni)
        gestione_rete
        ;;
    6 | gestione_utenti | schermata_per_la_gestione_degli_utenti)
        gestione_utenti
        ;;
    7 | operazioni_di_sistema | schermata_per_il_registro_di_sistema)
        operazioni_di_sistema
        ;;
    q | Q)
        clear
        println "$(con_grassetto "====================================")"
        println "$(con_grassetto "        Uscita dal programma")"
        println "$(con_grassetto "====================================")"
        println "Grazie per aver utilizzato il nostro programma!"
        println "Speriamo di rivederti presto!"
        println ""
        println "$(come_avviso "Uscita in corso...")"
        println "===================================="
        exit 0
        ;;
    *)
        println "$(come_errore "\nOpzione non valida")"
        sleep .5
        schermata_principale
        ;;
    esac
}

