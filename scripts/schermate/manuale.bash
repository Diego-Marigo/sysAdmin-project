function schermata_manuale() {
    printlines \
        "" \
        "$(con_grassetto "Usage:") $0 [OPZIONI]" \
        "" \
        "$(con_grassetto "-h, --help")        $(con_sottolineatura "Mostra questo messaggio e esce")" \
        "$(con_grassetto "-v, --version")     $(con_sottolineatura "Stampa la versione e esce")" \
        "$(con_grassetto "-r, --registro")    $(con_sottolineatura "<file>")   $(con_sottolineatura "Override del percorso del log (default: ${registro})")" \
        "$(con_grassetto "-d, --debug")       $(con_sottolineatura "Attiva DEBUG=1 per tutta la durata")" \
        "$(con_grassetto "--no-color")        $(con_sottolineatura "Disabilita colori/stilizzazioni nello script")" \
        ""
    exit 0
}