function gestione_pacchetti(){
    clear
    printlines "" \
        "$(con_grassetto "====================================")" \
        "$(con_grassetto "        GESTIONE PACCHETTI")" \
        "$(con_grassetto "====================================")" \
        "1) Installa pacchetto" \
        "2) Rimuovi pacchetto" \
        "3) Aggiorna pacchetti" \
        "4) Elenco pacchetti installati" \
        "q) Quit" \
        "$(con_grassetto "====================================")"

    read -rp "Seleziona un modulo [1-7,q]: " package_choice
    case $package_choice in
    1 | installa_pacchetto)
        clear
        printlines "" \
            "$(con_grassetto "====================================")" \
            "$(con_grassetto "        INSTALLA PACCHETTO")" \
            "$(con_grassetto "====================================")"
        read -rp "Inserisci il nome del pacchetto da installare: " pacchetto
                
        registra_info "Installa pacchetto $pacchetto"
        apt install "$pacchetto"

        sleep 1
        printlines "$(con_grassetto "====================================")" \
        ;;
    2 | rimuovi_pacchetto)
        clear
        printlines "" \
            "$(con_grassetto "====================================")" \
            "$(con_grassetto "        RIMUOVI PACCHETTO")" \
            "$(con_grassetto "====================================")"
        read -rp "Inserisci il nome del pacchetto da rimuovere: " pacchetto

        registra_info "Rimuovi pacchetto $pacchetto"
        apt remove "$pacchetto"

        sleep 1
        printlines "$(con_grassetto "====================================")" \
        ;;
    3 | aggiorna_pacchetti)
        clear
        printlines "" \
            "$(con_grassetto "====================================")" \
            "$(con_grassetto "        AGGIORNA PACCHETTI")" \
            "$(con_grassetto "====================================")"

        registra_info "Aggiorna pacchetti"
        apt update
        apt upgrade -y

        sleep 1
        printlines "$(con_grassetto "====================================")" \
        ;;
    4 | elenco_pacchetti)
        clear
        printlines "" \
            "$(con_grassetto "====================================")" \
            "$(con_grassetto "        ELENCO PACCHETTI INSTALLATI")" \
            "$(con_grassetto "====================================")"
        
        registra_info "Elenco pacchetti installati"
        dpkg --get-selections | grep -v deinstall

        sleep 1
        printlines "$(con_grassetto "====================================")" \
        ;;
    q | Q)
        schermata_principale
        ;;
    *)
        println "$(come_errore "\nOpzione non valida")"
        sleep .5
        gestione_pacchetti
        ;;
    esac
}