#!/bin/bash

set -ouex pipefail

# dnf
dnf5 install -y \
    fedora-workstation-repositories \
    snapd \
    wireguard-tools \
    fuse \
    squashfuse \
    strace \
    htop \
    btop \
    distribution-gpg-keys \
    pam \
    flatpak \
    encfs \
    zip \
    unzip \
    unrar \
    p7zip \
    p7zip-plugins \
    lz4-devel \
    gnome-terminal \
    wget \
    curl \
    vlc \
    chromium \
    zsh \
    tmux \
    fzf \
    cmake \
    make \
    git \
    git-lfs \
    kio-extras \
    sqlite-devel \
    unar \
    nmap \
    keysmith \
    kclock \
    elisa-player \
    kcachegrind \
    kcachegrind-converters \
    kgpg \
    kolourpaint \
    krdc \
    kommit \
    smb4k \
    kdiff3 \
    neovim python3-neovim \
    upx \
    python3 \
    python3-pip \
    pipx \
    golang \
    nodejs

git lfs install --system --skip-repo

# # Full kde Plasma
# dnf5 group install kde-desktop-environment -y

# # Libvirt
# dnf5 group install virtualization -y

# k8s lens
# dnf5 config-manager addrepo --from-repofile=https://downloads.k8slens.dev/rpm/lens.repo -y
# dnf5 install lens -y

# Google chrome
# dnf5 config-manager setopt google-chrome.enabled=1
# dnf5 install google-chrome-stable -y

# Steam
# dnf5 install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
# dnf5 config-manager addrepo fedora-cisco-openh264 -y
# dnf5 install steam -y


dnf5 clean all -y
# Flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
# flatpak install flathub \
#   md.obsidian.Obsidian \
#   org.qbittorrent.qBittorrent \
#   com.obsproject.Studio \
#   com.discordapp.Discord \
#   com.bitwarden.desktop \
#   com.anydesk.Anydesk \
#   org.telegram.desktop \
#   me.timschneeberger.GalaxyBudsClient \
#   io.github.flattool.Warehouse

# copr
dnf5 copr enable goncalossilva/act -y 
dnf5 install act-cli -y 
dnf5 copr disable goncalossilva/act -y 

dnf5 copr enable pgdev/ghostty -y
dnf5 install ghostty -y
dnf5 copr disable pgdev/ghostty -y
