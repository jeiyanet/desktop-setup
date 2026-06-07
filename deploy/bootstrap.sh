#!/usr/bin/bash
read -r -p "Is the time correct? (y/n): " time
if [[ "${time}" == "n" ]]; then
  echo "Correct the time please"
  exit 1
fi

sudo apt update
sudo apt dist-upgrade -y
sudo apt install -y ansible-core git

tags="system"
read -r -p "Use debian role? (y/n): " debianYes
if [ "$debianYes" = "y" ]; then
  debianRole="debian"
  [ -n "$tags" ] && tags+=","
  tags+="$debianRole"
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
sudo ansible-pull -U file://$PWD/desktop-setup --tags "$tags"

distro=$(cat /etc/os-release | grep "^ID=" | cut -d'=' -f2)

if [ "$distro" != "kali" ]; then
  sudo nala fetch
  sudo nala update
fi
