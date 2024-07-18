#!/bin/bash


# -> Update and upgrade <- #
sudo apt update && sudo apt upgrade && sudo apt clean


# -> Install Curl <-
sudo apt install curl


# -> More than just say sudo apt install <- #

# 1. Install Docker
sudo apt install docker.io
sudo systemctl enable docker
sudo systemctl start docker
sudo systemctl status docker


# 2. Insatll Git / GitHub CLI
sudo apt install git
(type -p wget >/dev/null || (sudo apt update && sudo apt-get install wget -y)) \
&& sudo mkdir -p -m 755 /etc/apt/keyrings \
&& wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt install gh -y


# 2. Spotify
curl -sS https://download.spotify.com/debian/pubkey_6224F9941A8AA6D1.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg \
	&& echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list \
	&& sudo apt install spotify-client 


# 3. Beekeeper Studio
curl -fsSL https://deb.beekeeperstudio.io/beekeeper.key | sudo gpg --dearmor --output /usr/share/keyrings/beekeeper.gpg \
  && sudo chmod go+r /usr/share/keyrings/beekeeper.gpg \
  && echo "deb [signed-by=/usr/share/keyrings/beekeeper.gpg] https://deb.beekeeperstudio.io stable main" \
  && sudo tee /etc/apt/sources.list.d/beekeeper-studio-app.list > /dev/null \
	&& sudo apt update && sudo apt install beekeeper-studio -y


# ETC 
sudo apt install \
	btop neofetch bpytop clang cargo libc6-i386 libc6-x32 libu2f-udev \
	samba-common-bin exfat-fuse default-jdk wget unrar \
	linux-headers-$(uname -r) gstreamer1.0-vaapi unzip ntfs-3g gcc \
	make perl linux-headers-generic gdebi gnome-extension-manager \
	gnome-tweaks obs-studio


echo -e '\n\n\\nDo manually: \n'
echo "https://discord.com/api/download?platform=linux&format=deb"
echo "https://www.google.com/chrome/next-steps.html?platform=linux&statcb=0&installdataindex=empty&defaultbrowser=0#"


