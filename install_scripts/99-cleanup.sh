#!/usr/bin/bash

set -eoux pipefail
shopt -s extglob

dnf5 clean all -y
dnf5 autoremove -y
rm -rf /tmp/!(direct_packages|install_scripts) || true
rm -rf /var/!(cache)
rm -rf /var/cache/!(rpm-ostree)

# Steam 
dnf5 config-manager setopt fedora-cisco-openh264.enabled=0