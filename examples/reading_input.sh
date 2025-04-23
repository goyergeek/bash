#!/bin/bash

# Reading input from the user is simple in bash.  We simply use the read keyword after
# providing some kind of prompt to the user using an echo with the -e option to allow
# parsing of \ characters and read -r to not mangle the \ characters on read.

echo -e "First Name :: \c"; read -r firstname
echo -e "Last Name  :: \c"; read -r lastname
echo -e "Age        :: \c"; read -r age

printf "\nYour name is %s %s, and you are %d years old!\n" "$firstname" "$lastname" "$age"
