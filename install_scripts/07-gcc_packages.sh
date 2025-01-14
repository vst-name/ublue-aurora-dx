#!/bin/bash

set -ouex pipefail

dnf5 install -y --skip-broken \
    gcc \
    gcc-c++ \
    clang \
    clang-tools-extra \
    cmake \
    autoconf \
    automake \
    ninja-build \
    gdb \
    valgrind \
    strace \
    perf \
    glibc-devel \
    libstdc++-devel \
    libcxx-devel \
    pkg-config \
    glibc-doc \
    cppcheck

