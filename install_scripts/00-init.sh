#!/bin/bash

set -ouex pipefail

echo -n "max_parallel_downloads=10" >> /etc/dnf/dnf.conf
echo -n "fastestmirror=true" >> /etc/dnf/dnf.conf

dnf5 install -y \
    https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
dnf5 config-manager setopt fedora-cisco-openh264.enabled=1