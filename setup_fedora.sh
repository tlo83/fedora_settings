#!/bin/bash

# Setup DNF performance
echo "fastestmirror=1" | sudo tee -a /etc/dnf/dnf.conf
echo "max_parallel_downloads=20" | sudo tee -a /etc/dnf/dnf.conf

# Update the system
sudo dnf update -y

# Add RPM Fusion
sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1

# Add Flathub
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install the required packages
sudo dnf install -y git curl wget vim libcxx-devel llvm-libunwind
ln -s /lib64/libunwind.so.8 /lib64/libunwind.so.1

# Fake Pulseaudio for MS Teams
sudo bash -c 'cat <<EOF > /usr/bin/pulseaudio
echo "A fake pulseaudio bin just to make Citrix happy!"
EOF'
sudo chmod +x /usr/bin/pulseaudio

# Install Gamestuff
sudo dnf install -y steam lutris wine winetricks gamemode discord

# Update the system
sudo dnf update -y --refresh