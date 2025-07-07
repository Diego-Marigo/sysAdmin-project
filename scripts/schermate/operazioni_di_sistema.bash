function operazioni_log() {
    while true; do
        clear
        printlines "" \
            "$(con_grassetto "====================================")" \
            "$(con_grassetto "      VISUALIZZAZIONE LOG")" \
            "$(con_grassetto "====================================")" \
            "" \
            "Scegli quale registro visualizzare:" \
            "1) Log di sistema (/var/log/syslog)" \
            "2) Log di accesso (/var/log/auth.log)" \
            "3) Log del kernel (/var/log/kern.log)" \
            "4) Log di sicurezza (/var/log/secure)" \
            "5) Log di rete (/var/log/messages)" \
            "6) Log dei pacchetti (/var/log/apt/history.log)" \
            "7) Log dei servizi (/var/log/syslog)" \
            "8) Log utenti (/var/log/auth.log)" \
            "q) Back" \
            "$(con_grassetto "====================================")"

        read -rp "Scegli [1-8,q]: " choice
        case "$choice" in
        1 visualizza_log_di_sistema) 
            clear 
            printlines "" \
                "$(con_grassetto "====================================")" \
                "$(con_grassetto "        VISUALIZZA LOG DI SISTEMA")" \
                "$(con_grassetto "====================================")"
            tail -n50 /var/log/syslog
            sleep 1
            printlines "$(con_grassetto "====================================")"
            ;;
        2 visualizza_log_di_accesso) 
            clear
            printlines "" \
                "$(con_grassetto "====================================")" \
                "$(con_grassetto "        VISUALIZZA LOG DI ACCESSO")" \
                "$(con_grassetto "====================================")"
            tail -n50 /var/log/auth.log
            sleep 1
            printlines "$(con_grassetto "====================================")"
            ;;
        3 visualizza_log_del_kernel) 
            clear
            printlines "" \
                "$(con_grassetto "====================================")" \
                "$(con_grassetto "        VISUALIZZA LOG DEL KERNEL")" \
                "$(con_grassetto "====================================")"
            tail -n50 /var/log/kern.log
            sleep 1
            printlines "$(con_grassetto "====================================")"
            ;;
        4 visualizza_log_di_sicurezza) 
            clear
            printlines "" \
                "$(con_grassetto "====================================")" \
                "$(con_grassetto "        VISUALIZZA LOG DI SICUREZZA")" \
                "$(con_grassetto "====================================")"
            tail -n50 /var/log/secure
            sleep 1
            printlines "$(con_grassetto "====================================")"
            ;;
        5 visualizza_log_di_rete) 
            clear
            printlines "" \
                "$(con_grassetto "====================================")" \
                "$(con_grassetto "        VISUALIZZA LOG DI RETE")" \
                "$(con_grassetto "====================================")"
            tail -n50 /var/log/messages
            sleep 1
            printlines "$(con_grassetto "====================================")"
            ;;
        6 visualizza_log_dei_pacchetti) 
            clear
            printlines "" \
                "$(con_grassetto "====================================")" \
                "$(con_grassetto "        VISUALIZZA LOG DEI PACCHETTI")" \
                "$(con_grassetto "====================================")"
            tail -n50 /var/log/apt/history.log
            sleep 1
            printlines "$(con_grassetto "====================================")"
            ;;
        7 visualizza_log_dei_servizi) 
            clear
            printlines "" \
                "$(con_grassetto "====================================")" \
                "$(con_grassetto "        VISUALIZZA LOG DEI SERVIZI")" \
                "$(con_grassetto "====================================")"
            tail -n50 /var/log/syslog
            sleep 1
            printlines "$(con_grassetto "====================================")"
            ;;
        8 visualizza_log_utenti) 
            clear
            printlines "" \
                "$(con_grassetto "====================================")" \
                "$(con_grassetto "        VISUALIZZA LOG UTENTI")" \
                "$(con_grassetto "====================================")"
            tail -n50 /var/log/auth.log
            sleep 1
            printlines "$(con_grassetto "====================================")"
            ;;
        q | Q) break ;;
        *)
            println "$(come_errore "Opzione non valida")"
            sleep .5
            continue
            ;;
        esac
        registra_info "Visualizza log opzione $choice"
        read -rp "Premi un tasto per tornare..."
    done
}

function operazioni_sessione() {
    while true; do
        clear
        printlines "" \
            "$(con_grassetto "====================================")" \
            "$(con_grassetto "      OPERAZIONI DI SESSIONE")" \
            "$(con_grassetto "====================================")" \
            "1) Spegni (shutdown now)" \
            "2) Riavvia (reboot)" \
            "3) Sospendi (systemctl suspend)" \
            "4) Iberna (systemctl hibernate)" \
            "5) Sospendi all'iberno (systemctl hybrid-sleep)" \
            "6) Blocca sessione (loginctl lock-session)" \
            "7) Disconnetti utente corrente (loginctl --terminate-user)" \
            "q) Back" \
            "$(con_grassetto "====================================")"

        read -rp "Scegli [1-7,q]: " choice
        case "$choice" in
        1 | spegni_sistema ) 
            clear
            printlines "" \
                "$(con_grassetto "====================================")" \
                "$(con_grassetto "        SPEGNI IL SISTEMA")" \
                "$(con_grassetto "====================================")"
            println "$(come_avviso "Il sistema si spegnerà ora.")"
            sudo shutdown now
            sleep 1
            printlines "$(con_grassetto "====================================")"
            ;;
        2 | riavvia_sistema ) 
            clear
            printlines "" \
                "$(con_grassetto "====================================")" \
                "$(con_grassetto "        RIAVVIA IL SISTEMA")" \
                "$(con_grassetto "====================================")"
            println "$(come_avviso "Il sistema si riavvierà ora.")"
            sudo reboot
            sleep 1
            printlines "$(con_grassetto "====================================")"
            ;;
        3 | sospendi_sistema ) 
            clear
            printlines "" \
                "$(con_grassetto "====================================")" \
                "$(con_grassetto "        SOSPENDI IL SISTEMA")" \
                "$(con_grassetto "====================================")"
            sudo systemctl suspend
            sleep 1
            printlines "$(con_grassetto "====================================")"
            ;;
        4 | iberna_sistema ) 
            clear 
            printlines "" \
                "$(con_grassetto "====================================")" \
                "$(con_grassetto "        IBERNA IL SISTEMA")" \
                "$(con_grassetto "====================================")"
            sudo systemctl hibernate 
            sleep 1
            printlines "$(con_grassetto "====================================")"
            ;;
        5 | sospendi_iberno_sistema ) 
            clear 
            printlines "" \
                "$(con_grassetto "====================================")" \
                "$(con_grassetto "        SOSPENDI ALL'IBERNO IL SISTEMA")" \
                "$(con_grassetto "====================================")"
            sudo systemctl hybrid-sleep 
            sleep 1
            printlines "$(con_grassetto "====================================")"
            ;;
        6 | blocca_sessione ) 
            clear 
            printlines "" \
                "$(con_grassetto "====================================")" \
                "$(con_grassetto "        BLOCCA LA SESSIONE")" \
                "$(con_grassetto "====================================")"
            loginctl lock-session 
            sleep 1
            printlines "$(con_grassetto "====================================")"
            ;;
        7 | disconnetti_utente ) 
            clear
            printlines "" \
                "$(con_grassetto "====================================")" \
                "$(con_grassetto "        DISCONNETTI L'UTENTE")" \
                "$(con_grassetto "====================================")"
            loginctl --terminate-user "$USER"
            sleep 1
            printlines "$(con_grassetto "====================================")"
            ;;
        q | Q) break ;;
        *)
            println "$(come_errore "Opzione non valida")"
            sleep .5
            continue
            ;;
        esac
        registra_info "Sessione opzione $choice"
        read -rp "Premi un tasto per tornare..."
    done
}