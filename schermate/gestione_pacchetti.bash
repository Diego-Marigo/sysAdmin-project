function gestione_pacchetti(){
    while true; do

        clear
        printlines "" \
            "$(con_grassetto "====================================")" \
            "$(con_grassetto "        GESTIONE PACCHETTI")" \
            "$(con_grassetto "====================================")" \
            "1) Installa pacchetto" \
            "2) Rimuovi pacchetto" \
            "3) Aggiorna pacchetti" \
            "4) Elenco pacchetti installati" \
            "q) Back" \
            "$(con_grassetto "====================================")"

        read -rp "Seleziona un'opzione [1-4,q]: " package_choice
        case $package_choice in
        1 | installa_pacchetto)
            clear
            printlines "" \
                "$(con_grassetto "====================================")" \
                "$(con_grassetto "        INSTALLA PACCHETTO")" \
                "$(con_grassetto "====================================")"
            read -rp "Inserisci il nome del pacchetto da installare: " pacchetto
                    
            registra_info "Installa pacchetto $pacchetto"
            sudo apt install "$pacchetto"

            sleep 1
            printlines "$(con_grassetto "====================================")" \
            ;;
        2 | rimuovi_pacchetto_con_dipendenze)
            clear
            printlines "" \
                "$(con_grassetto "====================================")" \
                "$(con_grassetto "        RIMUOVI PACCHETTO")" \
                "$(con_grassetto "====================================")"
            read -rp "Inserisci il nome del pacchetto da rimuovere: " pacchetto 
            read -rp "Vuoi rimuovere anche le dipendenze? (s/n): " risposta
            if [[ $risposta == "s" ]]; then
                registra_info "Rimuovi pacchetto $pacchetto e le sue dipendenze"
                sudo apt remove --purge "$pacchetto" && sudo apt autoremove -y
            else
                registra_info "Rimuovi pacchetto $pacchetto"
                sudo apt remove "$pacchetto"
            fi

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
            sudo apt update && sudo apt upgrade -y

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
            sudo apt list --installed

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
        read -rp "Premi INVIO per tornare indietro..."
    done
}