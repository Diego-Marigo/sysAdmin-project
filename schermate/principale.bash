function schermata_principale() {
    while true; do
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
            "7) Visualizza log di sistema" \
            "8) Operazioni di sessione" \
            "9) Visualizza log del programma" \
            "q) Quit" \
            "$(con_grassetto "====================================")"

        read -rp "Seleziona un'opzione [1-9,q]: " voce_scelta
        case $voce_scelta in
        1) monitoraggio ;;
        2) gestione_disco ;;
        3) gestione_pacchetti ;;
        4) gestione_servizi ;;
        5) gestione_rete ;;
        6) gestione_utenti ;;
        7) operazioni_log ;;
        8) operazioni_sessione ;;
        9)
            clear
            printlines \
                "$(con_grassetto "====================================")" \
                "$(con_grassetto "        LOG DEL PROGRAMMA")" \
                "$(con_grassetto "====================================")" \
                "$(come_avviso "Visualizzazione del registro...")" \
                ""
            apri_registro
            println ""
            println "$(con_grassetto "====================================")"
            read -n 1 -s -r -p "Premi invio per continuare..."
            println ""
            schermata_principale
            ;;
        q | Q)
            clear
            printlines \
                "$(con_grassetto "====================================")" \
                "$(con_grassetto "        Uscita dal programma")" \
                "$(con_grassetto "====================================")" \
                "Grazie per aver utilizzato il nostro programma!" \
                "Speriamo di rivederti presto!" \
                "===================================="
            print "$(come_avviso "Uscita in corso.")"
            sleep .3
            print "$(come_avviso ".")"
            sleep .3
            println "$(come_avviso ".")"
            exit 0
            ;;
        *)
            println "$(come_errore "\nOpzione non valida")"
            sleep .5
            ;;
        esac
    done
}
