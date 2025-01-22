#!/bin/bash

set -ouex pipefail
dnf5 install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

dnf5 install -y --skip-broken \
    p7zip \
    tar \
    gzip \
    bzip2 \
    xz \
    lzop \
    lzip \
    rar \
    unrar \
    zstd \
    xar \
    isomd5sum \
    gpg \
    gpg2 \
    git \
    git-lfs \
    zsh \
    tmux \
    htop \
    btop \
    gnome-terminal \
    wget \
    curl \
    fzf \
    just \
    kio-extras \
    strace \
    nmap \
    wireshark
