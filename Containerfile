FROM ghcr.io/ublue-os/aurora-dx-asus-nvidia:latest
# ENV GH_CI_TOKEN=${GH_CI_TOKEN}

RUN --mount=type=bind,source=./install_scripts/,destination=/tmp/install_scripts/,ro=false \
    for script in $(ls /tmp/install_scripts/ | grep -v 'tmp' | sort -n); do \
        /tmp/install_scripts/$script; \
    done && \
    dnf5 upgrade --bugfix -y && \
    /tmp/install_scripts/99-cleanup.sh && \
    ostree container commit && \
    bootc container lint;