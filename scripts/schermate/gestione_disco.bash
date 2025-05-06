 function gestione_disco(){ 
    clear
    printlines "" \
        "$(con_grassetto "====================================")" \
        "$(con_grassetto "        GESTIONE DISCO")" \
        "$(con_grassetto "====================================")" \
        "1) Aggiungi disco" \
        "2) Rimuovi disco" \
        "3) Visualizza dischi" \
        "4) Formatta disco" \
        "5) Controlla disco" \
        "6) Controlla spazio disco" \
        "7) Controlla file system" \
        "8) Controlla partizioni" \
        "9) Controlla RAID" \
        "10) Controlla LVM" \
        "q) Back" \
        "$(con_grassetto "====================================")"

    read -rp "Seleziona un modulo [1-10,q]: " disk_choice
    case $disk_choice in
    1 | aggiungi_disco)
        clear
        printlines "" \
            "$(con_grassetto "====================================")" \
            "$(con_grassetto "        AGGIUNGI DISCO")" \
            "$(con_grassetto "====================================")"
        read -rp "Inserisci il nome del disco da aggiungere (es. /dev/sdX): " disco

        registra_info "Aggiungi disco $disco"
        fdisk -l "$disco"

        sleep 1
        printlines "$(con_grassetto "====================================")" \
        ;;
    2 | rimuovi_disco)
        clear
        printlines "" \
            "$(con_grassetto "====================================")" \
            "$(con_grassetto "        RIMUOVI DISCO")" \
            "$(con_grassetto "====================================")"
        println "$(come_avviso "Attenzione: questa operazione rimuoverà il disco.")"
        println "$(come_avviso "Assicurati di avere un backup dei dati importanti.")"
        println "$(come_avviso "Assicurati di non avere processi in esecuzione sul disco.")"
        println "$(come_avviso "Assicurati di non avere partizioni montate sul disco.")"
        println "$(come_avviso "Assicurati di non avere file aperti sul disco.")"
        read -rp "Inserisci il nome del disco da rimuovere (es. /dev/sdX): " disco
        
        registra_info "Rimuovi disco $disco"
        fdisk -l "$disco"

        sleep 1
        printlines "$(con_grassetto "====================================")" \
        ;;
    3 | visualizza_dischi)
        clear
        printlines "" \
            "$(con_grassetto "====================================")" \
            "$(con_grassetto "        VISUALIZZA DISCHI")" \
            "$(con_grassetto "====================================")" 

        registra_info "Visualizza dischi"
        fdisk -l       

        sleep 1
        printlines "$(con_grassetto "====================================")" \
        ;;
    4 | formatta_disco)
        clear
        printlines "" \
            "$(con_grassetto "====================================")" \
            "$(con_grassetto "        FORMATTA DISCO")" \
            "$(con_grassetto "====================================")"
        println "$(come_avviso "Attenzione: questa operazione formatterà il disco.")"
        println "$(come_avviso "Assicurati di avere un backup dei dati importanti.")"
        println "$(come_avviso "Assicurati di non avere processi in esecuzione sul disco.")"
        println "$(come_avviso "Assicurati di non avere partizioni montate sul disco.")"
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
            mkfs.ext4 "$disco"
        else
            println "$(come_avviso "Operazione annullata.")"
        fi

        sleep 1
        printlines "$(con_grassetto "====================================")" \
        ;;
    5 | controlla_disco)
        clear
        printlines "" \
            "$(con_grassetto "====================================")" \
            "$(con_grassetto "        CONTROLLA DISCO")" \
            "$(con_grassetto "====================================")"
        read -rp "Inserisci il nome del disco da controllare (es. /dev/sdX): " disco

        registra_info "Controlla disco $disco"
        println "$(con_grassetto "Controllo del disco $disco tramite smartctl in corso...")"
        smartctl -a "$disco"
        smartctl -l "$disco"
        println "$(con_grassetto "Controllo del disco $disco tramite hdparm in corso...")"
        hdparm -t "$disco"
        hdparm -T "$disco"

        sleep 1
        printlines "$(con_grassetto "====================================")" \
        ;;
    6 | controlla_spazio_disco)
        clear
        printlines "" \
            "$(con_grassetto "====================================")" \
            "$(con_grassetto "        CONTROLLA SPAZIO DISCO")" \
            "$(con_grassetto "====================================")"    

        registra_info "Controlla spazio disco"
        df -h    

        sleep 1
        printlines "$(con_grassetto "====================================")" \
        ;;
    7 | controlla_file_system)
        clear
        printlines "" \
            "$(con_grassetto "====================================")" \
            "$(con_grassetto "        CONTROLLA FILE SYSTEM")" \
            "$(con_grassetto "====================================")"
        read -rp "Inserisci il nome del file system da controllare (es. /dev/sdX1): " filesystem
        
        registra_info "Controlla file system $filesystem"
        fsck -f "$filesystem"

        sleep 1
        printlines "$(con_grassetto "====================================")" \
        ;;
    8 | controlla_partizioni)
        clear
        printlines "" \
            "$(con_grassetto "====================================")" \
            "$(con_grassetto "        CONTROLLA PARTIZIONI")" \
            "$(con_grassetto "====================================")"
        read -rp "Inserisci il nome del disco da controllare (es. /dev/sdX): " disco

        registra_info "Controlla partizioni $disco"
        fdisk -l "$disco"

        sleep 1
        printlines "$(con_grassetto "====================================")" \
        ;;
    9 | controlla_raid)
        clear
        printlines "" \
            "$(con_grassetto "====================================")" \
            "$(con_grassetto "        CONTROLLA RAID")" \
            "$(con_grassetto "====================================")"
        read -rp "Inserisci il nome del RAID da controllare (es. /dev/mdX): " raid

        registra_info "Controlla RAID $raid"
        mdadm --detail "$raid"

        sleep 1
        printlines "$(con_grassetto "====================================")" \
        ;;
    10 | controlla_lvm)
        clear
        printlines "" \
            "$(con_grassetto "====================================")" \
            "$(con_grassetto "        CONTROLLA LVM")" \
            "$(con_grassetto "====================================")"
        read -rp "Inserisci il nome del LVM da controllare (es. /dev/vgX/lvX): " lvm

        registra_info "Controlla LVM $lvm"
        lvdisplay "$lvm"

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
}