#!/bin/bash

# Get the used memory in kilobytes using the `free` command
used_memory_kb=$(free -k | awk '/^Mem:/ {print $3}')

# Convert KB to GB (1 GB = 1000 * 1000 KB)
used_memory_gb=$(echo "scale=1; $used_memory_kb / (1000 * 1000)" | bc)

# Print the result
echo "${used_memory_gb} "

