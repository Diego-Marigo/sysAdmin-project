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
        registra_info "Aggiungi disco"
        clear

        printlines "" \
            "$(con_grassetto "====================================")" \
            "$(con_grassetto "        AGGIUNGI DISCO")" \
            "$(con_grassetto "====================================")"
        read -rp "Inserisci il nome del disco da aggiungere (es. /dev/sdX): " disco
        if [ -b "$disco" ]; then
            if command -v pvcreate &>/dev/null; then
                if pvcreate "$disco" &>/dev/null; then
                    println "$(con_grassetto "Il disco $disco è stato aggiunto con successo.")"
                    println "$(come_avviso "Nota: pvcreate è stato usato per aggiungere il disco.")"
                else
                    println "$(come_errore "Errore: Impossibile aggiungere il disco $disco.")"
                fi
            elif command -v fdisk &>/dev/null; then
                if fdisk -l "$disco" &>/dev/null; then
                    println "$(con_grassetto "Il disco $disco è stato aggiunto con successo.")"
                    println "$(come_avviso "Nota: fdisk è stato usato per aggiungere il disco.")"
                else
                    println "$(come_errore "Errore: Impossibile aggiungere il disco $disco.")"
                fi
            else
                println "$(come_errore "Errore: Il comando pvcreate non è disponibile.")"
                println "$(come_errore "Errore: Il comando fdisk non è disponibile.")"
                println "$(come_errore "Errore: Impossibile aggiungere il disco $disco.")"
            fi 
        else
            println "$(come_errore "Errore: $disco non è un dispositivo valido.")"
        fi

        sleep 1
        printlines "$(con_grassetto "====================================")" \
        ;;
    2 | rimuovi_disco)
        registra_info "Rimuovi disco"
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
        if [ -b "$disco" ]; then
            read -rp "Sei sicuro di voler rimuovere $disco? (y/n): " conferma
            if [[ $conferma == [yY] ]]; then
                if command -v pvremove &>/dev/null; then
                    if pvremove "$disco" &>/dev/null; then
                        println "$(con_grassetto "Il disco $disco è stato rimosso con successo.")"
                        println "$(come_avviso "Nota: pvremove è stato usato per rimuovere il disco.")"
                    else
                        println "$(come_errore "Errore: Impossibile rimuovere il disco $disco.")"
                    fi
                elif command -v fdisk &>/dev/null; then
                    if fdisk -l "$disco" &>/dev/null; then
                        println "$(con_grassetto "Il disco $disco è stato rimosso con successo.")"
                        println "$(come_avviso "Nota: fdisk è stato usato per rimuovere il disco.")"
                    else
                        println "$(come_errore "Errore: Impossibile rimuovere il disco $disco.")"
                    fi
                else
                    println "$(come_errore "Errore: Il comando pvremove non è disponibile.")"
                    println "$(come_errore "Errore: Il comando fdisk non è disponibile.")"
                    println "$(come_errore "Errore: Impossibile rimuovere il disco $disco.")"
                fi
            else
                println "$(come_errore "Operazione annullata.")"
            fi
        else
            println "$(come_errore "Errore: $disco non è un dispositivo valido.")"
            sleep 1
        fi

        sleep 1
        printlines "$(con_grassetto "====================================")" \
        ;;
    3 | visualizza_dischi)
        registra_info "Visualizza dischi"
        clear
        
        printlines "" \
            "$(con_grassetto "====================================")" \
            "$(con_grassetto "        VISUALIZZA DISCHI")" \
            "$(con_grassetto "====================================")"        
        if command -v lsblk &>/dev/null; then
            lsblk
        elif command -v fdisk &>/dev/null; then
            fdisk -l
        else
            println "$(come_errore "Errore: Il comando lsblk non è disponibile.")"
            println "$(come_errore "Errore: Il comando fdisk non è disponibile.")"
        fi
        
        sleep 1
        printlines "$(con_grassetto "====================================")" \
        ;;
    4 | formatta_disco)
        registra_info "Formatta disco"
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
        if [ -b "$disco" ]; then
            read -rp "Sei sicuro di voler formattare $disco? (y/n): " conferma
            if [[ $conferma == [yY] ]]; then
                if command -v mkfs.ext4 &>/dev/null; then
                    if mkfs.ext4 "$disco" &>/dev/null; then
                        println "$(con_grassetto "Il disco $disco è stato formattato con successo.")"
                        println "$(come_avviso "Nota: mkfs.ext4 è stato usato per formattare il disco.")"
                    else
                        println "$(come_errore "Errore: Impossibile formattare il disco $disco.")"
                    fi
                else
                    println "$(come_errore "Errore: Il comando mkfs.ext4 non è disponibile.")"
                fi 
            else
                println "$(come_errore "Operazione annullata.")"
            fi
        else
            println "$(come_errore "Errore: $disco non è un dispositivo valido.")"
            sleep 1
        fi

        sleep 1
        printlines "$(con_grassetto "====================================")" \
        ;;
    5 | controlla_disco)
        registra_info "Controlla disco"
        clear

        printlines "" \
            "$(con_grassetto "====================================")" \
            "$(con_grassetto "        CONTROLLA DISCO")" \
            "$(con_grassetto "====================================")"
        read -rp "Inserisci il nome del disco da controllare (es. /dev/sdX): " disco
        if [ -b "$disco" ]; then
            if command -v smartctl &>/dev/null; then
                println "$(con_grassetto "Controllo del disco $disco in corso...")"
                smartctl -a "$disco"
                smartctl -l "$disco"
                println "$(con_grassetto "Controllo del disco $disco completato.")"
                println "$(come_avviso "Nota: smartctl è stato usato per controllare il disco.")"
            elif command -v hdparm &>/dev/null; then
                println "$(con_grassetto "Controllo del disco $disco in corso...")"
                hdparm -t "$disco"
                hdparm -T "$disco"
                println "$(con_grassetto "Controllo del disco $disco completato.")"
                println "$(come_avviso "Nota: hdparm è stato usato per controllare il disco.")"
            else
                println "$(come_errore "Errore: Il comando smartctl non è disponibile.")"
                println "$(come_errore "Errore: Il comando hdparm non è disponibile.")"
            fi 
        else
            println "$(come_errore "Errore: $disco non è un dispositivo valido.")"
        fi

        sleep 1
        printlines "$(con_grassetto "====================================")" \
        ;;
    6 | controlla_spazio_disco)
        registra_info "Controlla spazio disco"
        clear

        printlines "" \
            "$(con_grassetto "====================================")" \
            "$(con_grassetto "        CONTROLLA SPAZIO DISCO")" \
            "$(con_grassetto "====================================")"        
        if command -v df &>/dev/null; then
            df -h
            println "$(come_avviso "Nota: df è stato usato per controllare lo spazio disco.")"
        else
            println "$(come_errore "Errore: Il comando df non è disponibile.")"
        fi

        sleep 1
        printlines "$(con_grassetto "====================================")" \
        ;;
    7 | controlla_file_system)
        registra_info "Controlla file system"
        clear

        printlines "" \
            "$(con_grassetto "====================================")" \
            "$(con_grassetto "        CONTROLLA FILE SYSTEM")" \
            "$(con_grassetto "====================================")"
        read -rp "Inserisci il nome del file system da controllare (es. /dev/sdX1): " filesystem
        if [ -b "$filesystem" ]; then
            if command -v fsck &>/dev/null; then
                println "$(con_grassetto "Controllo del file system $filesystem in corso...")"
                fsck -f "$filesystem"
                println "$(con_grassetto "Controllo del file system $filesystem completato.")"
                println "$(come_avviso "Nota: fsck è stato usato per controllare il file system.")"
            else
                println "$(come_errore "Errore: Il comando fsck non è disponibile.")"
            fi 
        else
            println "$(come_errore "Errore: $filesystem non è un dispositivo valido.")"
        fi

        sleep 1
        printlines "$(con_grassetto "====================================")" \
        ;;
    8 | controlla_partizioni)
        registra_info "Controlla partizioni"
        clear

        printlines "" \
            "$(con_grassetto "====================================")" \
            "$(con_grassetto "        CONTROLLA PARTIZIONI")" \
            "$(con_grassetto "====================================")"
        read -rp "Inserisci il nome del disco da controllare (es. /dev/sdX): " disco
        if [ -b "$disco" ]; then
            if command -v fdisk &>/dev/null; then
                println "$(con_grassetto "Controllo delle partizioni del disco $disco in corso...")"
                fdisk -l "$disco"
                println "$(con_grassetto "Controllo delle partizioni del disco $disco completato.")"
                println "$(come_avviso "Nota: fdisk è stato usato per controllare le partizioni.")"
            else
                println "$(come_errore "Errore: Il comando fdisk non è disponibile.")"
            fi 
        else
            println "$(come_errore "Errore: $disco non è un dispositivo valido.")"
        fi

        sleep 1
        printlines "$(con_grassetto "====================================")" \
        ;;
    9 | controlla_raid)
        registra_info "Controlla RAID"
        clear

        printlines "" \
            "$(con_grassetto "====================================")" \
            "$(con_grassetto "        CONTROLLA RAID")" \
            "$(con_grassetto "====================================")"
        read -rp "Inserisci il nome del RAID da controllare (es. /dev/mdX): " raid
        if [ -b "$raid" ]; then
            if command -v mdadm &>/dev/null; then
                println "$(con_grassetto "Controllo del RAID $raid in corso...")"
                mdadm --detail "$raid"
                println "$(con_grassetto "Controllo del RAID $raid completato.")"
                println "$(come_avviso "Nota: mdadm è stato usato per controllare il RAID.")"
            else
                println "$(come_errore "Errore: Il comando mdadm non è disponibile.")"
            fi 
        else
            println "$(come_errore "Errore: $raid non è un dispositivo valido.")"
        fi

        sleep 1
        printlines "$(con_grassetto "====================================")" \
        ;;
    10 | controlla_lvm)
        registra_info "Controlla LVM"
        clear

        printlines "" \
            "$(con_grassetto "====================================")" \
            "$(con_grassetto "        CONTROLLA LVM")" \
            "$(con_grassetto "====================================")"
        read -rp "Inserisci il nome del LVM da controllare (es. /dev/vgX/lvX): " lvm
        if [ -b "$lvm" ]; then
            if command -v lvdisplay &>/dev/null; then
                println "$(con_grassetto "Controllo del LVM $lvm in corso...")"
                lvdisplay "$lvm"
                println "$(con_grassetto "Controllo del LVM $lvm completato.")"
                println "$(come_avviso "Nota: lvdisplay è stato usato per controllare il LVM.")"
            else
                println "$(come_errore "Errore: Il comando lvdisplay non è disponibile.")"
            fi 
        else
            println "$(come_errore "Errore: $lvm non è un dispositivo valido.")"
        fi

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