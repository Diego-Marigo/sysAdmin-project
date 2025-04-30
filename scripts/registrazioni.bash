# Libreria per le registrazioni
#
# Il registro, definito su $registro, defaulta su "./.log.txt"
# Usa apri_registro() per leggerlo, ovunque esso sia
# Usa registra_info/successo/errore/avviso per lanciare una registrazione
#
# Le registrazioni avranno un aspetto simile questo:
# 13:25:49 [INFO] Sono entrato nella funzione F
# 13:25:50 [INFO] Sono uscito dalla funzione F
#
#
# Struttura del file:
# 0. Setup
# 1. Funzioni di registrazione
# 2. Funzione di lettura

#
#
# 0. Setup

# Se il registro non è definito, allora usa il valore di default
if [[ -z "${registro}" ]]; then
    file_dir="$(dirname "${BASH_SOURCE[0]}")"
    registro="${file_dir}/.log.txt"
fi

# Eliminazione di eventuali alias. "2>/dev/null" significa "silenzia se fallisce"
unalias date 2>/dev/null

# Impostazione del timestamp
function _timestamp() {
    date "+%T" # La data non è utile. Registriamo solo l'orario
}

# Assicurati che il registro esista
touch "${registro}"

# 1. Funzioni di registrazione
function registra_info() {
    printf "%s [INFO]  %s\n" "$(_timestamp)" "$*" >>"${registro}"
}

function registra_avviso() {
    printf "%s [WARN]  %s\n" "$(_timestamp)" "$*" >>"${registro}"
}

function registra_errore() {
    printf "%s [ERROR] %s\n" "$(_timestamp)" "$*" >>"${registro}"
}

function registra_debug() {
    printf "%s [DEBUG] %s\n" "$(_timestamp)" "$*" >>"${registro}"
}

# 2. Funzione di lettura
function apri_registro() {
    "${EDITOR}" "${registro}"
}
