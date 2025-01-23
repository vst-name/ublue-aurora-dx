#!/bin/bash

set -ouex pipefail
echo -n "max_parallel_downloads=10" >> /etc/dnf/dnf.conf
echo -n "fastestmirror=true" >> /etc/dnf/dnf.conf

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

dnf5 install -y \
    dnf5-plugins \
    fedora-workstation-repositories \
    guestfs-tools \
    virt-top \
    snapd \
    crontabs \
    wireguard-tools \
    fuse \
    squashfuse \
    encfs \
    distribution-gpg-keys \
    pam \
    kio-extras