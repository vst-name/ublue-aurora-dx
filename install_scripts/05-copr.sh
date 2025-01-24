#!/bin/bash

set -ouex pipefail

dnf5 copr enable goncalossilva/act -y
dnf5 install -y \
    act-cli 
dnf5 copr disable goncalossilva/act -y

# dnf5 copr enable pgdev/ghostty -y
# dnf5 install ghostty -y
# dnf5 copr disable pgdev/ghostty -y
