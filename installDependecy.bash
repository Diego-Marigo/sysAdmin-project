#!/usr/bin/env bash

# Installazione delle dipendenze necessarie per il progetto
# Questo script deve essere eseguito con i privilegi di root
sudo apt-get update
sudo apt-get upgrade -y
sudo apt install -y apt bash cut chage chmod chpasswd df fdisk free fsck ifconfig iftop ip mkfs.ext4 netstat ping reboot rsync systemctl shutdown tail top ufw useradd userdel usermod who loginctl