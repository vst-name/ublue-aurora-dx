# Stage 1: Prepare context (ctx) stage
FROM scratch as ctx
COPY ./install_scripts/ /tmp/install_scripts/
COPY ./direct_packages/ /tmp/direct_packages/

# Stage 2: Main build stage
FROM ghcr.io/ublue-os/aurora-dx-asus-nvidia:latest as build

# Mount files from ctx stage for execution(neccessary since rootless executor, e.g. podman,p can't mount directly from host)
RUN --mount=type=bind,from=ctx,source=/tmp/install_scripts/,target=/tmp/install_scripts/,ro=false \
    --mount=type=bind,from=ctx,source=/tmp/direct_packages/,target=/tmp/direct_packages/,ro=false \
    for script in $(ls /tmp/install_scripts/ | grep -v 'tmp' | sort -n); do \
    /tmp/install_scripts/$script; \
    done && \
    dnf5 upgrade --bugfix -y && \
    /tmp/install_scripts/99-cleanup.sh && \
    ostree container commit;

# Optional: Lint the container for BootC compatibility
# RUN bootc container lint
