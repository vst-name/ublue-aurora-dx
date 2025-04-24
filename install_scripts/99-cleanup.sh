#!/usr/bin/bash

set -eoux pipefail
shopt -s extglob

dnf5 autoremove -y
dnf5 clean all -y
rm -rf /var/!(cache)
rm -rf /var/cache/!(rpm-ostree)