#!/bin/bash

set -ouex pipefail

dnf5 install -y \
    cmake \
    make \
    sqlite-devel \
    postgresql \
    ansible \
    skopeo \
    neovim python3-neovim \
    upx \
    python3 \
    python3-pip \
    pipx \
    golang \
    nodejs

# Unity Hub
sh -c 'echo -e "[unityhub]\nname=Unity Hub\nbaseurl=https://hub.unity3d.com/linux/repos/rpm/stable\nenabled=1\ngpgcheck=1\ngpgkey=https://hub.unity3d.com/linux/repos/rpm/stable/repodata/repomd.xml.key\nrepo_gpgcheck=1" > /etc/yum.repos.d/unityhub.repo'
sudo dnf5 makecache
yes | dnf5 install -y \
    unityhub

if [[ ! -f "/etc/yum.repos.d/nvidia-container-toolkit.repo" ]]; then
curl -s -L https://nvidia.github.io/libnvidia-container/stable/rpm/nvidia-container-toolkit.repo \
    | sudo tee /etc/yum.repos.d/nvidia-container-toolkit.repo
    rpm --import "https://nvidia.github.io/libnvidia-container/gpgkey"
    dnf5 install -y nvidia-container-toolkit
fi
