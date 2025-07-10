function gestione_disco() {
    #PREREQUISITI:
    # - fdisk: per gestire le partizioni
    # - mkfs: per formattare le partizioni
    # - fsck: per controllare il file system
    # - rsync: per fare backup e ripristino di cartelle
    if ! requisiti fdisk || ! requisiti mkfs || ! requisiti fsck || ! requisiti rsync; then
        return
    fi

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
            "6) Backup cartella" \
            "7) Ripristina cartella" \
            "q) Back" \
            "$(con_grassetto "====================================")"

        read -rp "Seleziona un'opzione [1-7,q]: " disk_choice
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
            printlines "$(con_grassetto "====================================")"
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
            printlines "$(con_grassetto "====================================")"
            ;;
        3 | visualizza_dischi)
            clear
            printlines "" \
                "$(con_grassetto "====================================")" \
                "$(con_grassetto "        VISTA PARTIZIONI")" \
                "$(con_grassetto "====================================")"

            registra_info "Visualizza dischi"
            sudo fdisk -l

            sleep 1
            printlines "$(con_grassetto "====================================")"
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
            printlines "$(con_grassetto "====================================")"
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
            printlines "$(con_grassetto "====================================")"
            ;;
        6 | backup_file)
            clear
            printlines "" \
                "$(con_grassetto "====================================")" \
                "$(con_grassetto "        BACKUP CARTELLA")" \
                "$(con_grassetto "====================================")"
            read -rp "Inserisci la directory con il nome della cartella da fare il backup: " cartella

            registra_info "Backup cartella $cartella"
            sudo rsync -av --delete --progress "$cartella" "$cartella.bak"

            sleep 1
            printlines "$(con_grassetto "====================================")"
            ;;
        7 | ripristina_file)
            clear
            printlines "" \
                "$(con_grassetto "====================================")" \
                "$(con_grassetto "        RIPRISTINA CARTELLA")" \
                "$(con_grassetto "====================================")"
            read -rp "Inserisci la directory con il nome della cartella da ripristinare: " cartella

            registra_info "Ripristina cartella $cartella"
            sudo rsync -av --delete --progress "$cartella.bak" "$cartella"

            sleep 1
            printlines "$(con_grassetto "====================================")"
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
        read -rp "Premi INVIO per tornare indietro..."
    done
}
