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
Per eseguire il programma, è necessario scaricarlo da GitHub e avviarlo con permessi di superutente (sudo). Seguire questi passaggi:

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

Sono inoltre disponibili dei comandi aggiuntivi che possono essere passati come argomenti allo script per personalizzare il comportamento del programma. Per esempio:

- `--help` | `-h`: Mostra l'elenco dei comandi disponibili e una breve descrizione.
- `--version` | `-v`: Mostra la versione corrente del programma.
- `--registro` | `-r`: //TODO
- `--debug` | `-d`: Abilita la modalità di debug, mostrando informazioni dettagliate sull'esecuzione del programma. Utile per identificare e risolvere eventuali problemi.
- `--no-color`: Disabilita l'uso dei colori nell'output del programma, utile per ambienti che non supportano la colorazione del testo o per una visualizzazione più semplice.