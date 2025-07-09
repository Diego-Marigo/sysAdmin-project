function operazioni_log() {
    # PREREQUISITO: essere in un sistema con systemd!
    #if ! command -v journalctl &>/dev/null; then
    #    printlines \
    #        "$(come_errore "Questo script richiede systemd per funzionare.")" \
    #        "$(come_avviso "Impossibile proseguire senza journalctl")"
    #    sleep 1.5
    #    return
    #fi

    while true; do
        clear
        printlines "" \
            "$(con_grassetto "====================================")" \
            "$(con_grassetto "      VISUALIZZAZIONE LOG")" \
            "$(con_grassetto "====================================")" \
            "" \
            "Scegli quale registro visualizzare:" \
            "1) Log di sistema" \
            "2) Log di accesso" \
            "3) Log del kernel" \
            "4) Log di rete" \
            "5) Log dei pacchetti" \
            "6) Log delle applicazioni" \
            "q) Back" \
            "$(con_grassetto "====================================")"

        read -rp "Seleziona un'opzione [1-6,q]: " choice
        case "$choice" in
        1 | visualizza_log_di_sistema)
            clear
            printlines "" \
                "$(con_grassetto "====================================")" \
                "$(con_grassetto "        LOG DI SISTEMA")" \
                "$(con_grassetto "====================================")"
            journalctl -n 50 --no-pager
            sleep 1
            printlines "$(con_grassetto "====================================")"
            ;;
        2 | visualizza_log_di_accesso)
            clear
            printlines "" \
                "$(con_grassetto "====================================")" \
                "$(con_grassetto "        LOG DI ACCESSO")" \
                "$(con_grassetto "====================================")"
            # Mostra i log di accesso normali, ma anche quelli sudo ed ssh
            journalctl _COMM=sudo _SYSTEMD_UNIT=sshd.service -n 100 --no-pager
            sleep 1
            printlines "$(con_grassetto "====================================")"
            ;;
        3 | visualizza_log_del_kernel)
            clear
            printlines "" \
                "$(con_grassetto "====================================")" \
                "$(con_grassetto "        LOG DEL KERNEL")" \
                "$(con_grassetto "====================================")"
            journalctl -k -n 50 --no-pager
            sleep 1
            printlines "$(con_grassetto "====================================")"
            ;;
        4 | visualizza_log_di_rete)
            clear
            printlines "" \
                "$(con_grassetto "====================================")" \
                "$(con_grassetto "        LOG DI RETE")" \
                "$(con_grassetto "====================================")"
            # Se c'è NetworkManager (dovrebbe), usalo, altrimenti tenta con nerworkd
            if journalctl -u NetworkManager &>/dev/null; then
                journalctl -u NetworkManager -n 50 --no-pager
            else
                journalctl -u systemd-networkd -n 50 --no-pager
            fi
            sleep 1
            printlines "$(con_grassetto "====================================")"
            ;;
        5 | visualizza_log_dei_pacchetti)
            clear
            printlines "" \
                "$(con_grassetto "====================================")" \
                "$(con_grassetto "        LOG DEI PACCHETTI")" \
                "$(con_grassetto "====================================")"
            tail -n50 /var/log/apt/history.log 2>/dev/null ||
                echo "Log APT non disponibile."
            sleep 1
            printlines "$(con_grassetto "====================================")"
            ;;
        6 | visualizza_log_dei_servizi)
            clear
            printlines "" \
                "$(con_grassetto "====================================")" \
                "$(con_grassetto "        LOG DELLE APPLICAZIONI (livello info)")" \
                "$(con_grassetto "====================================")"
            journalctl -p info -n 50 --no-pager
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
        read -rp "Premi INVIO per tornare indietro..."
    done
}

function operazioni_sessione() {
    while true; do
        clear
        printlines "" \
            "$(con_grassetto "====================================")" \
            "$(con_grassetto "      OPERAZIONI DI SESSIONE")" \
            "$(con_grassetto "====================================")" \
            "1) Spegni" \
            "2) Riavvia" \
            "3) Sospendi" \
            "4) Iberna" \
            "5) Sospendi e iberna" \
            "6) Blocca sessione" \
            "7) Disconnetti utente corrente" \
            "q) Back" \
            "$(con_grassetto "====================================")"

        read -rp "Seleziona un'opzione [1-7,q]: " choice
        case "$choice" in
        1 | spegni_sistema)
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
        2 | riavvia_sistema)
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
        3 | sospendi_sistema)
            clear
            printlines "" \
                "$(con_grassetto "====================================")" \
                "$(con_grassetto "        SOSPENDI IL SISTEMA")" \
                "$(con_grassetto "====================================")"
            sudo systemctl suspend
            sleep 1
            printlines "$(con_grassetto "====================================")"
            ;;
        4 | iberna_sistema)
            clear
            printlines "" \
                "$(con_grassetto "====================================")" \
                "$(con_grassetto "        IBERNA IL SISTEMA")" \
                "$(con_grassetto "====================================")"
            sudo systemctl hibernate
            sleep 1
            printlines "$(con_grassetto "====================================")"
            ;;
        5 | sospendi_iberno_sistema)
            clear
            printlines "" \
                "$(con_grassetto "====================================")" \
                "$(con_grassetto "        SOSPENDI E IBERNA IL SISTEMA")" \
                "$(con_grassetto "====================================")"
            sudo systemctl hybrid-sleep
            sleep 1
            printlines "$(con_grassetto "====================================")"
            ;;
        6 | blocca_sessione)
            clear
            printlines "" \
                "$(con_grassetto "====================================")" \
                "$(con_grassetto "        BLOCCA LA SESSIONE")" \
                "$(con_grassetto "====================================")"
            loginctl lock-session
            sleep 1
            printlines "$(con_grassetto "====================================")"
            ;;
        7 | disconnetti_utente)
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
        read -rp "Premi INVIO per tornare indietro..."
    done
}
