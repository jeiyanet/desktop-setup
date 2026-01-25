# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=100000
HISTTIMEFORMAT="%Y-%m-%d %T "

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
  export green=32
  export user=34
  export host=35
  export dir=30
  export prompt=31
  export white=97
    PS1='\[\e[1;${green}m\]┌─\[\e[1;${green}m\][\[\e[1;${user}m\]\u\[\e[1;${green}m\]]\[\e[1;${green}m\]\[\e[1;${green}m\]─\[\e[1;${green}m\][\[\e[1;${host}m\]\h\[\e[1;${green}m\]\[\e[1;${green}m\]]\[\e[1;${white}m\] \T \e[1;${dir}m\]\w\n\[\e[1;${green}m\]└──\[\e[1;${green}m\][\[\e[1;${prompt}m\]\$\[\e[1;${green}m\]]\[\e[0m\] '
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;94m\]\u\[\033[38;5;206m\]@\[\033[1;32m\]\h\[\033[00m\] \[\033[90m\]\w\[\033[1;32m\]
#󰥭\[\033[0m\] '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Export Paths
export EDITOR=nvim

# navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias doc="cd \$HOME/Documents/"
alias dow="cd \$HOME/Downloads/"
alias img="cd \$HOME/Pictures/"
alias vid="cd \$HOME/Videos/"
alias msc="cd \$HOME/Music/"
alias gitre="cd /home/mount/storage/gitrepo/"
alias td="cd /home/mount/storage/test/"

# typos
alias cler="clear"
alias nivm="nvim"
alias trsah="trash"
alias vi="nvim"
alias namp="nmap"
alias clera="clear"
alias c="cd"
alias rm="trash"

# ls
alias lh="ls -alFh --hyperlink"
alias ll="ls -l"
alias la="ls -la"
alias l="ls -alFh"
alias ls-l="ls -l"
alias dir="ls -ld --color=auto --format=vertical */ .*/"

# general
alias edu="firefox -P edu & exit"
alias echo="echo -n"
alias nmapp="nmap -p- --min-rate 5000 -sV"
alias todo="nvim $HOME/Documents/TODO"
alias nano="nano -ZDEFLSil%0T4"
alias grup-update="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias shuffle1="ls -1 --hyperlink *.png |  shuf | head -1"
alias shuffle10="ls -1 --hyperlink *.png |  shuf -n 10"
alias srd="sudo rm -vrfI --one-file-system"
alias rd="rm -vrfI --one-file-system"
alias md="mkdir -pv"
alias smd="sudo mkdir -pv"
alias cp="cp -vrip"
alias portchk="nc -zv"
alias mv="mv -vi"
alias ping="ping -c 3"
alias mp4="yt-dlp --no-mtime -o '%(id)s_%(uploader_id)s_%(upload_date)s_%(title)s_(%(duration)ss)_[%(resolution)s]' --merge-output-format mp4 --embed-thumbnail"
alias mp3="yt-dlp --embed-thumbnail --no-mtime --extract-audio --audio-format mp3 --audio-quality 0 -o '%(id)s_%(uploader_id)s_%(upload_date)s_%(title)s_(%(duration)ss)_[%(resolution)s]'"
alias tarz="tar cvaf"
alias taru="tar xvf"
alias starz="sudo tar cvaf"
alias staru="sudo tar xvf"
alias tarzz="tar -c -I 'zstd -19 -T0' -f"
alias ssho="ssh -o PubkeyAuthentication=no"
alias sshco="ssh-copy-id"
alias bashrc="vi \$HOME/.bashrc && . \$HOME/.bashrc"
alias svi="sudoedit"
alias pinghome="sudo fping -ag 192.168.1.1 192.168.1.250 2>/dev/null"
alias mansearch="apropos"
alias sshkeygen="ssh-keygen -t ed25519"
alias sbstate="mokutil --sb-state"
alias waychk="echo \$XDG_SESSION_TYPE"
alias rfclam="sudo freshclam"
alias scand="clamdscan --fdpass"
alias scan="clamscan"
alias h="history | grep "
alias py="python3.11"
alias venv="source .venv/bin/activate"
alias neofetch="neofetch --ascii \$HOME/.config/neofetch/debian"
alias mkpass="openssl rand -base64"
alias mpv="mpv --hwdec=vaapi"
alias dd="dd bs=4M"
alias dconfS="dconf dump / > dconf-settings.ini"
alias dconfL="dconf load / < dconf-settings.ini"
alias copy="rsync -avh --progress --delete"

# git
alias gst="git status"
alias gbr="git branch"
alias gad="git add -A"
alias gadd="git add -A"
alias gcom="git commit -am"
alias gck="git checkout"
alias gpush="git push origin main"
alias gpushm="git push origin master"
alias gcl="git clone"
alias gsub="git submodule add"
alias gres="git restore ."

# ansible
alias ap="ansible-playbook"
alias vaulten="ansible-vault encrypt --vault-password-file \$HOME/.vault_key"
alias vaultde="ansible-vault decrypt --vault-password-file \$HOME/.vault_key"
alias vaulted="ansible-vault edit --vault-password-file \$HOME/.vault_key"
alias vaultvi="ansible-vault edit --vault-password-file \$HOME/.vault_key"
alias vaultview="ansible-vault view --vault-password-file \$HOME/.vault_key"
alias vault="ansible-vault view --vault-password-file \$HOME/.vault_key \$HOME/Documents/gitrepo/homelab/ansible/vault.yaml"

# zypper
#alias update="sudo zypper ref && sudo zypper dup && flatpak update && pipx upgrade-all && tldr -u && sudo freshclam"
#alias zrm="sudo zypper rm --clean-deps"
#alias zin="sudo zypper in"
#alias zsr="zypper search"

# nala
alias update="sudo nala upgrade && flatpak update && pipx upgrade-all && tldr -u && sudo freshclam && docker system prune && exit"
alias nrm="sudo nala autopurge && sudo nala clean"
alias nin="sudo nala install"
alias npg="sudo nala purge"
alias nsr="nala search"
alias nsh="nala show"
alias nhs="nala history"
alias nun="sudo nala history undo"

# flatpak
alias flatmc="flatpak run org.prismlauncher.PrismLauncher"
alias flatobs="flatpak run com.obsproject.Studio"
alias flatpurge="flatpak remove --delete-data"

# golang
alias goinit="go mod init"
alias gotidy="go mod tidy"
alias gor="go run"
alias gob="go build ."
alias got="go test -v -cover"
alias goben="go test -bench=."

# temp
alias mcpe="echo 'kK*%gLVTr47H\$ZJgh8KTpXH^xSvayH54yRVib!osFz@yHv^8Txec&dsdo9QFp5\$z'"

export PATH=$PATH:$HOME/.local/bin
export PATH="$HOME/go/bin:$PATH"
export PATH=$PATH:/usr/local/go/bin
alias today=$"date +'%Y_%m_%d'"
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:"$HOME/.local/bin/ideaIU-2024.3.1.1/idea-IU-243.22562.218/bin"

# highlight special files
export LS_COLORS="$LS_COLORS:\
*.yaml=01;35:\
*.yml=01;35:\
*.conf=00;32:\
*TODO=01;32:\
*.md=01;30:\
*.sh=01;31;41:\
*.bak=00;09:\
*.j2=38;5;208:\
*.iso=01;31"

# functions and scripts
cht() {
  curl cheat.sh/"$1"
}

dly() {
  echo "input video links: "
  read -ra videos
  echo "videos are: ${videos[*]}"
  mp4="yt-dlp --embed-subs --no-mtime -o '%(id)s_%(uploader_id)s_%(upload_date)s_%(title)s_(%(duration)ss)_[%(resolution)s]' --merge-output-format mp4 --embed-thumbnail --path $HOME/mount/storage/archive/media/videos"
  $mp4 "${videos[@]}"
  exit
}

dlyd() {
  current=$(pwd)
  correct="$HOME/mount/storage/archive/media/videos"

  if [ "$current" == "$correct" ]; then
    echo "correct directory"
  else
    echo "changing directory to $correct"
    cd "$correct" || exit 1
  fi

  read -rp "input channel name: " dir
  mkdir "$dir" && cd "$dir" || exit
  echo "input video links:"
  read -ra videos
  echo "videos are: ${videos[*]}"
  mp4="yt-dlp --embed-subs --no-mtime -o '%(id)s_%(uploader_id)s_%(upload_date)s_%(title)s_(%(duration)ss)_[%(resolution)s]' --merge-output-format mp4 --embed-thumbnail"
  $mp4 "${videos[@]}"
}

secrets() {
  gpg --decrypt --quiet "$HOME/Documents/secrets.txt.gpg" > "$HOME/Documents/secrets.txt"
  rm "$HOME/Documents/secrets.txt.gpg"
  vi "$HOME/Documents/secrets.txt"
  gpg --encrypt --sign --recipient aniagjoseph593@gmail.com "$HOME/Documents/secrets.txt"
  rm "$HOME/Documents/secrets.txt"
}

mntg() {
  lsblk
  read -r disk
  sudo mount /dev/$disk "$HOME/.var/app/com.valvesoftware.Steam/external_drive"
}

umntg() {
  sudo umount /dev/mapper/games
  sudo cryptsetup luksClose /dev/mapper/games
  lsblk
}

temp() {
  sudo umount /dev/sdc1
  sudo mount /dev/sdc1 "$HOME/mount/temp"
  lsblk
}

tips() {
  cat "$HOME/Documents/tips/$1"
}

ard() {
  read -rp "enter or exit arduino dev (y/n): " a
  if [[ $a == "y" ]]; then
    sudo chmod a+rw /dev/ttyACM0
  else
    sudo chmod o-rw /dev/ttyACM0
  fi
}

esp() {
  read -rp "enter or exit esp dev (y/n): " a
  if [[ $a == "y" ]]; then
    sudo chmod a+rw /dev/ttyUSB0
  else
    sudo chmod o-rw /dev/ttyUSB0
  fi
}

gadl() {
  correct="$HOME/mount/storage/archive/media/gallery-dl/2/"
  linkdir="$HOME/mount/storage/archive/media/"
  #correct="/media/jeiya/a2891e6a-9f11-475c-8044-1cf16a503b50/storage/archive/media"

  nvim "$linkdir"/links.txt
  mapfile -t valid_links < <(grep -v ^\# "$linkdir/links.txt" | grep https)
  echo "${valid_links[@]}" | tr ' ' '\n' | xargs -I {} -P 8 gallery-dl -d "$correct" {}
  sed 's/^/#/' -i "$linkdir"/links.txt
}

makemusic() {
  echo "input music links: "
  read -ra music
  echo "music are: ${music[*]}"
  echo "what language: jp, eng, kpop"
  read -r lang
  dirorg="$HOME/Music/editing/original/$lang/"
  dirart="$HOME/Music/editing/thumbnails/$lang/"
  diraud="$HOME/Music/editing/audio/$lang/"
  mp3="yt-dlp --embed-thumbnail --no-mtime --extract-audio --audio-format mp3 --audio-quality 0 --path $dirorg"
  $mp3 "${music[@]}"

  for i in "$dirorg"*.mp3; do 
    thumbnail="$dirart$(basename "${i%.*}.png")";
    ffmpeg -i "$i" -map 0:v -map -0:V -c copy "$thumbnail"; 
  done

  read -rp "continue? "

  for a in "$dirart"*.png; do 
    final="$diraud$(basename "${a%.*}.mp3")";
    eyeD3 --add-image "$a":FRONT_COVER "$final";
  done
}

music() {
  echo "input music links: "
  read -ra music
  echo "music are: ${music[*]}"
  dirorg="$HOME/Music/editing/"
  mp3="yt-dlp --embed-thumbnail --no-mtime --extract-audio --audio-format mp3 --audio-quality 0 --paths $dirorg"
  $mp3 "${music[@]}"

  for i in "$dirorg"*.mp3; do
    # Detect the silence/no-audio that has a volume of 1 at the beginning of the file
    # Reverse the audio
    # Redo the silence detection but this time, at the end of the file
    # Reverse the audio back to its original order
    sox "$i" "${i%.mp3}-processed.mp3" silence 1 0.1 1% reverse silence 1 0.1 1% reverse
    trash "$i"
  done

  for a in "$dirorg"*.webp; do 
    final="$dirorg$(basename "${a%.*}.mp3")";
    eyeD3 --add-image "$a":FRONT_COVER "$final";
  done
}


grupdate() {
#    # Check if fsck options are present in the configuration
#  if grep -q "#GRUB_CMDLINE_LINUX_DEFAULT=\"quiet\ fsck.mode=force" "/etc/default/grub"; then
#    echo "GRUB is configured to use normal quiet mode."
#  else
#    echo "GRUB is configured to use fsck mode."
#  fi
#
#  echo "FSCK or Normal (f/n)"
#  read -r state
#
#  if [[ $state == "f" ]]; then
#    echo "running fsck"
#    sudo sed -i "9s/^/#/" /etc/default/grub  # Comment the normal mode
#    sudo sed -i "10s/^#//" /etc/default/grub # Uncomment the fsck mode
#    sudo grub-mkconfig -o /boot/grub/grub.cfg
#  elif [[ $state == "n" ]]; then
#    echo "running normal"
#    sudo sed -i "9s/^#//" /etc/default/grub  # Unomment the normal mode
#    sudo sed -i "10s/^/#/" /etc/default/grub # Comment the fsck mode
#    sudo grub-mkconfig -o /boot/grub/grub.cfg
#  else
#    echo "not a valid input"
#  fi
#
#  echo "Reboot (y/n)"
#  read -r rebootop
#
#  if [[ $rebootop == "y" ]]; then
#    sudo reboot
#  fi
  sudo grub-mkconfig -o /boot/grub/grub.cfg
}

vt() {
  export run="\e[1;32m"
  export task="\e[1;31m"
  export white="\033[0m"
  echo -e "Running ${task}FILE ${run}"
  file "$1"
  echo -e "${white}Running ${task}CLAMAV ${run}"
  scand "$1"
  scan "$1"
  echo -e "${white}Running ${task}OKTETA ${run}"
  flatpak run --file-forwarding org.kde.okteta @@ "$1" @@
  echo -e ${white}
}

gobuild() {
  printf "Choose Arch: amd64, arm64\n ~> "
  read -r arch
  printf "Choose OS: linux, windows, darwin\n ~> "
  read -r OS
  GOARCH=$arch GOOS=$OS go build .
}
gosecret() {
  printf "Your Variable \n ~> "
  read -r value 
  export secret=$value
}

gitman() {
  git status
  echo "Input your files: "
  read -ra files
  git add ${files[*]}
  echo "Commit Message: "
  read -r comm
  git commit -m $comm
  git push
}

alias mcpass="echo -e 'AItw0WKV7Wv2IHqAIwFojN8FVYi3dFh30R0DkRHOKXW4ljn8\n'"
alias compile="gcc main.c -g -o elf && ./elf"
