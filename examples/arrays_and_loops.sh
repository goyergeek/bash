#!/bin/bash



# Loops are a powerful tool in scripting and programing.
# This script file will cover the basic for, while, and 
# until loops, then describe some of the data structures 
# (types) you commonly work with when using them.


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
#   While Loop Structure (Executes WHILE condition is true):
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
#   Until Loop Structure (Executes UNTIL condition is true):
#       until [ condition ]
#       do
#           Code to be executed for each item
#       done
#
#   Until Loop Example:
#       counter=0
#       until [$counter -eq 5 ]
#       do
#           echo "Counter: $counter"
#           ((counter++))
#       done
#
#################################################################################
# # For Looping Through Arrays #
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


# Declare Indexed and Associative Arrays and populate them with elements.
my_indexed_array=("One" "Two" "Three" "Four")
declare -A my_associative_array
my_associative_array=(["FirstName"]="John" ["LastName"]="Doe" ["Age"]=55 ["Average"]=95)

# Examples of accessing elements from indexed arrays and looping.
echo "#################### Accessing Indexed and Associative Array Elements ####################"
echo ;
echo "----------Accessing Indexed Array Elements"
echo "my_indexed_array=(\"One\" \"Two\" \"Three\" \"Four\")"
echo "Number of indicies (\${#my_indexed_array[@]}): ${#my_indexed_array[@]}"
echo "Value at Index 2 (\${my_indexed_array[2]}): ${my_indexed_array[2]}"
echo "Value at Index 0 (\${my_indexed_array[0]}): ${my_indexed_array[0]}"
echo ;
echo "----------Accessing Associative Array Elements"
echo 'my_associative_array=(["FirstName"]="John" ["LastName"]="Doe" ["Age"]=55 ["Average"]=95)'
echo "Number of Key/Value Pairs (\${#my_associative_array[@]}): ${#my_associative_array[@]}"
echo "Value for Key FirstName (\${my_associative_array[\"FirstName\"]}): ${my_associative_array["FirstName"]}"
echo "Value for Key LastName (\${my_associative_array[\"LastName\"]}): ${my_associative_array["LastName"]}"
echo ;
echo "#################### Looping over Indexed and Associative Arrays ####################"
echo ;
echo "----------Looping Indexed Arrays"
echo "-----For Loop"
echo -n "Indexes and Values: "

for index in "${!my_indexed_array[@]}"; do
    echo -n "$index:${my_indexed_array[$index]} "
done

echo ; echo ;
echo "-----Until Loop"
echo -n "Indexes and Values: "
idxcounter=0
arrlen=${#my_indexed_array[@]}
arrlen=$((arrlen-1))
until [ $idxcounter -ge $arrlen ]; do
    echo -n "$idxcounter:${my_indexed_array[$idxcounter]} "
    idxcounter=$((idxcounter+1))
done


echo ; echo;
echo "-----While Loop"
echo -n "Indexes and Values:"
idxcounter=0
arrlen=${#my_indexed_array[@]}
arrlen=$((arrlen-1))
while [ $idxcounter -le $arrlen ]; do
    echo -n "$idxcounter:${my_indexed_array[$idxcounter]} "
    idxcounter=$((idxcounter+1))
done

echo ; echo;
echo "----------Looping Associative Arrays"
echo "-----For Loops"
echo -n "Keys: " 

for key in "${!my_associative_array[@]} "; do
    echo -n "$key "
done

echo ;
echo -n "Values: "
for value in "${my_associative_array[@]} "; do
    echo -n "$value "
done

echo ;
echo -n "Key Value Pairs: "

for key in "${!my_associative_array[@]}"; do
    echo -n "$key:${my_associative_array[$key]} "
done
echo ; echo ;

echo "----------Until Loop"
keycounter=0
arrlen=${#my_associative_array[@]}
arrlen=$((arrlen-1))
keys=("${!my_associative_array[@]}")
until [ $keycounter -ge $arrlen ]; do
    currentkey=${keys[$keycounter]}
    echo "Key: $currentkey, Value: ${my_associative_array[$currentkey]}"
    keycounter=$((keycounter+1))
done
echo ; echo ;

echo "----------While Loop"

keycounter=0
arrlen=${#my_associative_array[@]}
arrlen=$((arrlen-1))
keys=("${!my_associative_array[@]}")
while [ $keycounter -le $arrlen ]; do
    currentkey=${keys[$keycounter]}
    echo "Key: $currentkey, Value: ${my_associative_array[$currentkey]}"
    keycounter=$((keycounter+1))
done