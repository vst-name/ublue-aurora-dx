FROM ghcr.io/ublue-os/aurora-dx-asus-nvidia:latest

RUN --mount=type=bind,source=./install_scripts/,destination=/tmp/install_scripts/,ro=false \
    --mount=type=bind,source=./direct_packages/,destination=/tmp/direct_packages/,ro=false \
    for script in $(ls /tmp/install_scripts/ | grep -v 'tmp' | sort -n); do \
    /tmp/install_scripts/$script; \
    cat /usr/lib/ostree/prepare-root.conf; \
    done && \
    dnf5 upgrade --bugfix -y && \
    /tmp/install_scripts/99-cleanup.sh && \
    ostree container commit && \
    bootc container lint;

