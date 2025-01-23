#!/bin/bash

set -ouex pipefail

dnf5 install -y \
    waydroid \
    p7zip \
    tar \
    gzip \
    bzip2 \
    xz \
    lzop \
    lzip \
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
    qt6-qtwebsockets \
    strace \
    nmap \
    wireshark \
    clamav \
    clamd \
    clamav-update