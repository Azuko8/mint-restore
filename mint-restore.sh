#!/usr/bin/env bash
# mint only
# signal, element, osu, vesktop, pear-desktop will be only installed thru their native packages on their site.
echo "OS : Linux Mint"
echo "Remember to install:"
echo " - Signal"
echo " - Element"
echo " - osu!"
echo " - Vesktop"
echo " - ytm"
set -euo pipefail

echo "installing apt packages"

sudo apt install -y \
    git \
    fish \
    kitty \
    steam

echo "checking for flathub source"

flatpak remote-add --if-not-exists flathub \
https://dl.flathub.org/repo/flathub.flatpakrepo

echo "installing flatpaks"

flatpak install -y flathub \
    com.notesnook.Notesnook \
    com.obsproject.Studio \
    io.github.Foldex.AdwSteamGtk \
    io.gitlab.librewolf-community \
    it.mijorus.gearlever \
    net.davidotek.pupgui2 \
    org.fedoraproject.MediaWriter \
    org.prismlauncher.PrismLauncher \

echo "don't nuke this system in 2h."
