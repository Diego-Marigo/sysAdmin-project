function gestione_utenti(){
    clear
    printlines "" \
        "$(con_grassetto "====================================")" \
        "$(con_grassetto "        GESTIONE UTENTI")" \
        "$(con_grassetto "====================================")" \
        "1) Aggiungi utente" \
        "2) Modifica utente" \
        "3) Elimina utente" \
        "4) Visualizza utenti" \
        "5) Modifica password" \
        "6) Modifica gruppo" \
        "7) Modifica permessi" \
        "8) Modifica scadenza password" \
        "9) Modifica scadenza account" \
        "10) Modifica stato account" \
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
        useradd "$nome_utente"
        read -rp "Inserisci la password per l'utente $nome_utente: " password_utente
        echo "$nome_utente:$password_utente" | chpasswd
        registra_info "Aggiungi utente $nome_utente"
        println "$(come_successo "Utente $nome_utente aggiunto con successo.")"
        
        sleep 1
        printlines "$(con_grassetto "====================================")"
        ;;
    2 | modifica_utente)
        clear
        printlines "" \
            "$(con_grassetto "====================================")" \
            "$(con_grassetto "        MODIFICA UTENTE")" \
            "$(con_grassetto "====================================")"
        
        read -rp "Inserisci il nome dell'utente da modificare: " nome_utente
        read -rp "Inserisci il nuovo nome per l'utente $nome_utente: " nuovo_nome_utente
        sudo usermod -l "$nuovo_nome_utente" "$nome_utente"
        registra_info "Modifica utente $nome_utente in $nuovo_nome_utente"

        sleep 1
        printlines "$(con_grassetto "====================================")"
        ;;
    3 | elimina_utente)
        clear
        printlines "" \
            "$(con_grassetto "====================================")" \
            "$(con_grassetto "        ELIMINA UTENTE")" \
            "$(con_grassetto "====================================")"
        println "$(come_avviso "Attenzione: questa operazione richiede i privilegi di root.")"
        println "$(come_avviso "Attenzione: questa operazione eliminerà l'utente.")"

        read -rp "Inserisci il nome dell'utente da eliminare: " nome_utente
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
    4 | visualizza_utenti)
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
    5 | modifica_password)
        clear
        printlines "" \
            "$(con_grassetto "====================================")" \
            "$(con_grassetto "        MODIFICA PASSWORD")" \
            "$(con_grassetto "====================================")"

        read -rp "Inserisci il nome dell'utente di cui modificare la password: " nome_utente
        read -rp "Inserisci la nuova password per l'utente $nome_utente: " password_utente
        echo "$nome_utente:$password_utente" | chpasswd
        registra_info "Modifica password utente $nome_utente"
        
        sleep 1
        printlines "$(con_grassetto "====================================")"
        ;;
    6 | modifica_gruppo)
        clear
        printlines "" \
            "$(con_grassetto "====================================")" \
            "$(con_grassetto "        MODIFICA GRUPPO")" \
            "$(con_grassetto "====================================")"

        read -rp "Inserisci il nome dell'utente di cui modificare il gruppo: " nome_utente
        read -rp "Inserisci il nuovo gruppo per l'utente $nome_utente: " nuovo_gruppo
        sudo usermod -g "$nuovo_gruppo" "$nome_utente"
        registra_info "Modifica gruppo utente $nome_utente in $nuovo_gruppo"

        sleep 1
        printlines "$(con_grassetto "====================================")"
        ;;
    7 | modifica_permessi)
        clear
        printlines "" \
            "$(con_grassetto "====================================")" \
            "$(con_grassetto "        MODIFICA PERMESSI")" \
            "$(con_grassetto "====================================")"

        read -rp "Inserisci il nome dell'utente di cui modificare i permessi: " nome_utente
        read -rp "Inserisci i nuovi permessi per l'utente $nome_utente: " permessi
        sudo chmod "$permessi" "$nome_utente"
        registra_info "Modifica permessi utente $nome_utente in $permessi"

        sleep 1
        printlines "$(con_grassetto "====================================")"
        ;;
    8 | modifica_scadenza_password)
        clear
        printlines "" \
            "$(con_grassetto "====================================")" \
            "$(con_grassetto "        MODIFICA SCADENZA PASSWORD")" \
            "$(con_grassetto "====================================")"

        read -rp "Inserisci il nome dell'utente di cui modificare la scadenza della password: " nome_utente
        read -rp "Inserisci la nuova scadenza della password per l'utente $nome_utente (in giorni): " scadenza_password
        sudo chage -M "$scadenza_password" "$nome_utente"
        registra_info "Modifica scadenza password utente $nome_utente in $scadenza_password giorni"

        sleep 1
        printlines "$(con_grassetto "====================================")"
        ;;
    9 | modifica_scadenza_account)
        clear
        printlines "" \
            "$(con_grassetto "====================================")" \
            "$(con_grassetto "        MODIFICA SCADENZA ACCOUNT")" \
            "$(con_grassetto "====================================")"

        read -rp "Inserisci il nome dell'utente di cui modificare la scadenza dell'account: " nome_utente
        read -rp "Inserisci la nuova scadenza dell'account per l'utente $nome_utente (in giorni): " scadenza_account
        sudo chage -E "$scadenza_account" "$nome_utente"
        registra_info "Modifica scadenza account utente $nome_utente in $scadenza_account giorni"

        sleep 1
        printlines "$(con_grassetto "====================================")"
        ;;
    10 | modifica_stato_account)
        clear
        printlines "" \
            "$(con_grassetto "====================================")" \
            "$(con_grassetto "        MODIFICA STATO ACCOUNT")" \
            "$(con_grassetto "====================================")"

        read -rp "Inserisci il nome dell'utente di cui modificare lo stato dell'account: " nome_utente
        read -rp "Inserisci il nuovo stato dell'account per l'utente $nome_utente (attivo/inattivo): " stato_account
        if [[ $stato_account == "attivo" ]]; then
            sudo usermod -U "$nome_utente"
        else
            sudo usermod -L "$nome_utente"
        fi
        registra_info "Modifica stato account utente $nome_utente in $stato_account"

        sleep 1
        printlines "$(con_grassetto "====================================")"
        ;;
    q | Q)
        schermata_principale
        ;;
    *)
        println "$(come_errore "\nOpzione non valida")"
        sleep .5
        gestione_utenti
}