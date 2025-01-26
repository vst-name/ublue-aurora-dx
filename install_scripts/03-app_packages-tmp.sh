#!/bin/bash

set -ouex pipefail

# Unity Hub
# sh -c 'echo -e "[unityhub]\nname=Unity Hub\nbaseurl=https://hub.unity3d.com/linux/repos/rpm/stable\nenabled=1\ngpgcheck=1\ngpgkey=https://hub.unity3d.com/linux/repos/rpm/stable/repodata/repomd.xml.key\nrepo_gpgcheck=1" > /etc/yum.repos.d/unityhub.repo'
# sudo dnf5 makecache



dnf5 install -y \
    vlc \
    chromium \
    libreoffice \
    libreoffice-postgresql \
    btrfs-assistant \
    kvantum \
    kclock \
    elisa-player \
    kolourpaint \
    krdc \
    kgpg \
    smb4k \
    kdiff3 \
    gimp

    # unityhub