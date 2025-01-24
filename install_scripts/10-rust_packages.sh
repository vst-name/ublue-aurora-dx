#!/bin/bash

set -ouex pipefail

dnf5 install -y \
    rust \
    cargo \
    clippy \
    rust-src \
    rustfmt