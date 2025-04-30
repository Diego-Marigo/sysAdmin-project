# **Libreria delle schermate del programma**
# Qui vengono definite le schermate del programma

file_dir="$(dirname "${BASH_SOURCE[0]}")"

source "${file_dir}/manuale.bash"               # Menu Help
source "${file_dir}/principale.bash"            # Menu Principale
source "${file_dir}/monitoraggio.bash"          # Menu Monitoraggio
source "${file_dir}/gestione_disco.bash"        # Menu Gestione Disco
source "${file_dir}/gestione_pacchetti.bash"    # Menu Gestione Pacchetti
source "${file_dir}/gestione_servizi.bash"      # Menu Gestione Servizi
source "${file_dir}/gestione_rete.bash"         # Menu Gestione Rete
source "${file_dir}/gestione_utenti.bash"       # Menu Gestione Utenti
source "${file_dir}/operazioni_di_sistema.bash" # Menu Operazioni di Sistema

