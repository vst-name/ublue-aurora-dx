#!/bin/bash

set -ouex pipefail

dnf5 config-manager -y addrepo --from-repofile=https://cli.github.com/packages/rpm/gh-cli.repo

dnf5 install -y --skip-broken \
    ansible \
    cmake \
    make \
    sqlite-devel \
    skopeo \
    kgpg \
    neovim python3-neovim \
    upx \
    python3 \
    python3-pip \
    pipx \
    golang \
    nodejs

dnf5 install -y gh --repo gh-cli

git lfs install --system --skip-repo