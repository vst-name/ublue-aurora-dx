#!/usr/bin/bash

set -eoux pipefail
shopt -s extglob

flatpaks_to_remove=(
    "org.gnome.DejaDup"
    "org.gnome.World.PikaBackup"
    "org.mozilla.firefox"
    "org.mozilla.Thunderbird"
    "org.fedoraproject.MediaWriter"
)

flatpaks_to_install=(
    "com.google.Chrome"
    "io.missioncenter.MissionCenter"
    "com.github.tchx84.Flatseal"
)

flatpak uninstall --assumeyes --delete-data "${flatpaks_to_remove[@]}" | true
flatpak install --assumeyes --noninteractive "${flatpaks_to_install[@]}" | true

flatpak update --noninteractive
flatpak uninstall --unused --delete-data --assumeyes