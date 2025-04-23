#!/bin/bash

# The if, elif, and else statements in Bash scripting facilitate
# decision-making based on conditions. 

# if statements execute a block of code if a condition is true.
# 
# if [ condition ]; then
#   code to execute if condition is true
# fi

# else statements execute a block of code if the if condition is
# false.
#
# if [ condition ]; then
#   Code to execute if condition is true
# else
#   Code to execute if condition is false
# fi

# elif statements check an additional condition if the preceding if
# condition is false.
#
# if [ condition1 ]; then
#   Code to execute if condition1 is true
# elif [ condition2]; then
#   Code to execute if condition1 is false and condition2 is true
# else
#   Code to execute if condition1 and condition2 are both false

# Conditions are often expressed using comparison operators.  Common
# comparison operators in BASH are:
# -eq :  equal
# -ne :  not equal
# -lt :  less than
# -le :  less than or equal to
# -gt :  greater than
# -ge :  greater than or equal to
# -z  :  empty string
# -n  :  not empty string
# =   :  string equality
# !=  :  string inequality
# -f  :  file exists
# -d  :  directory exists
# -r  :  readable
# -w  :  writable
# -x  :  executable

# You can combine multiple conditions by using the && (AND) 
# and || (OR) operators
#
# if [ condition1 ] && [ condition2 ]; then
#   Code to execute if both conditions are true
# fi
#
# if [ condition1 ] || [ condition2 ]; then
#   Code to execute if either condition1 or condition2 is true.
# fi

# Create Variables to execute conditions against.
name="Alice"
age=25
file="my_file.txt"

echo "Name = $name"
echo "Age = $age"
echo "File = $file"
echo;

# If $name is not an empty string.
echo "if [[ -n \"\$name\" ]]"
if [[ -n "$name" ]]; then
  echo "Name is not empty: $name"
fi
echo; echo;

# If age is greater than 18, else.
echo "if [ \$age -ge 18 ]"
if [ $age -ge 18 ]; then
  echo "$name is an adult"
else
  echo "$name is a minor"
fi
echo; echo;

# If File exists, else.
echo "if [ -f \"\$file\" ]"
if [ -f "$file" ]; then
  echo "File '$file' exists"
else
  echo "File '$file' does not exist"
fi

echo; echo;

# If Name is Alice and age is 25
echo "If [ \$name = \"Alice\" ] && [ \$age -eq 25 ]"
if [[ $name = "Alice" ]] && [ $age -eq 25 ]; then
  echo "Name is Alice and age is 25"
fi

echo; echo;

# If Name is Allen, Else If Age is 26, else....
echo "If [ \$name = \"Allen\" ], elif [ age = 26 ], else echo"
if [ $name = "Allen" ]; then
    echo "Name is Allen"
elif [ $age -eq 26 ]; then
    echo "Age is 25"
else
    echo "Name is not Allen and Age is not 25"
fi 