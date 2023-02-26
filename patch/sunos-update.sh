#!/usr/bin/bash
# https://www.sotechdesign.com.au/how-to-updateupgrade-openindiana/
pfexec pkg image-update -nv
# The -n flag specifies a dry run (no system changes) and the -v flag produces a verbose output.
pfexec pkg image-update -v
# Package Administration https://youtu.be/DRJzjX_04TA
pkg info kernel
pkg search jdk
pkg install openjdk11
# https://openindiana.org/pipermail/openindiana-discuss/2020-October/022962.html
# https://www.zdnet.com/article/what-is-openindiana-and-why-does-it-matter/
pkg update
pkg install build-essential
