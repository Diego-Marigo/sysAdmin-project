# Presentazione

\<da stilare>

# Struttura del progetto

Oltre al **README.md**, sarà presente una cartella **scripts/** contenente tutti
i file bash, un file bash che farà da entry point (per ora chiamato
**eseguibile.bash**), ed eventualmente un file **log.txt** dove di default
verranno annotati gli eventi del programma, se richiesto

# Considerazioni per bash

## Percorsi relativi

Questo progetto non è pensato per essere installato, di conseguenza sarà
necessario usare dei collegamenti relativi tra i vari file. In bash una linea
come **source ./path/to/file** importerà un file in relazione alla posizione del
**chiamante**, non del **filechiamante**. Per risolvere questo problema,
occorrerà recuperare la posizione del file stesso. Come implementazione di base,
salviamo in una variabile _file_dir_ il percorso con questo comando:

```bash
filedir="$(dirname "${BASH_SOURCE[0]}")"
```

Per le importazioni si userà poi:

```bash
source "${filedir}/path/to/file"
```

## Natura delle TUI

Il programma non potrà essere agevolmente usato per inoltrare o ricevere dati
tramite pipe Tutte le funzionalità dovranno essere incapsulate Poche opzioni
saranno disponibili, come --version (forse?), --help, --debug/log_path e poco
altro
