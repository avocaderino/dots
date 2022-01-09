#!/bin/bash

echo
echo 'Post Install Setup'
echo '--------------------------------------------------------------------------------'
echo
echo 'Do you want to continue: '
read cont
while :
do
    if [[ ${cont:0:1} == n ]]; then
        exit
    elif [[ ${cont:0:1} == n ]]; then
        break
    else
        echo 'yes or no?: '
        read cont
    fi
done

echo 'Installing packages'
echo
# Installs
sudo apt install alacritty breeze-cursor-theme celluloid cheese code dconf-editor \
deja-dup python3-pydrive font-manager fzf gimp gnome-tweaks gparted htop inkscape \
kitty lm-sensors neovim obs-studio pavucontrol python3-pip python3-tk ripgrep \
shotwell synaptic telegram-desktop tlp transmission tree -y
# Checkpoint
sudo apt install neofetch --no-install-recommends && neofetch
# Defaults
sudo update-alternatives --set x-terminal-emulator /usr/bin/kitty
sudo update-alternatives --set editor /usr/bin/nvim
# Papirus icon theme
wget -qO- https://git.io/papirus-icon-theme-install | sh; rm ~/.wget-hsts
echo
sudo rm -r /usr/share/icons/ePapirus*
# https://www.reddit.com/r/pop_os/comments/rp9cvo/is_that_normal/
sudo sed -i '1,4 s/Inherits=breeze/Inherits=Pop,breeze/' /usr/share/icons/Papirus*/index.theme
echo 'Done'
echo

echo 'Setting up pipewire'
echo
# Pulseaudio is shit with my bluetooth earphones
sudo apt install libspa-0.2-bluetooth pipewire-audio-client-libraries \
pipewire-pulse -y && sudo apt remove --purge pulseaudio-module-bluetooth -y
echo 'Done'
echo

echo 'Debloating'
echo
# Removing packages that I have absolutely no use for
sudo apt remove --purge eog totem simple-scan geary gnome-contacts gnome-font-viewer \
youtube-dl vlc fonts-arphic-uming fonts-arphic-ukai -y
sudo apt autoremove --purge -y
echo 'Done'
echo

echo 'Adding external repos'
echo
# Firefox beta & Neovim nightly
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo add-apt-repository ppa:mozillateam/firefox-next -y
echo 'Done'
echo

echo 'Updating'
echo
# Update all packages
sudo apt update && sudo apt full-upgrade && sudo apt autoremove --purge -y
echo 'Done'
echo
echo
echo 'Setup has completed. You may want to change the hostname and reboot'
