#!/bin/bash

# This example shows a more advanced method of displaying, navigating, and executing menu options.  It uses three functions 
# and one outside file to accomplish the task.  The outside file contains information for both displaying menus, and also 
# what to do when a selection is made.
 

# Read contents of menus.sh into the script file.  This makes it as though this code was part of the current script file.
# See comments in menus.sh for additional details on file structure.
. menus.sh

# display_menu() does exactly that. It takes menu data provided in menus.sh and uses it to display a nicely formatted 
# menu to the screen along with a prompt.  The character used to draw the menu can be altered by changing the value
# of $ch. $ch is ░ ($'\u2591') by default, and is declared at the start of the function.  display_menu() can handle
# up to 99 options, at which point formatting of the numbers will break down, as there is not enough padding for 3
# digits.  The function will allow you to pass an array with more than 99 options, but it will not display correctly. 
display_menu() {
    clear                           # Clear the screen when the function is called, and therefore each time the menu is drawn.
    local ch=$(echo $'\u2591')      # Set the character that will compose the Menu borders.  
    local -n arr_ref=$1             # create a reference to the <name>_menu variable passed as an argument to the function.
    local col_count=1               # set the column counter to 1.

    # Create arrays that contain the printf formatting for the menu.
    local menu_cap=$(printf "\t";printf "$ch%.0s" {1..91})                                  # Prints the border character 91 times to create a line in the menu.
    local menu_space=("\t$ch%-89s$ch\n" "")                                                 # Creates a blank space with border characters at the left and right side
    local menu_name=("\t$ch%-37s%-15s%-37s$ch\n" "" "${arr_ref[Name]}" "")                  # Format menu name to appear roughly center of the name box.
    local menu_prompt=("\t$ch  %s :: " "Select an Option")                                  # Format for the menu prompt.
    local opts_line=("\t$ch%-2s%3s  %-25s%3s  %-25s%3s  %-20s%-2s$ch\n\t$ch%89s$ch\n" "" )  # Format menu lines with 3 columns for options.

    local sorted_keys=($(printf "%s\n" "${!arr_ref[@]}" | sort))                            # Create an indexed array of alpha sorted key names from the function parameter $1
    unset 'sorted_keys[-1]'                                                                 # Remove the last element from the sorted keys, because we don't want the menu name.
    local sorted_keys=($(printf "%s\n" "${sorted_keys[@]}" | sort -n))                      # Sort again, this time numerically.
    local opts_count=1                                                                      # Set options counter to 1
    
    # Print the menu header box containing current menu name using the arrays we created previously.
    printf "\n\n\n"
    printf "${menu_cap[@]}";printf "\n"     # A limitation of the format for menu_cap prevents adding a newline at the end. So we add one here.
    printf "${menu_space[@]}"               
    printf "${menu_name[@]}"
    printf "${menu_space[@]}" 
    printf "${menu_cap[@]}";printf "\n"     # A limitation of the format for menu_cap prevents adding a newline at the end. So we add one here.
    printf "${menu_space[@]}"

    # Iterate over the options from <menu_name>_opts associative array and use the keys and values
    # to build the options for our format line.
    for idx in "${!sorted_keys[@]}"; do                                                                 # For Loop collects option numbers and descriptions, appends them to $opts_line
        local idxVal=${sorted_keys[$idx]}
        local opts_line+=("${sorted_keys[$idx]}." "${arr_ref[$idxVal]}")
        local opts_count=$((opts_count + 1))
        if [ $col_count = 3 ] ; then                                                                    # If the column counter hits 3, print the line, and start a new one.
            local col_count=1
            local opts_line+=("")
            printf "${opts_line[@]}"
            local opts_line=("\t$ch%-2s%3s  %-25s%3s  %-25s%3s  %-20s%-2s$ch\n\t$ch%89s$ch\n" "" )
        elif [ $opts_count = $((${#sorted_keys[@]} + 1)) ] && [ $col_count -lt 3 ]; then                # If opts_count is equal to number of keys, and the col_count is less than 3, 
            local col_remain=$((3 - col_count))                                                         # fill in missing printf parameters with blanks, then print the line.
            for x in $(seq "1" "$col_remain"); do
                opts_line+=("") 
            done
            local opts_line+=("")
            printf "${opts_line[@]}"
        else 
            local col_count=$((col_count + 1))
        fi
    done

    printf "${menu_cap[@]}";printf "\n\n"           # Print the bottom cap for the menu, and display the prompt. 
    printf "${menu_prompt[@]}"
} # End Of Function display_menu()

# generate_case() takes the users menu selection and data from the opts array for the menu you are currently viewing 
# then uses it to generate and immediately evaluate a case statement. Dynamically generating the case statements like
# this allows us to generate an arbitrary number of options and relevant commands for execution.  
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

# run_menu() runs display_menu() and generate_case() on a loop.  Until the user exits the menu, or uses ctrl-c
# to interrupt processing, it will continue to run.  This function first runs display_menu() for main_menu,
# then reads input as $selection.  Then generates and evaluates the command for that option, before looping
# back to display the menu again.  
run_menu() {
    quitbit=1                                           # quitbit controls the while loop.  1 runs, anything else stops.
    current="main_"                                     # set menu to main for startup.
    while [ $quitbit -eq 1 ]; do                        # While Loop containing the menu execution logic.
        display_menu $current"menu"                     # Start by displaying $current_menu
        read -r selection                               # Read user input into $selection.
        opts_arr=$current"opts"                         # Load the _opts arrays for the current menu.
        command=$(eval $(generate_case $opts_arr))      # Derive the command by generating and evaluting the case statement.
        eval "$command"                                 # Evaluate the derived command.
    done
} # End of Function: handle_options()

# Actually execute the run_menu() function, so the script is executable as is.
run_menu