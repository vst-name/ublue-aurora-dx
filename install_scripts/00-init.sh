#!/bin/bash

set -ouex pipefail

echo -n "max_parallel_downloads=10" >> /etc/dnf/dnf.conf

dnf5 install -y \
    https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-"$(rpm -E %fedora)".noarch.rpm \
    https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-"$(rpm -E %fedora)".noarch.rpm
dnf5 config-manager setopt fedora-cisco-openh264.enabled=1

# dnf5 group upgrade core -y
dnf5 config-manager setopt terra.enabled=1
dnf5 config-manager setopt fedora-multimedia.enabled=1

# dnf5 install -y fedora-workstation-repositories
# dnf5 config-manager setopt google-chrome.enabled=1

dnf5 group install multimedia -y
# dnf install --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release
