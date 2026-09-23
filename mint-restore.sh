#!/usr/bin/env bash
set -euo pipefail

echo "Linux Mint restore"
echo
echo "Remember to install manually:"
echo "  - osu!"
echo "  - Vesktop"
echo "  - ytm"
echo
echo "Installing APT packages..."

sudo apt update > /dev/null
sudo apt install -y \
    git \
    fish \
    steam \
    micro \
    obs-studio \
    curl \
    gpg \
    extrepo > /dev/null

echo "Adding LibreWolf repository..."

sudo extrepo enable librewolf > /dev/null
sudo extrepo update librewolf > /dev/null

echo "Adding Signal repository..."

curl -fsSL https://updates.signal.org/desktop/apt/keys.asc \
    | gpg --dearmor \
    | sudo tee /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null

curl -fsSL https://updates.signal.org/static/desktop/apt/signal-desktop.sources \
    | sudo tee /etc/apt/sources.list.d/signal-desktop.sources > /dev/null

echo "Installing LibreWolf and Signal..."

sudo apt update > /dev/null
sudo apt install -y \
    librewolf \
    signal-desktop > /dev/null

echo "Checking Flathub..."

flatpak remote-add --if-not-exists flathub \
    https://dl.flathub.org/repo/flathub.flatpakrepo > /dev/null

echo "Installing Flatpaks..."

flatpak install -y flathub \
    org.keepassxc.KeePassXC \
    it.mijorus.gearlever \
    net.davidotek.pupgui2 \
    org.prismlauncher.PrismLauncher \
    io.github.debasish_patra_1987.linuxthemestore \
    org.localsend.localsend_app > /dev/null

echo
echo "Restore complete."
