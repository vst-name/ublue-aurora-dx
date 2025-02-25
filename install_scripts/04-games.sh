#!/bin/bash

set -ouex pipefail

dnf5 install -y \
    mangohud \
    gamescope \
    lutris \
    protontricks


dnf5 install -y --skip-broken \
    steam