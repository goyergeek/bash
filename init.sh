#!/bin/bash

# This script is meant to be run after pulling from github.
# It will simply set the executable permission for user and
# group of the script files for the current user.  

find ~/scripts/ -name "*.sh" -type f -print0 | xargs -0 chmod ug+x