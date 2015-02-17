#!/bin/bash
# Author: Robert Taylor
# License: Apache 2.0
# WARRANTY: None. No error checking. Will likely result in a singularity event. You have been warned.
#
# Automatically launch a browser window with the URL in a "brew info $keyword" output.
# I copy this to a location in my local PATH, usually "~/bin" and symbolically link to "bi" for ease of use:
# Like this:
# $ mkdir -p ~/bin
# $ cp bi.sh ~/bin/
# $ chmod +x ~/bin/bin.sh
# $ ln -s ~/bin/bi{.sh,}
#
# Then to run, I just enter something like the following (to see the URL for awscli, for example):
# bi awcli
#
PACKAGE=$1

brew info $PACKAGE | grep "^http"| head -n 1 | xargs open

exit 0
