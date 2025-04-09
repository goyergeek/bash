#!/bin/bash

# This script is meant to be run after pulling from github.  It will initialize the directory
# and file structures for use.
find ~/scripts/bash/ -name "*.sh" -type f -print0 | xargs -0 chmod ug+x     # Set Scripts to be Executable by current user and group
