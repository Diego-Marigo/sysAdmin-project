function operazioni_di_sistema(){
    clear
    printlines "" \
        "$(con_grassetto "====================================")" \
        "$(con_grassetto "        OPERAZIONI DI SISTEMA")" \
        "$(con_grassetto "====================================")" \
        "1) Visualizza log di sistema" \
        "2) Visualizza log di accesso" \
        "3) Visualizza log di errore" \
        "4) Visualizza log di sicurezza" \
        "5) Visualizza log di rete" \
        "6) Visualizza log di pacchetti" \
        "7) Visualizza log di applicazioni" \
        "8) Spegni/riavvia il sistema" \
        "q) Back" \
        "$(con_grassetto "====================================")"

    read -rp "Seleziona un'opzione [1-8,q]: " system_choice
    case $system_choice in
    1 | visualizza_log_di_sistema)
        clear
        printlines "" \
            "$(con_grassetto "====================================")" \
            "$(con_grassetto "        VISUALIZZA LOG DI SISTEMA")" \
            "$(con_grassetto "====================================")"
        tail -n 50 /var/log/syslog
        registra_info "Visualizza log di sistema"
        sleep 1
        printlines "$(con_grassetto "====================================")"
        ;;
    2 | visualizza_log_di_accesso)
        clear
        printlines "" \
            "$(con_grassetto "====================================")" \
            "$(con_grassetto "        VISUALIZZA LOG DI ACCESSO")" \
            "$(con_grassetto "====================================")"
        tail -n 50 /var/log/auth.log
        registra_info "Visualizza log di accesso"
        sleep 1
        printlines "$(con_grassetto "====================================")"
        ;;
    3 | visualizza_log_di_errore)
        clear
        printlines "" \
            "$(con_grassetto "====================================")" \
            "$(con_grassetto "        VISUALIZZA LOG DI ERRORE")" \
            "$(con_grassetto "====================================")"
        tail -n 50 /var/log/kern.log
        registra_info "Visualizza log di errore"
        sleep 1
        printlines "$(con_grassetto "====================================")"
        ;;
    4 | visualizza_log_di_sicurezza)
        clear
        printlines "" \
            "$(con_grassetto "====================================")" \
            "$(con_grassetto "        VISUALIZZA LOG DI SICUREZZA")" \
            "$(con_grassetto "====================================")"
        tail -n 50 /var/log/secure
        registra_info "Visualizza log di sicurezza"
        sleep 1
        printlines "$(con_grassetto "====================================")"
        ;;
    5 | visualizza_log_di_rete)
        clear
        printlines "" \
            "$(con_grassetto "====================================")" \
            "$(con_grassetto "        VISUALIZZA LOG DI RETE")" \
            "$(con_grassetto "====================================")"
        tail -n 50 /var/log/messages
        registra_info "Visualizza log di rete"
        sleep 1
        printlines "$(con_grassetto "====================================")"
        ;;
    6 | visualizza_log_di_pacchetti)
        clear
        printlines "" \
            "$(con_grassetto "====================================")" \
            "$(con_grassetto "        VISUALIZZA LOG DI PACCHETTI")" \
            "$(con_grassetto "====================================")"
        tail -n 50 /var/log/apt/history.log
        registra_info "Visualizza log di pacchetti"
        sleep 1
        printlines "$(con_grassetto "====================================")"
        ;;
    7 | visualizza_log_di_applicazioni)
        clear
        printlines "" \
            "$(con_grassetto "====================================")" \
            "$(con_grassetto "        VISUALIZZA LOG DI APPLICAZIONI")" \
            "$(con_grassetto "====================================")"
        tail -n 50 /var/log/daemon.log
        registra_info "Visualizza log di applicazioni"
        sleep 1
        printlines "$(con_grassetto "====================================")"
        ;;
    8 | spegni_riavvia_il_sistema)
        clear
        printlines "" \
            "$(con_grassetto "====================================")" \
            "$(con_grassetto "        SPEGNI/RIAVVIA IL SISTEMA")" \
            "$(con_grassetto "====================================")"
        read -rp "Vuoi spegnere o riavviare il sistema? (s/r): " scelta
        if [[ $scelta == "s" ]]; then
            sudo shutdown
        elif [[ $scelta == "r" ]]; then
            sudo reboot
        else
            println "$(come_errore "\nOpzione non valida")"
            sleep .5
        fi
        registra_info "Spegni/riavvia il sistema"
        sleep 1
        printlines "$(con_grassetto "====================================")"
        ;;
    q | Q)
        schermata_principale
        ;;
    *)
        println "$(come_errore "\nOpzione non valida")"
        sleep .5
        operazioni_di_sistema
        ;;
    esac
    read -rp "Premi un tasto per tornare indietro..."
    operazioni_di_sistema
}