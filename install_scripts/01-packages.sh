#!/bin/bash

set -ouex pipefail

# Packages
core_packages=(
    "dnf5-plugins"
    "fedora-workstation-repositories"
    "guestfs-tools"
    "virt-top"
    "snapd"
    "crontabs"
    "wireguard-tools"
    "fuse"
    "squashfuse"
    "encfs"
    "distribution-gpg-keys"
    "pam"
    "kio-extras"
    "tlp"
    "tlp-rdw"
)

extra_packages=(
    "waydroid"
    "p7zip"
    "tar"
    "gzip"
    "bzip2"
    "xz"
    "lzop"
    "lzip"
    "unrar"
    "zstd"
    "xar"
    "isomd5sum"
    "iperf"
    "gpg"
    "gpg2"
    "git"
    "git-lfs"
    "zsh"
    "tmux"
    "htop"
    "btop"
    "atop"
    "gnome-terminal"
    "wget"
    "curl"
    "fzf"
    "just"
    "kio-extras"
    "qt6-qtwebsockets"
    "strace"
    "nmap"
    "wireshark"
    "clamav"
    "clamd"
    "clamav-update"
    "kdepim-addons"
    "kio-gdrive"
)

app_packages=(
    "chromium"
    "libreoffice"
    "btrfs-assistant"
    "kvantum"
    "kclock"
    "elisa-player"
    "kolourpaint"
    "krdc"
    "smb4k"
    "kdiff3"
    "gimp"
)

game_packages=(
    "mangohud"
    "gamescope"
    "lutris"
    "protontricks"
    "steam"
)
dev_packages=(
    "git-gui"
    "cmake"
    "make"
    "sqlite-devel"
    "postgresql"
    "ansible"
    "skopeo"
    "neovim"
    "python3-neovim"
    "upx"
    "python3"
    "python3-pip"
    "pipx"
    "golang"
    "nodejs"
)
gcc_packages=(
    "gcc"
    "gcc-c++"
    "clang"
    "clang-tools-extra"
    "cmake"
    "autoconf"
    "automake"
    "ninja-build"
    "gdb"
    "valgrind"
    "perf"
    "glibc-devel"
    "libstdc++-devel"
    "libcxx-devel"
    "pkg-config"
    "glibc-doc"
    "cppcheck"
)
csharp_packages=(
    "dotnet-sdk-9.0" 
    "aspnetcore-runtime-9.0" 
    "dotnet-runtime-9.0" 
    "mono-devel"
)


packages=( \
    "${core_packages[@]}"
    "${extra_packages[@]}"
    "${app_packages[@]}"
    "${game_packages[@]}"
    "${dev_packages[@]}"
    "${gcc_packages[@]}"
    "${csharp_packages[@]}"
)

# install rpms
dnf5 install -y --allow-downgrade "${packages[@]}" \
    /tmp/direct_packages/*.rpm || exit 1
