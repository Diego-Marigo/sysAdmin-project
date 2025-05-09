function schermata_principale() {
    clear
    printlines "" \
        "$(con_grassetto "====================================")" \
        "$(con_grassetto "        MENU AMMINISTRATORE")" \
        "$(con_grassetto "====================================")" \
        "1) Monitoraggio sistema" \
        "2) Gestione disco" \
        "3) Gestione pacchetti" \
        "4) Gestione servizi" \
        "5) Gestione rete" \
        "6) Gestione utenti" \
        "7) Operazioni di sistema" \
        "8) Visualizza log del programma" \
        "q) Quit" \
        "$(con_grassetto "====================================")"

    read -rp "Seleziona un'opzione [1-8,q]: " principal_choice
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
    8 | visualizza_log_del_programma | schermata_per_la_visualizzazione_dei_log)
        clear
        println "$(con_grassetto "====================================")"
        println "$(con_grassetto "        VISUALIZZA LOG")"
        println "$(con_grassetto "====================================")"
        println "$(come_avviso "Visualizzazione del registro...")"
        println ""
        apri_registro
        println ""
        println "$(con_grassetto "====================================")"
        read -n 1 -s -r -p "Premi un tasto per continuare..."
        println ""
        schermata_principale
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