#!/bin/bash

# Get the available memory in kilobytes using the `free` command
available_memory_kb=$(free -k | awk '/^Mem:/ {print $7}')

# Convert KB to GB (1 GB = 1000^3 bytes, 1 GB = 1000 * 1000 * 1000 bytes, 1 KB = 1000 bytes)
available_memory_gb=$(echo "scale=1; $available_memory_kb / (1000 * 1000)" | bc)

# Print the result
echo "${available_memory_gb} "
