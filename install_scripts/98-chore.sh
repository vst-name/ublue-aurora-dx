#!/usr/bin/bash

set -eoux pipefail

git-lfs install --system --skip-repo
systemctl enable node_exporter
systemctl enable vector

flatpak list