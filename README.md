###### Università Ca' Foscari - Venezia (2024/2025)

# Progetto Laboratorio ed Amministrazione di sistema

**Autori**: Diego Marigo, Nicola Miotto

**Versione:** 1.0

**Versione Sistema Operativo:** Linux

### Descrizione:

Il programma è progettato per assistere gli amministratori di sistema nella gestione di sistemi Linux. Fornisce strumenti e script utili per semplificare attività comuni di amministrazione, come la gestione dei file di log, l'esecuzione di script automatizzati e il monitoraggio del sistema. L'obiettivo è migliorare l'efficienza e ridurre gli errori nelle operazioni quotidiane.

## Struttura del progetto
La struttura del progetto è organizzata in diverse directory e file, ognuno con uno scopo specifico:
- `eseguibile.bash`: Script principale da eseguire per avviare il programma.
- `/scripts/log.txt`: File contenente i log generati dal programma.
- `/scripts/schermate/`: Directory che contiene le varie schermate utilizzate dal programma.
- `README.md`: Questo file, contenente la documentazione del progetto.
- `LICENSE`: File di licenza del progetto.

## Esecuzione script

### Requisiti di sistema
Pacchetti utilizzati all'interno del programma:
- `apt`: Per la gestione dei pacchetti.
- `bash`: Per l'esecuzione degli script.
- `cut`: Per elaborare i file di testo.
- `chage`: Per modificare le informazioni sulle password degli utenti.
- `chmod`: Per modificare i permessi dei file.
- `chpasswd`: Per cambiare le password degli utenti.
- `df`: Per visualizzare lo spazio su disco disponibile.
- `dpkg`: Per la gestione dei pacchetti.
- `fdisk`: Per la gestione delle partizioni del disco.
- `free`: Per visualizzare la memoria disponibile.
- `fsck`: Per controllare e riparare i file system.
- `hdparm`: Per monitorare le prestazioni dei dischi.
- `ifconfig`: Per visualizzare e configurare le interfacce di rete.
- `iftop`: Per monitorare il traffico di rete in tempo reale.
- `ip`: Per visualizzare e configurare le interfacce di rete.
- `mkfs.ext4`: Per formattare le partizioni in ext4.
- `netstat`: Per visualizzare le connessioni di rete.
- `reboot`: Per riavviare il sistema.
- `rsync`: Per sincronizzare file e directory.
- `smartctl`: Per monitorare lo stato di salute dei dischi.
- `systemctl`: Per gestire i servizi di sistema.
- `shutdown`: Per spegnere o riavviare il sistema.
- `tail`: Per visualizzare le ultime righe di un file.
- `top`: Per monitorare le risorse di sistema in tempo reale.
- `ufw`: Per gestire il firewall.
- `useradd`: Per aggiungere nuovi utenti al sistema.
- `userdel`: Per rimuovere utenti dal sistema.
- `usermod`: Per modificare le informazioni degli utenti.
- `who`: Per visualizzare gli utenti connessi al sistema.

#### Installazione dei requisiti
Assicurarsi di avere installato i seguenti pacchetti sul sistema:
```bash
sudo apt update
sudo apt upgrade
sudo apt install apt bash cut chage chmod chpasswd df dpkg fdisk free fsck hdparm ifconfig iftop ip mkfs.ext4 netstat reboot rsync smartctl systemctl shutdown tail top ufw useradd userdel usermod who
```
Questi pacchetti sono generalmente preinstallati su molte distribuzioni Linux, ma è sempre meglio verificarne la presenza.

### Installazione ed esecuzione del programma
1. Clonare il repository GitHub:
    ```bash
    git clone https://github.com/Diego-Marigo/sysAdmin-project.git
    ```

2. Spostarsi nella directory del progetto:
    ```bash
    cd sysAdmin-project
    ```

3. Rendere eseguibile lo script principale:
    ```bash
    chmod +x eseguibile.bash
    ```

4. Avviare lo script con permessi di superutente:
    ```bash
    sudo ./eseguibile.bash
    ```

### Argomenti dello script
Lo script principale `eseguibile.bash` accetta diversi argomenti per eseguire operazioni specifiche. Gli argomenti disponibili sono:
- `--help` | `-h`: Mostra l'elenco dei comandi disponibili e una breve descrizione.
- `--version` | `-v`: Mostra la versione corrente del programma.
- `--registro` | `-r`: //TODO
- `--debug` | `-d`: Abilita la modalità di debug, mostrando informazioni dettagliate sull'esecuzione del programma. Utile per identificare e risolvere eventuali problemi.
- `--no-color`: Disabilita l'uso dei colori nell'output del programma, utile per ambienti che non supportano la colorazione del testo o per una visualizzazione più semplice.