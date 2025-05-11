# Stage 1: Prepare context (ctx) stage
FROM scratch AS ctx
COPY ./build_files/ /tmp/build_files/
COPY ./direct_packages/ /tmp/direct_packages/

# Stage 2: Main build stage
FROM ghcr.io/ublue-os/aurora-dx-asus-nvidia:latest AS build

# Mount files from ctx stage for execution(neccessary since rootless executor, e.g. podman,p can't mount directly from host)
RUN --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    --mount=type=bind,from=ctx,source=/tmp/build_files/,target=/tmp/build_files/,ro=false \
    --mount=type=bind,from=ctx,source=/tmp/direct_packages/,target=/tmp/direct_packages/,ro=false \
    set -e; \
    for script in $(ls /tmp/build_files/ | grep -v 'tmp' | sort -n); do \
    /tmp/build_files/$script || exit 1; \
    done && \
    ostree container commit;


# dnf5 upgrade --bugfix -y && \

# Lint the container for BootC compatibility
RUN bootc container lint
