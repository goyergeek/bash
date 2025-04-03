#!/bin/bash

# This script will check for and create a directory structure
# in the current users home folder, then generate 1,000 files 
# within the ~/files folder.  


# Instantiate a variable called directories and populate it
# with an array of folder locations.
directories=("$HOME/files" "$HOME/files2" "$HOME/templogs")


# A for loop to iterate through the directories array
# and see if the folder exists then create it if not.
for dir in "${directories[@]}"; do
    if [ ! -d "$dir" ]; then
        mkdir "$dir"
    fi
done

# A for loop to create a file for every number in the range
# 1 to 1000, and name the files with current month day and
# year, as well as the file number.
for i in {1..1000}; do
    filedate=$(date +"%m%d%Y")
    touch "$HOME/files/${filedate}_file#_$i.txt"
done


# Instantiate a variable called counter and set it to zero.  This
# will be used to count the number of loop iterations in the while
# loop.
counter=0

# A while loop that will move the files from /files to /files2 and back
# 100 times, while redirecting the stdout and stderr streams to files.
while [ $counter -lt 100 ]; do

    # Find only files in /files or /files2 and move them verbosely 
    # to the opposite folder.
    find ~/files/ -type f -print0 | xargs -0 mv -vt ~/files2  1>>~/templogs/stdout.log 2>>~/templogs/stderr.log
    find ~/files2/ -type f -print0 | xargs -0 mv -vt ~/files  1>>~/templogs/stdout.log 2>>~/templogs/stderr.log
    
    # Copy Non-existent files verbosely to generate stderr output.  
    # There shouldn't be any stdout output.  
    cp -v "$HOME/temp$counter/anyfile$counter.txt" "$HOME/files" 1>>~/templogs/stdout.log 2>>~/templogs/stderr.log

    # Increment the counter variable by 1, so the while condition 
    # eventually evaluates to false.
    counter=$((counter+1))
done

# List contents of the files folder with human readable file sizes 
# to ensure files are back where they belong, and redirect stdout
# and stderr streams to files.
ls -lh ~/files 1>>~/templogs/files_output.txt 2>>~/templogs/files_output_errors.log

