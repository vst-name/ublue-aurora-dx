#!/bin/bash

set -ouex pipefail

echo -n "max_parallel_downloads=10" >>/etc/dnf/dnf.conf

dnf5 install -y \
	https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-"$(rpm -E %fedora)".noarch.rpm \
	https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-"$(rpm -E %fedora)".noarch.rpm
dnf5 config-manager setopt fedora-cisco-openh264.enabled=1

dnf5 config-manager setopt terra.enabled=1
dnf5 config-manager setopt fedora-multimedia.enabled=1

# dnf5 config-manager setopt google-chrome.enabled=1

# Netbird
sudo tee /etc/yum.repos.d/netbird.repo <<EOF
[netbird]
name=netbird
baseurl=https://pkgs.netbird.io/yum/
enabled=1
gpgcheck=0
gpgkey=https://pkgs.netbird.io/yum/repodata/repomd.xml.key
repo_gpgcheck=1
EOF

dnf5 config-manager setopt netbird.enabled=1


