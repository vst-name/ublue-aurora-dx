#!/usr/bin/bash

set -eoux pipefail
shopt -s extglob

dnf5 clean all -y
dnf5 autoremove -y
rm -rf /tmp/!(direct_packages|install_scripts) || true
rm -rf /var/!(cache)
rm -rf /var/cache/!(rpm-ostree)

sed -i 's@enabled=1@enabled=0@g' /etc/yum.repos.d/*