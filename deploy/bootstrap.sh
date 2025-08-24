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

git clone https://github.com/jeiyanet/desktop-setup.git
read -r -p "Enter your user: " osUser
sed --in-place "s/jeiya/$osUser/g" ./desktop-setup/roles/kali/vars/main.yml

sudo ansible-pull -U file://$PWD/desktop-setup --tags "$tags"

flatpak remote-add --if-not-exists --user flathub https://dl.flathub.org/repo/flathub.flatpakrepo

pipx install ansible-lint
pipx install eyed3
pipx install gallery-dl
pipx install tldr
pipx install yt-dlp


if [ "$kaliYes" = "y" ]; then
    sudo gem install zsteg
fi

distro=$(cat /etc/os-release | grep "^ID=" | cut -d'=' -f2)

if [ "$distro" != "kali" ]; then
  sudo nala fetch
  sudo nala update
fi

