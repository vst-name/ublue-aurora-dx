#!/bin/bash

set -ouex pipefail
echo -n "max_parallel_downloads=10" >> /etc/dnf/dnf.conf
echo -n "fastestmirror=true" >> /etc/dnf/dnf.conf

dnf5 install -y --skip-broken \
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