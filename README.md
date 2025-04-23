# archlinux-builder

[![Build Status](https://ci.cbix.de/api/badges/cbix/archlinux-builder/status.svg)](https://ci.cbix.de/cbix/archlinux-builder)

Docker images for building Arch Linux (x86_64 and aarch64) packages.

## cbix/archlinux-builder

This image can be used to build an AUR package in a clean, isolated environment, for example:

```
$ docker run --rm -it -v .:/home/builder/package cbix/archlinux-builder bash
[builder@44a9504c0c17 ~]$ sudo pacman -Sy
[builder@44a9504c0c17 ~]$ makepkg -srD package
```

## cbix/archlinux-builder-plugin

A work-in-progress [Drone](https://www.drone.io/) plugin for building packages:

```yaml
---
kind: pipeline
name: build package
steps:
  - name: build
    image: cbix/archlinux-builder-plugin
    environment:
      # set any variable for makepkg here
      MAKEFLAGS: "-j4"
    settings:
      packages:
        - packages/package-a
        - packages/package-b
```
