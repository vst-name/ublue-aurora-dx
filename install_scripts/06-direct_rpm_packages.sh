#!/bin/bash

set -ouex pipefail

# curl -o /tmp/direct_packages/google-chrome-stable_current_x86_64.rpm https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
# http://ch-werner.de/sqliteodbc/sqliteodbc-0.99991-1.src.rpm

sudo dnf5 install /tmp/direct_packages/*.rpm