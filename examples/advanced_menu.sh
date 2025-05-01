#!/bin/bash

# This example shows how to construct an advanced menu using
# the concepts built in previous examples.  Functions are 
# used to generate menus rather than explicitly writing
# the menu each time.

# Declare Associative Arrays that will contain menu items.
declare -A main_menu
declare -A disk_menu
declare -A hw_menu
declare -A cfg_menu
declare -A sample_menu
declare -A sample_menu2
declare -A sample_menu3
declare -A sample_menu4

# Populate associative arrays 
main_menu=([1]="Disk Menu" [2]="Hardware Menu" [3]="Config Menu" [4]="Sample Menu 1" [5]="Sample Menu 2" [6]="Exit" ["Name"]="Main Menu")
disk_menu=([1]="Block Devices" [2]="Contents of /dev" [3]="LVM Wizard" [4]="Mounted Filesystems" [5]="Disk Usage" [6]="Main Menu" ["Name"]="Disk Menu")
hw_menu=([1]="Network Hardware" [2]="Input Hardware" [3]="Memory Hardware" [4]="Storage Hardware" [5]="CPU Hardware" [6]="Main Menu" ["Name"]="Hardware Menu")
cfg_menu=([1]="Local Bash Config" [2]="Global Bash Config" [3]="System Bash Config" [4]="Systemd Config" [5]="FS Table" [6]="Main Menu" ["Name"]="Config Menu")
sample_menu=([1]="AAAAAAAAAAAAAAAAAAA" [2]="AAAAAAAAAAAAAAAAAAAA" [3]="AAAAAAAAAAAAAAAAAAAA" [4]="AAAAAAAAAAAAAAAAAAA" [5]="AAAAAAAAAAAAAAAAAAAA" [6]="AAAAAAAAAAAAAAAAAAAA" ["Name"]="Sample Menu 1")
sample_menu2=([1]="Option 1" [2]="Option 2" [3]="Option 3" [4]="Option 4" [5]="Option 5" [6]="Main Menu" ["Name"]="Sample Menu 2")
sample_menu3=([1]="AAAAAAAAAAAAAAAAAAAA" [2]="AAAAAAAAAAAAAAAAAAAA" [3]="AAAAAAAAAAAAAAAAAAAA" [4]="AAAAAAAAAAAAAAAAAAAA" [5]="AAAAAAAAAAAAAAAAAAAA" [6]="AAAAAAAAAAAAAAAAAAAA" [7]="AAAAAAAAAAAAAAAAAAAA" [8]="AAAAAAAAAAAAAAAAAAAA" [9]="AAAAAAAAAAAAAAAAAAAA" [10]="AAAAAAAAAAAAAAAAAAAA" [11]="AAAAAAAAAAAAAAAAAAAA" [12]="AAAAAAAAAAAAAAAAAAAA" [13]="AAAAAAAAAAAAAAAAAAAA" [14]="AAAAAAAAAAAAAAAAAAAA" [15]="AAAAAAAAAAAAAAAAAAAA" [16]="AAAAAAAAAAAAAAAAAAAA" [17]="AAAAAAAAAAAAAAAAAAAA" [18]="AAAAAAAAAAAAAAAAAAAA" [19]="AAAAAAAAAAAAAAAAAAAA" [20]="AAAAAAAAAAAAAAAAAAAA" ["Name"]="Sample Menu 3")
sample_menu4=([1]="AAAAAAAAAAAAAAAAAAAA" [2]="AAAAAAAAAAAAAAAAAAAA" [3]="AAAAAAAAAAAAAAAAAAAA" [4]="AAAAAAAAAAAAAAAAAAAA" [5]="AAAAAAAAAAAAAAAAAAAA" [6]="AAAAAAAAAAAAAAAAAAAA" [7]="AAAAAAAAAAAAAAAAAAAA" [8]="AAAAAAAAAAAAAAAAAAAA" [9]="AAAAAAAAAAAAAAAAAAAA" [10]="AAAAAAAAAAAAAAAAAAAA" [11]="AAAAAAAAAAAAAAAAAAAA" [12]="AAAAAAAAAAAAAAAAAAAA" [13]="AAAAAAAAAAAAAAAAAAAA" [14]="AAAAAAAAAAAAAAAAAAAA" [15]="AAAAAAAAAAAAAAAAAAAA" [16]="AAAAAAAAAAAAAAAAAAAA" [17]="AAAAAAAAAAAAAAAAAAAA" [18]="AAAAAAAAAAAAAAAAAAAA" [19]="AAAAAAAAAAAAAAAAAAAA" ["Name"]="Sample Menu 4")
display_menu() {
    local -n arr_ref=$1
    local col_count=1
    local menu_space=("\t*%-89s*\n" "")
    local menu_name=("\t*%-37s%-15s%-37s*\n" "" "${arr_ref[Name]}" "")
    local menu_prompt=("\t*  %s :: " "Select an Option")
    local opts_line=("\t*%-2s%3s  %-25s%3s  %-25s%3s  %-20s%-2s*\n\t*%89s*\n" "" )
    local sorted_keys=($(printf "%s\n" "${!arr_ref[@]}" | sort))
    unset 'sorted_keys[-1]'
    local sorted_keys=($(printf "%s\n" "${sorted_keys[@]}" | sort -n))
    local opts=${#sorted_keys[@]}
    local opts_count=1
    printf "\n\n\n"
    printf "\t%*s\n" 91 "" | tr ' ' '*'
    printf "${menu_space[@]}" 
    printf "${menu_name[@]}"
    printf "${menu_space[@]}" 
    printf "\t%*s\n" 91 "" | tr ' ' '*'
    printf "${menu_space[@]}" 
    for idx in "${!sorted_keys[@]}"; do
        local idxVal=${sorted_keys[$idx]}
        local opts_line+=("${sorted_keys[$idx]}." "${arr_ref[$idxVal]}")
        local opts_count=$((opts_count + 1))
        if [ $col_count = 3 ] ; then
            local col_count=1
            local opts_line+=("")
            printf "${opts_line[@]}"
            local opts_line=("\t*%-2s%3s  %-25s%3s  %-25s%3s  %-20s%-2s*\n\t*%89s*\n" "" )
        elif [ $opts_count = $((${#sorted_keys[@]} + 1)) ] && [ $col_count -lt 3 ]; then
            local col_remain=$((3 - col_count))
            for x in $(seq "1" "$col_remain"); do
                opts_line+=("") 
            done
            local opts_line+=("")
            printf "${opts_line[@]}"
            #col_count=$((col_count + 1))
        else 
            local col_count=$((col_count + 1))
        fi
    done
    printf "\t%*s\n\n" 91 "" | tr ' ' '*'
    printf "${menu_prompt[@]}"
}