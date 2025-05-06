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
Pacchetti necessari per l'esecuzione del programma:
- `apt`: Per la gestione dei pacchetti.
- `bash`: Per l'esecuzione degli script.
- `df`: Per visualizzare lo spazio su disco disponibile.
- `dpkg`: Per la gestione dei pacchetti.
- `fdisk`: Per la gestione delle partizioni del disco.
- `free`: Per visualizzare la memoria disponibile.
- `fsck`: Per controllare e riparare i file system.
- `hdparm`: Per monitorare le prestazioni dei dischi.
- `lvdisplay`: Per visualizzare le informazioni sui volumi logici.
- `mkfs.ext4`: Per formattare le partizioni in ext4.
- `mdadm`: Per gestire i RAID software.
- `netstat`: Per visualizzare le connessioni di rete.
- `smartctl`: Per monitorare lo stato di salute dei dischi.
- `top`: Per monitorare le risorse di sistema in tempo reale.
- `who`: Per visualizzare gli utenti connessi al sistema.

### Installazione dei pacchetti
Per eseguire il programma, è necessario scaricarlo da GitHub e avviarlo con permessi di superutente (sudo). Seguire questi passaggi:

//TODO: Aggiungere i comandi per installare i pacchetti necessari


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