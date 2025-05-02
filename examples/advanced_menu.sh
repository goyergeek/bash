#!/bin/bash

# This example shows a more advanced method of displaying, navigating, and executing menu options.  It uses three functions 
# and one outside file to accomplish the task.  The outside file contains information for both displaying menus, and also 
# what to do when a selection is made.
 

# Read contents of menus.sh into the script file.  This makes it as though this code was part of the current script file.
# See comments in menus.sh for additional details on file structure.
. menus.sh

# display_menu() does exactly that. It takes menu data provided in menus.sh and uses it to display a nicely formatted 
# menu to the screen along with a prompt.
display_menu() {
    clear
    local ch=$(echo $'\u2591')
    local -n arr_ref=$1
    local col_count=1
    local menu_space=("\t$ch%-89s$ch\n" "")
    local menu_name=("\t$ch%-37s%-15s%-37s$ch\n" "" "${arr_ref[Name]}" "")
    local menu_prompt=("\t$ch  %s :: " "Select an Option")
    local opts_line=("\t$ch%-2s%3s  %-25s%3s  %-25s%3s  %-20s%-2s$ch\n\t$ch%89s$ch\n" "" )
    local sorted_keys=($(printf "%s\n" "${!arr_ref[@]}" | sort))
    unset 'sorted_keys[-1]'
    local sorted_keys=($(printf "%s\n" "${sorted_keys[@]}" | sort -n))
    local opts=${#sorted_keys[@]}
    local opts_count=1
    printf "\n\n\n\t"
    printf "$ch%.0s" {1..91};printf "\n"
    printf "${menu_space[@]}" 
    printf "${menu_name[@]}"
    printf "${menu_space[@]}" 
    printf "\t";printf "$ch%.0s" {1..91};printf "\n"
    printf "${menu_space[@]}" 
    for idx in "${!sorted_keys[@]}"; do
        local idxVal=${sorted_keys[$idx]}
        local opts_line+=("${sorted_keys[$idx]}." "${arr_ref[$idxVal]}")
        local opts_count=$((opts_count + 1))
        if [ $col_count = 3 ] ; then
            local col_count=1
            local opts_line+=("")
            printf "${opts_line[@]}"
            local opts_line=("\t$ch%-2s%3s  %-25s%3s  %-25s%3s  %-20s%-2s$ch\n\t$ch%89s$ch\n" "" )
        elif [ $opts_count = $((${#sorted_keys[@]} + 1)) ] && [ $col_count -lt 3 ]; then
            local col_remain=$((3 - col_count))
            for x in $(seq "1" "$col_remain"); do
                opts_line+=("") 
            done
            local opts_line+=("")
            printf "${opts_line[@]}"
        else 
            local col_count=$((col_count + 1))
        fi
    done
    printf "\t";printf "$ch%.0s" {1..91};printf "\n\n"
    printf "${menu_prompt[@]}"
} # End Of Function display_menu()


generate_case() {
    local -n opts_ref=$1
    local cases=("${!opts_ref[@]}")
    echo "case \"\$selection\" in"
    for case in "${cases[@]}"; do
        echo -e "\t$case) echo \"${opts_ref[$case]}\" ;;"
    done
    echo -e "\t*) echo \"No match\";;"
    echo "esac"
} # End Of Function generate_case()


run_menu() {
    quitbit=1
    current="main_"
    while [ $quitbit -eq 1 ]; do
        display_menu $current"menu"
        read -r selection
        opts_arr=$current"opts"
        command=$(eval $(generate_case $opts_arr))
        eval "$command"
    done
} # End of Function: handle_options()