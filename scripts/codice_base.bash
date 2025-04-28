# Questo file è solo da importare e mai lanciare, perciò una shebang non è appropriata
#

export versione="0.0.1"
export nome_programma_sysadmin="NOME_DA_DEFINIRE"

function se_chiamato_come_script_lanciare() {
    local funzione="$1"
    shift
    local caller="${BASH_SOURCE[1]}" # file che ha importato la funzione

    if [[ "${caller}" == "${0}" ]]; then # eseguito come script
        "$funzione" "$@"
    fi
}

function se_chiamato_come_libreria_lanciare() {
    local funzione="$1"
    shift
    local caller="${BASH_SOURCE[1]}" # file che ha importato la funzione

    if [[ "${caller}" != "${0}" ]]; then # eseguito come script
        "$funzione" "$@"
    fi
}

function ha_genitore_accessibile() {
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
