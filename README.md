[![Build Custom Image](https://github.com/vst-name/bluefin/actions/workflows/build.yml/badge.svg)](https://github.com/vst-name/bluefin/actions/workflows/build.yml)
[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/vst-name-ublue-aurora)](https://artifacthub.io/packages/search?repo=vst-name-ublue-aurora)


![Screenshot of the image](./media/screenshot.png "Desktop")
# Purpose

This repository is meant to be a template for building your own custom Universal Blue image. This template is the recommended way to make customizations to any image published by the Universal Blue Project:
- [Aurora](https://getaurora.dev/)
- [Bazzite](https://bazzite.gg/)
- [Bluefin](https://projectbluefin.io/)
- [uCore](https://projectucore.io/)
- [main](https://github.com/ublue-os/main/)
- [hwe](https://github.com/ublue-os/hwe/) 

This template includes a Containerfile and a Github workflow for building the container image. As soon as the workflow is enabled in your repository, it will build the container image and push it to the Github Container Registry.

# Prerequisites

Working knowledge in the following topics:

- Containers
  - https://www.youtube.com/watch?v=SnSH8Ht3MIc
  - https://www.mankier.com/5/Containerfile
- bootc
  - https://containers.github.io/bootc/
- Fedora Silverblue (and other Fedora Atomic variants)
  - https://docs.fedoraproject.org/en-US/fedora-silverblue/
- Github Workflows
  - https://docs.github.com/en/actions/using-workflows

# Community

- [**bootc discussion forums**](https://github.com/containers/bootc/discussions) - Nothing in this template is ublue specific, the upstream bootc project has a discussions forum where custom image builders can hang out and ask questions.
- Index your image on [artifacthub.io](https://artifacthub.io), use the `artifacthub-repo.yml` file at the root to verify yourself as the publisher. 

## Community Examples

- [m2os](https://github.com/m2giles/m2os)
- [bos](https://github.com/bsherman/bos)
- [homer](https://github.com/bketelsen/homer/)
