 function gestione_disco(){ 
    while true; do

        clear
        printlines "" \
            "$(con_grassetto "====================================")" \
            "$(con_grassetto "        GESTIONE DISCO")" \
            "$(con_grassetto "====================================")" \
            "1) Aggiungi disco" \
            "2) Rimuovi disco" \
            "3) Visualizza dischi" \
            "4) Formatta disco" \
            "5) Controlla file system" \
            "6) Crea cartella" \
            "7) Rimuovi cartella" \
            "8) Visualizza contenuto cartella" \
            "9) Crea file" \
            "10) Rimuovi file" \
            "11) Visualizza contenuto file" \
            "12) Backup cartella" \
            "13) Ripristina cartella" \
            "q) Back" \
            "$(con_grassetto "====================================")"

        read -rp "Seleziona un'opzione [1-13,q]: " disk_choice
        case $disk_choice in
        1 | aggiungi_disco)
            clear
            printlines "" \
                "$(con_grassetto "====================================")" \
                "$(con_grassetto "        AGGIUNGI PARTIZIONE")" \
                "$(con_grassetto "====================================")"
            read -rp "Inserisci il nome della partizione da aggiungere (es. /dev/sdX1): " partizione

            registra_info "Aggiungi disco $disco"
            sudo fdisk -l "$disco"

            sleep 1
            printlines "$(con_grassetto "====================================")" \
            ;;
        2 | rimuovi_disco)
            clear
            printlines "" \
                "$(con_grassetto "====================================")" \
                "$(con_grassetto "        RIMUOVI PARTIZIONE")" \
                "$(con_grassetto "====================================")"
            println "$(come_avviso "Attenzione: questa operazione rimuoverà il disco.")"
            println "$(come_avviso "Assicurati di avere un backup dei dati importanti.")"
            println "$(come_avviso "Assicurati di non avere processi in esecuzione sul disco.")"
            println "$(come_avviso "Assicurati di non avere partizioni montate sul disco.")"
            println "$(come_avviso "Assicurati di non avere file aperti sul disco.")"
            read -rp "Inserisci il nome del disco da rimuovere (es. /dev/sdX): " disco
            
            registra_info "Rimuovi disco $disco"
            sudo fdisk -l "$disco"

            sleep 1
            printlines "$(con_grassetto "====================================")" \
            ;;
        3 | visualizza_dischi)
            clear
            printlines "" \
                "$(con_grassetto "====================================")" \
                "$(con_grassetto "        VISUALIZZA PARTIZIONI")" \
                "$(con_grassetto "====================================")" 

            registra_info "Visualizza dischi"
            sudo fdisk -l

            sleep 1
            printlines "$(con_grassetto "====================================")" \
            ;;
        4 | formatta_disco)
            clear
            printlines "" \
                "$(con_grassetto "====================================")" \
                "$(con_grassetto "        FORMATTA PARTIZIONE")" \
                "$(con_grassetto "====================================")"
            println "$(come_avviso "Attenzione: questa operazione formatterà la partizione.")"
            println "$(come_avviso "Assicurati di avere un backup dei dati importanti.")"
            println "$(come_avviso "Assicurati di non avere processi in esecuzione sulla partizione.")"
            println "$(come_avviso "Assicurati di non avere file aperti sulla partizione.")"
            println "$(come_avviso "Assicurati di non avere file aperti sul disco.")"
            println "$(come_avviso "Assicurati di non avere RAID o LVM sul disco.")"
            println "$(come_avviso "Assicurati di non avere partizioni sul disco.")"
            println "$(come_avviso "Assicurati di non avere file di configurazione sul disco.")"
            println "$(come_avviso "Assicurati di non avere file di sistema sul disco.")"
            println "$(come_avviso "Assicurati di non avere file di backup sul disco.")"
            read -rp "Inserisci il nome del disco da formattare (es. /dev/sdX): " disco
            read -rp "Sei sicuro di voler formattare $disco? (y/n): " conferma

            if [[ $conferma == [yY] ]]; then
                registra_info "Formatta disco $disco"
                sudo mkfs.ext4 "$disco"
            else
                println "$(come_avviso "Operazione annullata.")"
            fi

            sleep 1
            printlines "$(con_grassetto "====================================")" \
            ;;
        5 | controlla_file_system)
            clear
            printlines "" \
                "$(con_grassetto "====================================")" \
                "$(con_grassetto "        CONTROLLA FILE SYSTEM")" \
                "$(con_grassetto "====================================")"
            read -rp "Inserisci il nome del file system da controllare (es. /dev/sdX1): " filesystem
            
            registra_info "Controlla file system $filesystem"
            sudo fsck -f "$filesystem"

            sleep 1
            printlines "$(con_grassetto "====================================")" \
            ;;
        6 | crea_cartella)
            clear
            printlines "" \
                "$(con_grassetto "====================================")" \
                "$(con_grassetto "        CREA CARTELLA")" \
                "$(con_grassetto "====================================")"
            read -rp "Inserisci la directory con il nome della cartella da creare: " cartella

            registra_info "Crea cartella $cartella"
            sudo mkdir "$cartella"

            sleep 1
            printlines "$(con_grassetto "====================================")" \
            ;;
        7 | rimuovi_cartella)
            clear
            printlines "" \
                "$(con_grassetto "====================================")" \
                "$(con_grassetto "        RIMUOVI CARTELLA")" \
                "$(con_grassetto "====================================")"
            read -rp "Inserisci la directory con il nome della cartella da rimuovere: " cartella

            registra_info "Rimuovi cartella $cartella"
            sudo rm -r "$cartella"

            sleep 1
            printlines "$(con_grassetto "====================================")" \
            ;;
        8 | visualizza_cartelle)
            clear
            printlines "" \
                "$(con_grassetto "====================================")" \
                "$(con_grassetto "        VISUALIZZA CARTELLE")" \
                "$(con_grassetto "====================================")"
            read -rp "Inserisci la directory da visualizzare: " cartella

            registra_info "Visualizza cartelle $cartella"
            sudo ls "$cartella"

            sleep 1
            printlines "$(con_grassetto "====================================")" \
            ;;
        9 | crea_file)
            clear
            printlines "" \
                "$(con_grassetto "====================================")" \
                "$(con_grassetto "        CREA FILE")" \
                "$(con_grassetto "====================================")"
            read -rp "Inserisci la directory con il nome del file da creare: " file

            registra_info "Crea file $file"
            sudo touch "$file"

            sleep 1
            printlines "$(con_grassetto "====================================")" \
            ;;
        10 | rimuovi_file)
            clear
            printlines "" \
                "$(con_grassetto "====================================")" \
                "$(con_grassetto "        RIMUOVI FILE")" \
                "$(con_grassetto "====================================")"
            read -rp "Inserisci la directory con il nome del file da rimuovere: " file

            registra_info "Rimuovi file $file"
            sudo rm "$file"

            sleep 1
            printlines "$(con_grassetto "====================================")" \
            ;;
        11 | visualizza_file)
            clear
            printlines "" \
                "$(con_grassetto "====================================")" \
                "$(con_grassetto "        VISUALIZZA FILE")" \
                "$(con_grassetto "====================================")"
            read -rp "Inserisci la directory con il nome del file da visualizzare: " file

            registra_info "Visualizza file $file"
            sudo cat "$file"

            sleep 1
            printlines "$(con_grassetto "====================================")" \
            ;;
        12 | backup_file)
            clear
            printlines "" \
                "$(con_grassetto "====================================")" \
                "$(con_grassetto "        BACKUP CARTELLA")" \
                "$(con_grassetto "====================================")"
            read -rp "Inserisci la directory con il nome della cartella da fare il backup: " cartella

            registra_info "Backup cartella $cartella"
            sudo rsync -av --delete --progress "$cartella" "$cartella.bak"

            sleep 1
            printlines "$(con_grassetto "====================================")" \
            ;;
        13 | ripristina_file)
            clear
            printlines "" \
                "$(con_grassetto "====================================")" \
                "$(con_grassetto "        RIPRISTINA CARTELLA")" \
                "$(con_grassetto "====================================")"
            read -rp "Inserisci la directory con il nome della cartella da ripristinare: " cartella

            registra_info "Ripristina cartella $cartella"
            sudo rsync -av --delete --progress "$cartella.bak" "$cartella"

            sleep 1
            printlines "$(con_grassetto "====================================")" \
            ;;
        q | Q)
            schermata_principale
            ;;
        *)
            println "$(come_errore "\nOpzione non valida")"
            sleep .5
            gestione_disco
            ;;
        esac
        read -rp "Premi un tasto per tornare indietro..."
        gestione_disco
    done
}