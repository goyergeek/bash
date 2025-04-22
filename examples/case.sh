#!/bin/bash

# The case statement in Bash is similar to a switch statement
# in other programming languages. It provides a way to execute
# different blocks of code based on the value of a variable or
# expression. The case statement is often prefferred over a 
# series of if-elif-else statements when dealing with multiple
# possible values because it can be more readable and maintainable

# The case statement evaluates the expression and compares it
# against each pattern. If a match is found, the corresponding
# commands are executed. The ;; (double semicolon) is used to 
# terminate the command list for each case. The *) pattern is 
# default case that matches any value not matched by the other 
# patterns. The esac keyword is used to end the case statement.

# Basic syntax of a case statement in Bash:
#
# case expression in
#   pattern1)
#       commands1
#       ;;
#   pattern2)
#       commands2
#       ;;
#   *)
#       default_commands
#       ;;
# esac

# The case statement can also be used with more complex 
# patterns, such as wildcards and regular expressions.  For
# example, the following case statement checks if a file name
# ends with ".txt"
#
# file_name="my_file.txt"
#
# case "$file_name" in
#     *.txt)
#         echo "This is a text file"
#         ;;
#     *)
#         echo "This is not a text file."
#         ;;
# esac

# Finally, by default, when a pattern matches, the corresponding
# commands are executed, and the case statement exits.  To allow
# fall-through to the next case, replace ;; with ;& or ;;&.
#
# ;&  Executes the current case block and then the next as 
# if the next pattern matched too
#
# ;;&  Executes the current case block and then tests the next
# pattern.  If it matches, it's commands are executed as well.

# The following case example will run until one of the conditions
# evaluates to True, then exit.

# my_string="not right" would output:
#   The string is not right.

my_string="example string"
case "$my_string" in
    "not right")
        echo "The string is not right"
        ;;
    "still not right")
        echo "The String is still not right"
        ;;
    "example string")
        echo "example string is the matching string"
        ;;
esac

# This case example shows the use of ;;& usage, allowing the case
# statement to continue evaluating conditions even if it evalutes
# True.

# my_string="Tuesday" would output:
#   The string ends in day
#   The string is a valid day
#   The string is a weekday

my_string="Friday"

case "$my_string" in
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
        echo "The string did not end in day, and was not a valid day"
        echo "Please use a valid day name (Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday)."
        ;;
esac