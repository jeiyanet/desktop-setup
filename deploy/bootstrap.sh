#!/usr/bin/bash
read -r -p "Is the time correct? (y/n): " time
if [[ "${time}" == "n" ]]; then
  echo "Correct the time please"
  exit 1
fi

sudo apt update
sudo apt dist-upgrade -y
sudo apt install -y ansible-core git

tags=""
read -r -p "Use default role? (y/n): " defaultYes2
if [ "$defaultYes2" = "y" ]; then
  defaultRole="default"
  [ -n "$tags" ] && tags+=","
  tags+="$defaultRole"
fi

read -r -p "Use laptop role? (y/n): " laptopYes
if [ "$laptopYes" = "y" ]; then
  laptopRole="laptop"
  [ -n "$tags" ] && tags+=","
  tags+="$laptopRole"
fi

read -r -p "Use kali role? (y/n): " kaliYes
if [ "$kaliYes" = "y" ]; then
  kaliRole="kali"
  [ -n "$tags" ] && tags+=","
  tags+="$kaliRole"
fi

sudo ansible-pull -U https://github.com/jeiyanet/desktop-setup.git --tags "$tags"


flatpak remote-add --if-not-exists --user flathub https://dl.flathub.org/repo/flathub.flatpakrepo

pipx install ansible-lint
pipx install eyed3
pipx install gallery-dl
pipx install tldr
pipx install yt-dlp

sudo nala fetch
sudo nala update
