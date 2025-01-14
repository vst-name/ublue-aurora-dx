#!/bin/bash

set -ouex pipefail


mkdir -p /tmp/direct_packages

GH_TOKEN="${GH_CI_TOKEN}" gh release download --repo wagoodman/dive --pattern "*linux*amd64*.rpm" -O /tmp/direct_packages/dive.rpm
curl -o /tmp/direct_packages/google-chrome-stable_current_x86_64.rpm https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
http://ch-werner.de/sqliteodbc/sqliteodbc-0.99991-1.src.rpm
dnf5 install -y --skip-broken \
    /tmp/direct_packages/*.rpm

rm -rf /tmp/direct_packages

dnf5 remove -y gh