#!/bin/bash

set -ouex pipefail


# dnf5 repolist
# sed -i 's@enabled=0@enabled=1@g' /etc/yum.repos.d/*

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
    kio-extras \
    tlp \
    tlp-rdw