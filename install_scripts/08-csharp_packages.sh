#!/bin/bash

set -ouex pipefail

dnf5 install -y --skip-broken \
    dotnet-sdk-9.0 \
    aspnetcore-runtime-9.0 \
    dotnet-runtime-9.0 \
    mono-devel