# Setup for my Computers with IaC

This is intended for: 

- Debian 12 with Gnome.
- Kali Linux 2024.4

# Installation

In your Kali box, run this command in the terminal:

```bash
wget "https://raw.githubusercontent.com/jeiyanet/desktop-setup/refs/heads/main/deploy/bootstrap.sh" && \
chmod +x bootstrap.sh
```

```bash
./bootstrap.sh
```

> I'm still trying to find a way to shorten the URL.

# Limitations

- Flatpaks: this script cannot install flatpak applications because adding the flatpak repo requires reboot or logout. Some Flatpaks that may be necessary are:
  
  - Discord: communication
  
  - Chromium: sandboxed alternative browser
  
  - Flatseal: flatpak permissions manager
  
  - Frog: image to text converter
  
  - GPU Screen Recorder: screen record
  
  - KeePassXC: local password manager
  
  - LocalSend: file sharing
  
  - MarkText: markdown editor
  
  - Okteta: GUI hex viewer
  
  - OnlyOffice: office suite
  
  - Shotcut: video editor
  
  - TigerVNC: vnc client
  
  - Zettlr: note-taking

- Python Dev Environment: I have not gotten around to making a full python environment for pentesting or general development work. Some libraries that may be needed are:
  
  - Numpy
  
  - Pandas
  
  - Pwntools
  
  - Pycryptodome
  
  > Alternatively, you can install Anaconda which have most of these by default.

- VSCode: It would be safer to download the .deb package from the official vscode website.
