function gestione_utenti() {
    while true; do
        clear
        printlines "" \
            "$(con_grassetto "====================================")" \
            "$(con_grassetto "        GESTIONE UTENTI")" \
            "$(con_grassetto "====================================")" \
            "1) Aggiungi utente" \
            "2) Modifica nome utente" \
            "3) Modifica password" \
            "4) Modifica gruppo principale" \
            "5) Aggiungi utente a gruppo" \
            "6) Modifica scadenza password" \
            "7) Modifica scadenza account" \
            "8) Modifica stato account" \
            "9) Elimina utente" \
            "10) Visualizza utenti" \
            "q) Back" \
            "$(con_grassetto "====================================")"

        read -rp "Seleziona un'opzione [1-10,q]: " user_choice
        case $user_choice in
        1 | aggiungi_utente)
            clear
            printlines "" \
                "$(con_grassetto "====================================")" \
                "$(con_grassetto "        AGGIUNGI UTENTE")" \
                "$(con_grassetto "====================================")"

            read -rp "Inserisci il nome del nuovo utente: " nome_utente
            if id "$nome_utente" &>/dev/null; then
                println "$(come_errore "Utente '$nome_utente' già esistente.")"
                sleep 1
                continue
            fi

            sudo useradd "$nome_utente" && sudo passwd "$nome_utente"
            registra_info "Aggiungi utente $nome_utente"
            println "$(come_successo "Utente $nome_utente aggiunto con successo.")"

            sleep 1
            printlines "$(con_grassetto "====================================")"
            ;;
        2 | modifica_utente)
            clear
            printlines "" \
                "$(con_grassetto "====================================")" \
                "$(con_grassetto "        MODIFICA NOME UTENTE")" \
                "$(con_grassetto "====================================")"

            read -rp "Inserisci il nome dell'utente da modificare: " nome_utente
            if ! id "$nome_utente" &>/dev/null; then
                println "$(come_errore "Utente $nome_utente non trovato")"
                sleep 1
                continue
            fi

            read -rp "Inserisci il nuovo nome per l'utente $nome_utente: " nuovo_nome_utente
            if id "$nuovo_nome_utente" &>/dev/null; then
                println "$(come_errore "Utente $nuovo_nome_utente già esistente")"
                sleep 1
                continue
            fi

            sudo usermod -l "$nuovo_nome_utente" "$nome_utente"
            registra_info "Modifica utente $nome_utente in $nuovo_nome_utente"
            print "$(come_info "Utente rinominato!")"

            sleep 1
            printlines "$(con_grassetto "====================================")"
            ;;
        3 | modifica_password)
            clear
            printlines "" \
                "$(con_grassetto "====================================")" \
                "$(con_grassetto "        MODIFICA PASSWORD")" \
                "$(con_grassetto "====================================")"

            read -rp "Inserisci il nome dell'utente di cui modificare la password: " nome_utente
            if ! id "$nome_utente" &>/dev/null; then
                println "$(come_errore "Utente non trovato")"
                sleep 1
                continue
            fi

            read -rp "Inserisci la nuova password per l'utente $nome_utente: " password_utente
            sudo chpasswd <<<"$nome_utente:$password_utente"
            registra_info "Modifica password utente $nome_utente"

            sleep 1
            printlines "$(con_grassetto "====================================")"
            ;;
        4 | modifica_gruppo)
            clear
            printlines "" \
                "$(con_grassetto "====================================")" \
                "$(con_grassetto "        MODIFICA GRUPPO")" \
                "$(con_grassetto "====================================")"

            read -rp "Inserisci il nome dell'utente di cui modificare il gruppo: " nome_utente
            if ! id "$nome_utente" &>/dev/null; then
                println "$(come_errore "Utente non trovato")"
                sleep 1
                continue
            fi

            read -rp "Inserisci il nuovo gruppo per l'utente $nome_utente: " nuovo_gruppo
            if ! getent group "$nuovo_gruppo" &>/dev/null; then
                println "$(come_errore "Gruppo non trovato")"
                sleep 1
                continue
            fi

            sudo usermod -g "$nuovo_gruppo" "$nome_utente"
            registra_info "Modifica gruppo utente $nome_utente in $nuovo_gruppo"

            sleep 1
            printlines "$(con_grassetto "====================================")"
            ;;
        5 | modifica_permessi)
            clear
            printlines "" \
                "$(con_grassetto "====================================")" \
                "$(con_grassetto "        MODIFICA PERMESSI")" \
                "$(con_grassetto "====================================")"

            read -rp "Inserisci il nome dell'utente di cui modificare i permessi: " nome_utente
            read -rp "Inserisci il gruppo a cui aggiungere l'utente $nome_utente per modificare i permessi: " gruppo_permessi
            sudo usermod -aG "$gruppo_permessi" "$nome_utente"
            registra_info "Aggiunto utente $nome_utente al gruppo $gruppo_permessi"

            sleep 1
            printlines "$(con_grassetto "====================================")"
            ;;
        6 | modifica_scadenza_password)
            clear
            printlines "" \
                "$(con_grassetto "====================================")" \
                "$(con_grassetto "        MODIFICA SCADENZA PASSWORD")" \
                "$(con_grassetto "====================================")"

            read -rp "Inserisci il nome dell'utente di cui modificare la scadenza della password: " nome_utente
            if ! id "$nome_utente" &>/dev/null; then
                println "$(come_errore "Utente non trovato")"
                sleep 1
                continue
            fi

            read -rp "Numero giorni di validità residui prima della scadenza: " n_giorni
            if ! [[ "$n_giorni" =~ ^[0-9]+$ ]]; then
                println "$(come_errore "Inserire un numero valido.")"
                sleep 1
                continue
            fi

            sudo chage -M "$n_giorni" "$nome_utente"
            registra_info "Modifica scadenza password utente $nome_utente in $n_giorni giorni"

            sleep 1
            printlines "$(con_grassetto "====================================")"
            ;;
        7 | modifica_scadenza_account)
            clear
            printlines "" \
                "$(con_grassetto "====================================")" \
                "$(con_grassetto "        MODIFICA SCADENZA ACCOUNT")" \
                "$(con_grassetto "====================================")"

            read -rp "Inserisci il nome dell'utente di cui modificare la scadenza dell'account: " nome_utente
            if ! id "$nome_utente" &>/dev/null; then
                println "$(come_errore "Utente non trovato")"
                sleep 1
                continue
            fi

            read -rp "Numero giorni di validità residui prima della scadenza: " n_giorni
            if ! [[ "$n_giorni" =~ ^[0-9]+$ ]]; then
                println "$(come_errore "Inserire un numero valido.")"
                sleep 1
                continue
            fi

            data_scadenza=$(date -d "+$n_giorni days" +"%Y-%m-%d")
            sudo chage -E "$data_scadenza" "$nome_utente"
            registra_info "Modifica scadenza account utente $nome_utente in $n_giorni giorni (fino al $data_scadenza)"

            sleep 1
            printlines "$(con_grassetto "====================================")"
            ;;
        8 | modifica_stato_account)
            clear
            printlines "" \
                "$(con_grassetto "====================================")" \
                "$(con_grassetto "        MODIFICA STATO ACCOUNT")" \
                "$(con_grassetto "====================================")"

            while true; do
                read -rp "Inserisci il nuovo stato dell'account per l'utente $nome_utente (attivo/inattivo): " stato_account
                if [[ $stato_account == "attivo" ]]; then
                    sudo usermod -U "$nome_utente"
                    break
                elif [[ $stato_account == "inattivo" ]]; then
                    sudo usermod -L "$nome_utente"
                    break
                else
                    println "$(come_errore "Input non valido. Inserisci 'attivo' o 'inattivo'.")"
                fi
            done
            registra_info "Modifica stato account utente $nome_utente in $stato_account"
            registra_info "Modifica stato account utente $nome_utente in $stato_account"

            sleep 1
            printlines "$(con_grassetto "====================================")"
            ;;
        9 | elimina_utente)
            clear
            printlines "" \
                "$(con_grassetto "====================================")" \
                "$(con_grassetto "        ELIMINA UTENTE")" \
                "$(con_grassetto "====================================")"
            println "$(come_avviso "Attenzione: questa operazione richiede i privilegi di root.")"
            sudo userdel -r "$nome_utente"
            registra_info "Elimina utente $nome_utente (con home directory)"
            println "$(come_successo "Utente $nome_utente e la sua home directory sono stati eliminati con successo.")"
            read -rp "Sei sicuro di voler eliminare l'utente $nome_utente? [y/N]: " conferma

            if [[ $conferma == [yY] ]]; then
                sudo userdel "$nome_utente"
                registra_info "Elimina utente $nome_utente"
                println "$(come_successo "Utente $nome_utente eliminato con successo.")"
            else
                println "$(come_avviso "Operazione annullata.")"
            fi

            sleep 1
            printlines "$(con_grassetto "====================================")"
            ;;
        10 | visualizza_utenti)
            clear
            printlines "" \
                "$(con_grassetto "====================================")" \
                "$(con_grassetto "        VISUALIZZA UTENTI")" \
                "$(con_grassetto "====================================")"

            sudo cut -d: -f1 /etc/passwd
            registra_info "Visualizza utenti"

            sleep 1
            printlines "$(con_grassetto "====================================")"
            ;;
        q | Q)
            break
            ;;
        *)
            println "$(come_errore "\nOpzione non valida")"
            sleep .5
            ;;
        esac
        read -rp "Premi INVIO per tornare indietro..."
    done
}
