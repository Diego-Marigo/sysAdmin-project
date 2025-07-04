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