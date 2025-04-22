#!/bin/bash

# This example shows how to construct a simple menu using the concepts
# explained in the examples for the read, input, if, then,
# else, elif, arrays and loops, and case constructs.

# Clear the Screen
clear

# Instantiate a While Loop to contain our menu until the user chooses the option to exit.
quitbit=1
while [ $quitbit -eq 1 ]; do
    # Clear the Screen every time the loop runs, so the menu is always front and center top screen.
    clear

    # Use printf to format the menu table and border.
    printf "\n\n\n"
    printf "\t%*s\n" 102 "" | tr ' ' '*'
    printf "\t*%-100s*\n" "" 
    printf "\t*%-4s%-30s %-30s %-30s%-4s*\n" "" "1. Show Contents of /dev" "2. List Current Filesystems" "3. Show Contents of /etc/fstab" ""
    printf "\t*%-100s*\n" ""
    printf "\t*%-4s%-30s %-30s %-30s%-4s*\n" "" "4. List Block Devices" "5. List Network Hardware" "6. Exit The Menu" ""
    printf "\t*%-100s*\n" ""    
    printf "\t%*s\n\n" 102 "" | tr ' ' '*'
    
    # Create a prompt for the menu and then read in input from the same line.
    printf "\t* %s :: " "Option (1-6)"; read -r option

    # case $option and execute code according to option entered.
    case $option in 
        1)
            clear
            ls -lhF /dev --color=always | less -r
            ;;
        2)
            clear
            df -ahT | less
            ;;
        3)
            clear 
            cat /etc/fstab | less
            ;;
        4)
            clear 
            lsblk | less
            ;;
        5)
            clear
            lshw -C network | less 
            ;;
        6)
            printf "\n\t The menu will now exit.\n\t Press Enter to continue..."; read -p ""
            clear
            quitbit=0
            ;;
        *)
            printf "\n\t Invalid option, please enter an valid menu option (1-6)\n\t Press Enter to continue..."; read -p ""
            ;;
    esac     
done