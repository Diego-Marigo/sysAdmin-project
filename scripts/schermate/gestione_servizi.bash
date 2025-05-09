
function gestione_servizi(){
    clear
    printlines "" \
        "$(con_grassetto "====================================")" \
        "$(con_grassetto "        GESTIONE SERVIZI")" \
        "$(con_grassetto "====================================")" \
        "1) Avvia servizio" \
        "2) Ferma servizio" \
        "3) Riavvia servizio" \
        "4) Elenco servizi attivi" \
        "q) Back" \
        "$(con_grassetto "====================================")"

    read -rp "Seleziona un'opzione [1-4,q]: " service_choice
    case $service_choice in
    1 | avvia_servizio)
        clear
        printlines "" \
            "$(con_grassetto "====================================")" \
            "$(con_grassetto "        AVVIA SERVIZIO")" \
            "$(con_grassetto "====================================")"
        read -rp "Inserisci il nome del servizio da avviare: " nome_servizio
        sudo systemctl start "$nome_servizio"
        registra_info "Avvia servizio $nome_servizio"
        println "$(come_successo "Servizio $nome_servizio avviato.")"
        sleep 1
        printlines "$(con_grassetto "====================================")"
        ;;
    2 | ferma_servizio)
        clear
        printlines "" \
            "$(con_grassetto "====================================")" \
            "$(con_grassetto "        FERMA SERVIZIO")" \
            "$(con_grassetto "====================================")"
        read -rp "Inserisci il nome del servizio da fermare: " nome_servizio
        sudo systemctl stop "$nome_servizio"
        registra_info "Ferma servizio $nome_servizio"
        println "$(come_successo "Servizio $nome_servizio fermato.")"
        sleep 1
        printlines "$(con_grassetto "====================================")"
        ;;
    3 | riavvia_servizio)
        clear
        printlines "" \
            "$(con_grassetto "====================================")" \
            "$(con_grassetto "        RIAVVIA SERVIZIO")" \
            "$(con_grassetto "====================================")"
        read -rp "Inserisci il nome del servizio da riavviare: " nome_servizio
        sudo systemctl restart "$nome_servizio"
        registra_info "Riavvia servizio $nome_servizio"
        println "$(come_successo "Servizio $nome_servizio riavviato.")"
        sleep 1
        printlines "$(con_grassetto "====================================")"
        ;;
    4 | elenco_servizi)
        clear
        printlines "" \
            "$(con_grassetto "====================================")" \
            "$(con_grassetto "        ELENCO SERVIZI ATTIVI")" \
            "$(con_grassetto "====================================")"
        systemctl list-units --type=service --state=running
        registra_info "Elenco servizi attivi"
        sleep 1
        printlines "$(con_grassetto "====================================")"
        ;;
    q | Q)
        schermata_principale
        ;;
    *)
        println "$(come_errore "\nOpzione non valida")"
        sleep .5
        gestione_servizi
        ;;
    esac
    read -rp "Premi un tasto per tornare indietro..."
    gestione_servizi
}