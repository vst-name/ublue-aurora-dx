#!/bin/bash
set -eoux pipefail
mkdir -p ./direct_packages
(
    gh release download --repo wagoodman/dive --pattern "*linux*amd64*.rpm" -D ./direct_packages/ &
    gh release download --repo Heroic-Games-Launcher/HeroicGamesLauncher --pattern "*rpm*" -D ./direct_packages/ &
    gh release download --repo kubernetes/minikube --pattern "*latest*x86_64*rpm*" -D ./direct_packages/ &
    wait
)