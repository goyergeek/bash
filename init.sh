#!/bin/bash

# This script is meant to be run after pulling from github.  It will initialize the directory
# and file structures for use.  If run on an already initialized directory, it will reset everything.  
dirRoot="$HOME/scripts/bash"
directories=("$dirRoot/files/01" "$dirRoot/files/02" "$dirRoot/files/03" "$dirRoot/files/temp" "$dirRoot/output")

# Set Scripts to be Executable by current user and group
find "$dirRoot/" -name "*.sh" -type f -print0 | xargs -0 chmod ug+x     

# Instantiate a function called add_timestamp() which will
# prepend a date and time to all redirected output when called.
add_timestamp() {
    while IFS= read -r line; do
        timestamp=$(date "+%Y-%m-%d %H:%M:%S.%3N |")
        printf "%s %s\n" "${timestamp}" "$line" 
    done
}

# A for loop to iterate through the directories array
# and see if the folder exists then create it if not.
for dirs in "${directories[@]}"; do
    if [ ! -d "$dirs" ]; then
        mkdir -p "$dirs"
    else
        find "$dirs" -type f -delete
    fi
done

# A for loop to create a file for every number in the range
# 1 to 100, and name the files with current month day and
# year, as well as the file number.  Files in this group
# are empty.  
for i in {1..100}; do
    filedate=$(date +"%m%d%Y")
    touch "$dirRoot/files/01/${filedate}_EMPTY_$i.txt"
done

# A for loop to create a file for every number in the range
# 1 to 100, and name the files with current month day and 
# year, as well as the file number.  These files will be 
# populated with 150kb of random alphanumeric text. 
for i in {1..100}; do
    filedate=$(date +%m%d%Y)
    tr -dc A-Za-z0-9\\n </dev/urandom | head -c 150000 > "$dirRoot/files/02/${filedate}_RANDOM_$i.txt"
    wc --lines --chars --bytes "$dirRoot/files/02/${filedate}_RANDOM_$i.txt" >>"$dirRoot/output/RANDOM_Analysis_$i.txt"
    cat "$dirRoot/files/02/${filedate}_RANDOM_$i.txt" | grep -o '.' |sort |uniq -c >>"$dirRoot/output/RANDOM_Analysis_$i.txt"
done

# Instantiate a variable called counter and set it to zero.  This
# will be used to count the number of loop iterations in the while
# loop.
counter=0

# A while loop that will move the files from /files to /files2 and back
# 100 times, while redirecting the stdout and stderr streams to files.
while [ $counter -lt 5 ]; do

    # Find only files in /files or /files2 and move them verbosely 
    # to the opposite folder.
    find "$dirRoot/files/01/" -type f -print0 | xargs -0 mv -vt "$dirRoot/files/temp" | add_timestamp &>>"$dirRoot/output/init.log"
    find "$dirRoot/files/temp/" -type f -print0 | xargs -0 mv -vt "$dirRoot/files/01" | add_timestamp &>>"$dirRoot/output/init.log"
    
    # Copy Non-existent files verbosely to generate stderr output.  
    # There shouldn't be any stdout output.  
    cp -v "$dirRoot/files/temp$counter/anyfile$counter.txt" "$dirRoot/files" 2>&1 | add_timestamp >>"$dirRoot/output/init.log"

    # Increment the counter variable by 1, so the while condition 
    # eventually evaluates to false.
    counter=$((counter+1))
done

# List contents of the files folder with human readable file sizes 
# to ensure files are back where they belong, and redirect stdout
# and stderr streams to files.
ls -lhR "$dirRoot/files/" | add_timestamp &>>"$dirRoot/output/init_files_list.txt"