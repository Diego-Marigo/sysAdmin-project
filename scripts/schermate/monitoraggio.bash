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
        "q) Back" \
        "$(con_grassetto "====================================")" \
    
    read -rp "Seleziona un modulo [1-6,q]: " monitor_choice
    case $monitor_choice in
    1 | monitoraggio_cpu)
        registra_info "Monitoraggio CPU"
        clear

        printlines "" \
            "$(con_grassetto "====================================")" \
            "$(con_grassetto "        MONITORAGGIO CPU")" \
            "$(con_grassetto "====================================")"
        top -ncols 10 | head -n 20 
        printlines "$(con_grassetto "====================================")" \
        ;;
    2 | monitoraggio_ram)
        registra_info "Monitoraggio RAM"
        clear

        printlines "" \
            "$(con_grassetto "====================================")" \
            "$(con_grassetto "        MONITORAGGIO RAM")" \
            "$(con_grassetto "====================================")"
        free -h
        printlines "$(con_grassetto "====================================")" \
        ;;
    3 | monitoraggio_disco)
        registra_info "Monitoraggio Disco"
        clear

        printlines "" \
            "$(con_grassetto "====================================")" \
            "$(con_grassetto "        MONITORAGGIO DISCO")" \
            "$(con_grassetto "====================================")"
        df -h
        printlines "$(con_grassetto "====================================")" \
        ;;
    4 | monitoraggio_rete)
        registra_info "Monitoraggio Rete"
        clear

        printlines "" \
            "$(con_grassetto "====================================")" \
            "$(con_grassetto "        MONITORAGGIO RETE")" \
            "$(con_grassetto "====================================")"
        netstat
        printlines "$(con_grassetto "====================================")" \
        ;;
    5 | monitoraggio_servizi)
        registra_info "Monitoraggio Servizi"
        clear

        printlines "" \
            "$(con_grassetto "====================================")" \
            "$(con_grassetto "        MONITORAGGIO SERVIZI")" \
            "$(con_grassetto "====================================")"
        systemctl list-units --type=service --state=running
        printlines "$(con_grassetto "====================================")" \
        ;;
    6 | monitoraggio_utenti)
        registra_info "Monitoraggio Utenti"
        clear

        printlines "" \
            "$(con_grassetto "====================================")" \
            "$(con_grassetto "        MONITORAGGIO UTENTI")" \
            "$(con_grassetto "====================================")"
        who
        printlines "$(con_grassetto "====================================")" \
        ;;
    q | Q)
        schermata_principale
        ;;
    *)
        println "$(come_errore "\nOpzione non valida")"
        sleep .5
        monitoraggio
        ;;
    esac
    read -rp "Premi un tasto per tornare indietro..."
    monitoraggio
}