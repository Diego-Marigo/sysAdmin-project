export versione="1.0"
export nome_programma="ADMINHELP"
export autori="Diego Marigo, Nicola Miotto"


function se_chiamato_come_script_lanciare() {       # Funzione per eseguire una funzione se lo script è chiamato direttamente
    local funzione="$1"
    shift
    local caller="${BASH_SOURCE[1]}"

    if [[ "${caller}" == "${0}" ]]; then 
        "$funzione" "$@"
    fi
}

function se_chiamato_come_libreria_lanciare() {     # Funzione per eseguire una funzione se lo script è chiamato come libreria
    local funzione="$1"
    shift
    local caller="${BASH_SOURCE[1]}" 

    if [[ "${caller}" != "${0}" ]]; then 
        "$funzione" "$@"
    fi
}

function ha_genitore_accessibile() {            # Controlla se il file genitore è accessibile
    local file="$1"
    local dir
    dir="$(dirname "${file}")"
    if [[ ! -d "${dir}" ]]; then
        println "$(come_errore "Errore:") directory ${dir} inesistente." >&2
        exit 1
    fi
    if [[ ! -w "${dir}" ]]; then
        println "$(come_errore "Errore:") permessi insufficienti per scrivere in ${dir}." >&2
        exit 1
    fi
}

function requisiti() {
    local type="$1"
    local check="$2"
    if ! command -v "$type" &>/dev/null; then
        if [[ ! "$check" == "check" ]]; then
            println "$(come_errore "Errore: requisiti di sistema non soddisfatti.")"
            println "$(come_avviso "Impossibile proseguire senza comando $type.")"
            sleep 2
        else
            println "$(come_errore "Requisiti di sistema non soddisfatti: comando $type mancante.")"
        fi
        return 1
    fi
    return 0
}