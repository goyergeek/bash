#!/bin/bash

# This script will check for and create a directory structure
# in the current users home folder, then generate 1,000 files 
# within the ~/files folder.  After this, it will move those
# files back and forth several times between to directories
# while redirecting stdout and stderr streams to files in 
# ~/templogs/stdout.log and ~/templogs/stderr.log


# Instantiate an indexed array called directories and populate it
# directories.
dirRoot="$HOME/scripts/bash"
directories=("$dirRooot/files/01" "$dirRoot/files/02" "$dirRoot/files/03" "$dirRoot/files/temp")

# Instantiate a function called add_timestamp() which will
# prepend a date and time to all redirected output when called.
add_timestamp() {
    while IFS= read -r line; do
        printf "%(%Y-%m-%d %H:%M:%S.%3N | )T %s\n" -1 "$line"
    done
}

# A for loop to iterate through the directories array
# and see if the folder exists then create it if not.
for dir in "${directories[@]}"; do
    if [ ! -d "$dir" ]; then
        mkdir -p "$dir"
    fi
done

# A for loop to create a file for every number in the range
# 1 to 1000, and name the files with current month day and
# year, as well as the file number.  Files in this group
# are empty.  
for i in {1..1000}; do
    filedate=$(date +"%m%d%Y")
    touch "$dirRoot/files/01/${filedate}_file#_$i.txt"
done

# A for loop to create a file for every number in the range
# 1 to 1000, and name the files with current month day and 
# year, as well as the file number.  These files will be 
# populated with 150kb of random alphanumeric text. 
for i in {1..1000}; do
    filedate=$(date + %m%d%Y)
    tr -dc A-Za-z0-9\\n </dev/urandom | head -c 150000> "$dirRoot/files/02/${filedate}_file#_$i.txt"
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
    find "$dirRoot/files/01/" -type f -print0 |  xargs -0 mv -vt "$dirRoot/files/temp" | add_timestamp 1>>"$dirRoot/output/init_stdout.log" 2>&1 | add_timestamp "$dirRoot/output/init_stderr.log"
    find "$dirRoot/files/temp/" -type f -print0 | xargs -0 mv -vt "$dirRoot/files/01" | add_timestamp 1>>"$dirRoot/output/init_stdout.log" 2>&1 | add_timestamp "$dirRoot/output/init_stderr.log"
    
    # Copy Non-existent files verbosely to generate stderr output.  
    # There shouldn't be any stdout output.  
    cp -v "$dirRoot/files/temp$counter/anyfile$counter.txt" "$dirRoot/files" | add_timestamp 1>>"$dirRoot/output/init_stdout.log" 2>&1 | add_timestamp "$dirRoot/output/init_stderr.log"

    # Increment the counter variable by 1, so the while condition 
    # eventually evaluates to false.
    counter=$((counter+1))
done

# List contents of the files folder with human readable file sizes 
# to ensure files are back where they belong, and redirect stdout
# and stderr streams to files.
ls -lhR "$dirRoot/files/" | add_timestamp 1>>"$dirRoot/output/init_files_folders.log" 2>&1 | add_timestamp "$dirRoot/output/inti_files_errors.log"