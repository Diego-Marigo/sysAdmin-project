#!/usr/bin/env bash
# Contrololo di esecuzione: questo script deve essere eseguito con i privilegi di root
if [[ $EUID -ne 0 ]]; then
    echo "Questo script deve essere eseguito con i privilegi di root." >&2
    exit 1
fi

# Installazione delle dipendenze necessarie per il progetto
echo "Inizio dell'installazione delle dipendenze..."
sleep 3
sudo apt-get update
sudo apt-get upgrade -y
sudo apt install -y apt bash fdisk iftop iputils-ping rsync systemctl ufw coreutils

