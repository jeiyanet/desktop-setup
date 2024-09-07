read -p "Is the time correct? (y/n): " time
if [[ "${time}" == "n" ]]; then
  echo "Correct the time please"
  exit 1
fi

sudo apt update
sudo apt dist-upgrade -y
sudo apt install -y ansible-core git

sudo ansible-pull -U https://github.com/jeiyanet/desktop-setup.git

flatpak remote-add --if-not-exists --user flathub https://dl.flathub.org/repo/flathub.flatpakrepo

pipx install ansible-lint
pipx install eyed3
pipx install gallery-dl
pipx install tldr
pipx install yt-dlp

sudo nala fetch
sudo nala update
