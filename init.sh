#!/bin/bash

# This script is meant to be run after pulling from github.
# It will set up the script directory and file structures.
find ~/scripts/ -name "*.sh" -type f -print0 | xargs -0 chmod ug+x