#!/bin/bash

set -ouex pipefail

dnf5 install -y --skip-broken \
    vlc \
    mangohud \
    chromium \
    libreoffice \
    libreoffice-postgresql \
    btrfs-assistant \
    kvantum \
    keysmith \
    kclock \
    elisa-player \
    kcachegrind \
    kcachegrind-converters \
    krusader \
    kdenlive \
    kolourpaint \
    krdc \
    kommit \
    smb4k \
    kdiff3 \
    gimp