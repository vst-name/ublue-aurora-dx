#!/bin/bash
set -eoux pipefail
mkdir -p ./direct_packages
(
    # gh release download --repo Heroic-Games-Launcher/HeroicGamesLauncher --pattern "*rpm*" -D ./direct_packages/ &
    wget https://yum.vector.dev/stable/vector-0/"$(uname -m)"/vector-0.46.1-1."$(uname -m)".rpm -q -O ./direct_packages/vector.rpm &
    wait
)
    # gh release download --repo kubernetes/minikube --pattern "*latest*x86_64*rpm*" -D ./direct_packages/ &
    # gh release download --repo wagoodman/dive --pattern "*linux*amd64*.rpm" -D ./direct_packages/ &
