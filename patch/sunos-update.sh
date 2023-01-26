#!/usr/bin/bash
# https://www.sotechdesign.com.au/how-to-updateupgrade-openindiana/
pfexec pkg image-update -nv
# The -n flag specifies a dry run (no system changes) and the -v flag produces a verbose output.
pfexec pkg image-update -v
# Package Administration https://youtu.be/DRJzjX_04TA
pkg info kernel
