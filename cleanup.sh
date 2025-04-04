#!/bin/bash

# This script will simply clean up files and folders created with the test
# scripts, effectively resetting everything back to default.  

directories=("$HOME/files" "$HOME/files2" "$HOME/templogs")

for dir in "${directories[@]}"; do
    if [ -d "$dir" ]; then
        rm -r $dir
    fi
done

