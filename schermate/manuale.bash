function schermata_manuale() {
    printlines "" \
        "$(con_grassetto "====================================")" \
        "$(con_grassetto "        MANUALE D'USO")" \
        "$(con_grassetto "====================================")" \
        "" \
        "$(con_grassetto "Usage:") ./$(basename "$0") [OPZIONI]" \
        "" \
        "$(con_grassetto "OPZIONI:")" \
        "$(con_grassetto "-c, --check")       $(con_sottolineatura "Controlla i requisiti di sistema")" \
        "$(con_grassetto "-h, --help")        $(con_sottolineatura "Mostra questo messaggio e esce")" \
        "$(con_grassetto "--no-color")        $(con_sottolineatura "Disabilita colori e stilizzazioni nello script")" \
        "$(con_grassetto "-r, --registro")    $(con_sottolineatura "<file> Override del percorso del log (default: ${registro})")" \
        "$(con_grassetto "-v, --version")     $(con_sottolineatura "Stampa la versione e esce")" \
        "" \
        "$(con_grassetto "====================================")"
}