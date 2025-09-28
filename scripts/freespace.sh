#!/bin/bash

# Calculate the total amount of free and unused disk space in GiB

# Get the total free space across all filesystems
free_space=$(df --block-size=1G --total | grep 'total' | awk '{print $4}')

# Convert free space from GB to a formatted string with one decimal place
formatted_space=$(printf "%.1f " "$free_space")

# Output the formatted free space
echo "$formatted_space"
