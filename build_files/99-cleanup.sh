#!/usr/bin/bash

set -eoux pipefail
shopt -s extglob

dnf5 autoremove -y
dnf5 clean all -y

flatpaks_to_remove=(
    "org.gnome.DejaDup"
    "org.gnome.World.PikaBackup"
    "org.mozilla.firefox"
    "app/org.mozilla.Thunderbird/x86_64/stable"
    "app/org.fedoraproject.MediaWriter/x86_64/stable"
)

flatpak uninstall --assumeyes --delete-data "${flatpaks_to_remove[@]}" | true
flatpak update --noninteractive
flatpak uninstall --unused --delete-data --assumeyes