#!/bin/bash

echo -e '\nPost Install Setup'
echo -e '------------------\n'
read -p 'Do you want to continue [y/n]: ' cont

# Change mind
while :
do
    # continue
    if [[ ${cont:0:1} == 'y' ]]; then
        break
    # don't touch my system mf
    elif [[ ${cont:0:1} == 'n' ]]; then
        exit 0
    # I Am Stupid (Charles Leclerc remix)
    else
        read -p 'yes or no?: ' cont
    fi
done

# Get the distro
read -p 'What distro are you using? [pop/fedora]: ' distro

# Pop!_OS
if [[ $distro == 'pop' ]]; then
    echo -e '\nInstalling packages\n'
    # Installs
    sudo apt install alacritty breeze-cursor-theme celluloid cheese code \
    dconf-editor deja-dup python3-pydrive font-manager fzf gimp gnome-tweaks \
    gparted htop inkscape kitty neovim obs-studio pavucontrol python3-pip \
    python3-tk ripgrep shotwell synaptic telegram-desktop tlp transmission tree -y
    # Checkpoint
    sudo apt install neofetch --no-install-recommends && neofetch
    # Defaults
    sudo update-alternatives --set x-terminal-emulator /usr/bin/kitty
    sudo update-alternatives --set editor /usr/bin/nvim
    # Papirus icon theme
    wget -qO- https://git.io/papirus-icon-theme-install | sh; rm ~/.wget-hsts
    sudo rm -r /usr/share/icons/ePapirus*
    # https://www.reddit.com/r/pop_os/comments/rp9cvo/is_that_normal/
    sudo sed -i '1,4 s/Inherits=breeze/Inherits=Pop,breeze/' /usr/share/icons/Papirus*/index.theme
    echo 'Done'

    echo -e '\nSetting up pipewire\n'
    # Pulseaudio is shit with my bluetooth earphones
    sudo apt install libspa-0.2-bluetooth pipewire-audio-client-libraries \
    pipewire-pulse -y && sudo apt remove --purge pulseaudio-module-bluetooth -y
    echo 'Done'

    echo -e '\nDebloating\n'
    # Removing packages that I have absolutely no use for
    sudo apt remove --purge eog totem simple-scan geary gnome-contacts \
    gnome-font-viewer youtube-dl vlc fonts-arphic-uming fonts-arphic-ukai -y
    sudo apt autoremove --purge -y
    echo 'Done'

    echo -e '\nAdding external repos\n'
    # Firefox beta & Neovim nightly
    sudo add-apt-repository ppa:neovim-ppa/unstable -y
    echo 'Done'

    echo -e '\nUpdating\n'
    # Update all packages
    sudo apt update && sudo apt full-upgrade && sudo apt autoremove --purge -y
    echo 'Done'

# Fedora
elif [[ $distro == 'fedora' ]]; then
    echo -e '\nInstalling packages\n'

fi
echo

read -p 'Do you want to setup configs? [y/n]: ' conf
if [[ ${conf:0:1} == 'n' ]]; then
    echo -e '\n\nSetup has completed. You may want to change the hostname and reboot\n'
    exit 0
fi

# Setup configs
mkdir ~/git ; cd ~/git
if [[ -d dots ]]; then
    mv dots dots.bak
    echo 'Moved ~/git/dots to ~/gits/dots.bak'
fi
# Cloning dotfiles repo
git clone https://github.com/sanjapm/dots.git && cd dots
if [[ -d ~/Pictures ]]; then
    mv ~/Pictures ~/Pictures.bak
    echo 'Moved ~/Pictures to ~/Pictures.bak'
fi
cp Pictures ~ -r
cp .bash_aliases ~
cp -r .bashrc.d ~
cd .config && cp -r nvim kitty Code ~/.config

# Post Install finished
cd ~
echo -e '\n\nSetup has completed. You may want to change the hostname and reboot\n'
