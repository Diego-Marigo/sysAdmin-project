function gestione_rete(){
    clear
    printlines "" \
        "$(con_grassetto "====================================")" \
        "$(con_grassetto "        GESTIONE RETE")" \
        "$(con_grassetto "====================================")" \
        "1) Visualizza configurazione di rete" \
        "2) Modifica configurazione di rete" \
        "3) Visualizza stato della rete" \
        "4) Modifica stato della rete" \
        "5) Visualizza statistiche di rete" \
        "6) Modifica statistiche di rete" \
        "7) Gestione firewall" \
        "8) Test di connessione" \
        "q) Back" \
        "$(con_grassetto "====================================")"
        
    read -rp "Seleziona un'opzione [1-8,q]: " network_choice
    case $network_choice in
    1 | visualizza_configurazione_di_rete)
        clear
        printlines "" \
            "$(con_grassetto "====================================")" \
            "$(con_grassetto "        VISUALIZZA CONFIGURAZIONE RETE")" \
            "$(con_grassetto "====================================")"
        sudo ip addr show
        registra_info "Visualizza configurazione di rete"
        sleep 1
        printlines "$(con_grassetto "====================================")"
        ;;
    2 | modifica_configurazione_di_rete)
        clear
        printlines "" \
            "$(con_grassetto "====================================")" \
            "$(con_grassetto "        MODIFICA CONFIGURAZIONE RETE")" \
            "$(con_grassetto "====================================")"
        read -rp "Inserisci l'interfaccia di rete da modificare: " interfaccia
        read -rp "Inserisci il nuovo indirizzo IP: " ip
        sudo ip addr add "$ip" dev "$interfaccia"
        registra_info "Modifica configurazione di rete"
        println "$(come_successo "Configurazione di rete modificata.")"
        sleep 1
        printlines "$(con_grassetto "====================================")"
        ;;
    3 | visualizza_stato_della_rete)
        clear
        printlines "" \
            "$(con_grassetto "====================================")" \
            "$(con_grassetto "        VISUALIZZA STATO RETE")" \
            "$(con_grassetto "====================================")"
        sudo systemctl status NetworkManager
        registra_info "Visualizza stato della rete"
        sleep 1
        printlines "$(con_grassetto "====================================")"
        ;;
    4 | modifica_stato_della_rete)
        clear
        printlines "" \
            "$(con_grassetto "====================================")" \
            "$(con_grassetto "        MODIFICA STATO RETE")" \
            "$(con_grassetto "====================================")"
        read -rp "Inserisci l'interfaccia di rete da modificare: " interfaccia
        read -rp "Inserisci il nuovo stato della rete (up/down): " stato
        sudo ip link set "$interfaccia" "$stato"
        registra_info "Modifica stato della rete"
        println "$(come_successo "Stato della rete modificato.")"
        sleep 1
        printlines "$(con_grassetto "====================================")"
        ;;
    5 | visualizza_statistiche_di_rete)
        clear
        printlines "" \
            "$(con_grassetto "====================================")" \
            "$(con_grassetto "        VISUALIZZA STATISTICHE RETE")" \
            "$(con_grassetto "====================================")"
        sudo iftop
        registra_info "Visualizza statistiche di rete"
        sleep 1
        printlines "$(con_grassetto "====================================")"
        ;;
    6 | modifica_statistiche_di_rete)
        clear
        printlines "" \
            "$(con_grassetto "====================================")" \
            "$(con_grassetto "        MODIFICA STATISTICHE RETE")" \
            "$(con_grassetto "====================================")"
        read -rp "Inserisci l'interfaccia di rete da modificare: " interfaccia
        read -rp "Inserisci il nuovo valore delle statistiche di rete: " valore
        sudo ifconfig "$interfaccia" "$valore"
        registra_info "Modifica statistiche di rete"
        println "$(come_successo "Statistiche di rete modificate.")"
        sleep 1
        printlines "$(con_grassetto "====================================")"
        ;;
    7 | gestione_firewall)
        clear
        printlines "" \
            "$(con_grassetto "====================================")" \
            "$(con_grassetto "        GESTIONE FIREWALL")" \
            "$(con_grassetto "====================================")"
        read -rp "Inserisci il comando per gestire il firewall (es. start/stop/status/allow/deny): " comando
        if [[ "$comando" == "allow" ]]; then
            read -rp "Inserisci l'indirizzo IP o il dominio da autorizzare: " indirizzo
            sudo ufw allow "$indirizzo"
        elif [[ "$comando" == "deny" ]]; then
            read -rp "Inserisci l'indirizzo IP o il dominio da negare: " indirizzo
            sudo ufw deny "$indirizzo"
        else
            sudo ufw "$comando"
        fi
        registra_info "Gestione firewall"
        println "$(come_successo "Firewall gestito con $comando.")"
        sleep 1
        printlines "$(con_grassetto "====================================")"
        ;;
    8 | test_di_connessione)
        clear
        printlines "" \
            "$(con_grassetto "====================================")" \
            "$(con_grassetto "        TEST DI CONNESSIONE")" \
            "$(con_grassetto "====================================")"
        read -rp "Inserisci l'indirizzo IP o il dominio da testare: " indirizzo
        ping -c 4 "$indirizzo"
        registra_info "Test di connessione a $indirizzo"
        sleep 1
        printlines "$(con_grassetto "====================================")"
        ;;
    q | Q)
        schermata_principale
        ;;
    *)
        println "$(come_errore "\nOpzione non valida")"
        sleep .5
        gestione_rete
        ;;
    esac
    read -rp "Premi un tasto per tornare indietro..."
    gestione_rete
}