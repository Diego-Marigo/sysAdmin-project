function monitoraggio() {    
    clear
    printlines "" \
        "$(con_grassetto "====================================")" \
        "$(con_grassetto "        MONITORAGGIO SISTEMA")" \
        "$(con_grassetto "====================================")" \
        "1) Monitoraggio CPU" \
        "2) Monitoraggio RAM" \
        "3) Monitoraggio Disco" \
        "4) Monitoraggio Rete" \
        "5) Monitoraggio Servizi" \
        "6) Monitoraggio Utenti" \
        "q) Quit" \
        "$(con_grassetto "====================================")" \
    
    read -rp "Seleziona un modulo [1-6,q]: " monitor_choice
    case $monitor_choice in
    1 | monitoraggio_cpu)
        registra_info "Monitoraggio CPU"

        # Funzione per il monitoraggio della CPU
        top -ncols 10 | head -n 20
        ;;
    2 | monitoraggio_ram)
        registra_info "Monitoraggio RAM"

        # Funzione per il monitoraggio della RAM
        free -h
        ;;
    3 | monitoraggio_disco)
        registra_info "Monitoraggio Disco"

        # Funzione per il monitoraggio del Disco
        df -h
        ;;
    4 | monitoraggio_rete)
        registra_info "Monitoraggio Rete"

        # Funzione per il monitoraggio della Rete
        ip addr show
        ;;
    5 | monitoraggio_servizi)
        registra_info "Monitoraggio Servizi"

        # Funzione per il monitoraggio dei Servizi
        systemctl list-units --type=service --state=running
        ;;
    6 | monitoraggio_utenti)
        registra_info "Monitoraggio Utenti"

        # Funzione per il monitoraggio degli Utenti
        who
        ;;
    q | Q)
        println "Chiusura menù"
        exit 0
        ;;
    *)
        println "$(come_errore "\nOpzione non valida")"
        sleep .5
        monitoraggio
        ;;
    esac
    read -rp "Premi un tasto per tornare al menu principale..."
    schermata_principale
}
