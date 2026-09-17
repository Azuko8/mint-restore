#!/usr/bin/env bash
# mint only
# signal, element, osu, vesktop, pear-desktop will be only installed thru their native packages on their site.
echo "OS : Linux Mint"
echo "Remember to install:"
echo " - Signal"
echo " - osu!"
echo " - Vesktop"
echo " - ytm"
echo " - librewolf"
set -euo pipefail

echo "installing apt packages"

sudo apt install -y \
    git \
    fish \
    steam \
    micro \
    obs-studio

echo "checking for flathub source"

flatpak remote-add --if-not-exists flathub \
https://dl.flathub.org/repo/flathub.flatpakrepo

echo "installing flatpaks"

flatpak install -y flathub \
    org.keepassxc.KeePassXC \
    it.mijorus.gearlever \
    net.davidotek.pupgui2 \
    org.prismlauncher.PrismLauncher \
    io.github.debasish_patra_1987.linuxthemestore \
    org.localsend.localsend_app 

echo "don't nuke this system in 2h."
