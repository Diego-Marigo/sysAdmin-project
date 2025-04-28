# **Libreria per funzioni di stampa a schermo**

function print() {
    printf "%s" "$*"
}

function println() {
    printf "%s\n" "$*"
}

function printlines() {
    for line in "$@"; do
        println "${line}"
    done
}
