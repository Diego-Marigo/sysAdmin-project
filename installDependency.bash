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
sudo apt install -y apt bash cut chage chmod chpasswd df fdisk free fsck ifconfig iftop ip mkfs.ext4 netstat ping reboot rsync systemctl shutdown tail top ufw useradd userdel usermod who loginctl