#!/bin/bash

# Bash functions are reusable blocks of code that
# perform specific tasks within a script.  They 
# help organize code, reduce redundancy, and
# improve readability.  Functions are one of the most
# powerful concepts in scripting and programming in 
# general.

# Defining a Function
#
# function_name() {
#   code block to be executed
# }
#
# or
#
# function function_name {
#   code block to be executed
# }

# Function arguments
# Arguments can be passed to functions, accessed using $1, $2, etc.
#
# greet() {
#   echo "Hello, $1!"
# }
#
# greet "World"
# Output: Hello, World!

# Variable Scope
#
# Scope indicates where a variable is actually defined. and 
# accessible from. For instance, a variable declared within a 
# function with the local keyword, are scoped only to the
# function. Meaning, the variable will not be accessible outside
# the function, and therefore has a 'local' scope. Variables that
# are accessible outside the function, like environment variables,
# are considered to have 'global' scope. A variable in local scope
# is removed from memory when the function call closes.  
# A full explanation of scope as it relates to scripting and 
# programming is a much more advanced topic than this tutorial 
# is designed to provide.
#
# function my_function {
#   local my_var="function scope"
#   echo $my_var
# } 
#
# my_function       Output: function scope
# echo $my_var      Output: (empty string or previous value)

# Return Values
#
# Functions can return values using return.  The return value is
# limited to an integer between 0 and 255. This is unlike other 
# languages which will let your return almost any data structure
# such as an array, string, or even another function.  
# With Bash, return is essentially the same as an exit status  
# of the function.  
#
# function add {
#   return $(($1+$2))
# }
#
# add 5 3
# echo $?       Output: 8
#

# Example Functions
#
function check_file {
    if [ -f "$1" ]; then
        echo "File '$1' exists!"
    else
        echo "File '$1' does not exist."
    fi
}


check_day() {
    case "$1" in
        *"day")
            echo "The string ends in day"
            ;;&
        Monday|Tuesday|Wednesday|Thursday|Friday|Saturday|Sunday)
            echo "The string is a valid day"
            ;;&
        Saturday|Sunday)
            echo "The string is a weekend"
            ;;&
        Monday|Tuesday|Wednesday|Thursday|Friday)
            echo "The string is a weekday"
            ;;&
        Friday)
            echo "Today is Friday! The weekend starts tomorrow!"
            ;;
        *)
            if [[ "$1" = "Monday" || "$1" = "Tuesday" || "$1" = "Wednesday" || "$1" = "Thursday" || "$1" = "Friday" || "$1" = "Saturday" || "$1" = "Sunday" ]]; then
                return 0
            else
                echo "The string did not end in day, and\or was not a valid day name"
                echo "Please use a valid day name (Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday)."
                return 1
            fi
            
            ;;
    esac
}

printf "%s\n" "check_file '/madeupdirectory/nope.txt' Output:"
check_file '/madeupdirectory/nope.txt'     # Output: "File ~/madupdirectory/nope.txt does not exist."
printf "\n%s\n" "check_file '/bin/bash' Output:"
check_file '/bin/bash'                     # Output: "File /bin/bash exists!"
printf "\n%s\n" "check_day \"Monday\"  Output:" 
check_day "Monday"      # Output: The string ends in day; The string is a valid day; The string is a weekday
printf "\n%s\n" "check_day \"Tuesday\"  Output:" 
check_day "Tuesday"     # Output: The string ends in day; The string is a valid day; The string is a weekday
printf "\n%s\n" "check_day \"Friday\"  Output:" 
check_day "Friday"      # Output: The string ends in day; The string is a valid day; The String is a weekday; Today is Friday! The weekend starts tomorrow!
printf "\n%s\n" "check_day \"Saturday\"  Output:" 
check_day "Saturday"    # Output: The string ends in day; The string is a valid day; The string is a weekend
printf "\n%s\n" "check_day \"Thursding\"  Output:" 
check_day "Thursding"   # Output: The string did not end in day, and\or was not a valid day; Please use a valid day name (Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday).
printf "\n"
