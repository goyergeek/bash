#!/bin/bash



# Loops are a powerful tool in scripting and programing.
# This script file will cover the basic for and while
# loops, and describe some of the data structures (types)
# you commonly work with when using them.


#################################################################################
# Arrays and Loops
#################################################################################
# # Arrays #
#
# Bash arrays are data structures that allow storing multiple values within
# a single variable. There are two types of arrays in Bash Indexed and
# Associative 
#
# Indexed Arrays: Elements are accessed using numerical indices,
# starting from 0.
# 
# Associative arrays: Elements are accessed using unique string keys.
# 
# # Declaring Arrays #
#
#   Indexed Array: 
#       array_name=(value1 value2 value3)
#
#   Associative Arrays:
#       declare -A associative_array_name
#       associative_array_name=([key1]=value1 [key2]=value2 [key3]=value3)
#
# # Accessing Array Elements #
# 
#   Indexed Array:
#       ${array_name[index]}    -- Access element at index
#       ${array_name[@]}        -- Access all elements
#       ${#array_name[@]}       -- Get the number of elements
#
#   Associative Array:
#       ${associative_array_name[key]}  -- Access element with key
#       ${!associative_array_name[@]}   -- Get all keys
#       ${associative_array_name[@]}    -- Get all values
#
# # Modifying Arrays #
#
#   Indexed Array:
#       array_name[index]=new_value     -- Modify element at index
#       array_name+=(new_value)         -- Append an element
#       unset array_name[index]         -- Delete element at index
#
#   Associative Array:
#       associative_array_name[key]=new_value           -- Modify element with key
#       associative_array_name+=( [new_key]=new_value ) -- Add new key-value pair
#       unset associative_array_name[key]               -- Delete element with key
#
#################################################################################
# # Loops #
#
# Bash Loops are control flow structures that allow you to execute a block of
# code repeatedly.  There are three main types of loops in Bash: for, while and
# until.
# 
# For Loop: The for loop iterates over a sequence of items, such as a list of 
# strings, or a range of numbers.
#
# While Loop: The while loop executes a block of code as long as a condition
# is true.  It is important to ensure that something causes the condition to
# evaluate as false eventually, or the loop will run infinitely.
#
# Until Loops: The until loop executes a block of code as long as a condition
# is false.  It is important to ensure that something causes the condition to
# evaluate as false evantually, or the loop will run infinitely.
#
# # Declaring Loops #
#   
#   For Loop Structure:
#       for item in list
#       do
#           Code to be executed for each item
#       done
#       
#   For Loop Example:
#       for i in 1 2 3 4 5
#       do
#           echo "Number: $i"
#       done
#
#   While Loop Structure:
#       while [ condition ]
#       do
#           Code to be executed for each item
#       done
#
#   While Loop Example:
#       counter=0
#       while [ $counter -lt 5 ]
#       do
#           echo "Counter: $counter"
#           ((counter++))
#       done
#
#   Until Loop Structure:
#       until [ condition ]
#       do
#           Code to be executed for each item
#       done
#
#   Until Loop Example:
#       until [$counter -gt 5 ]
#       do
#           echo "Counter: $counter"
#       done
#
#################################################################################
# # Looping Through Arrays #
#
# Indexed Array:
#   for i in "${!array_name[@]}"; do
#       echo "Index: $i, Value: ${array_name[$i]}"
#   done
#
# Associative Array:
#   for key in "${!associative_array_name[@]}"; do
#       echo "Key: $key, Value: ${associative_array_name[$key]}"
#   done
#
#################################################################################

# Indexed Array with For Loops

# Declare Indexed Array and populate it with items.
my_indexed_array=("One" "Two" "Three" "Four")

# Display the number of items in the array, then the value at index 2 and 0, finally Index/Value pairs.
echo "Number of indicies in my_indexed_array: ${#my_indexed_array[@]}"
echo "Value at Index 2 of my_indexed_array: ${my_indexed_array[2]}"
echo "Value at Index 0 of my_indexed_array: ${my_indexed_array[0]}"
echo ;
echo "For Loop Output of my_indexed_array indicies and values:  "
for index in "${!my_indexed_array[@]}"; do
    echo "Index: $index, Value: ${my_indexed_array[$index]}"
done

# Associative Array with For Loops

# Declare Associative Array, then Populate it with key/value pairs.
declare -A my_associative_array
my_associative_array=(["FirstName"]="John" ["LastName"]="Doe" ["Age"]=55 ["Average"]=95)

# Display number of items in associative array, then all keys, all values, then key/value pairs.
echo "Number of key/value pairs in my_associative_array: ${#my_associative_array[@]}"
echo "Keys for my_associative_array:" 
for key in "${!my_associative_array[@]}"; do
    echo "$key"
done
echo "Values for my_associative_array:"
for value in "${my_associative_array[@]}"; do
    echo "$value"
done
echo "Key Value Pairs from For Loop:"
for key in "${!my_associative_array[@]}"; do
    echo "Key: $key  |  Value: ${my_associative_array[$key]}"
done