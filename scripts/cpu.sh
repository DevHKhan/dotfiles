#!/bin/bash

# Script to calculate CPU usage as a percentage

# Collect initial CPU stats
read -r cpu_line < /proc/stat
cpu_values=($cpu_line)
idle_start=${cpu_values[4]}
total_start=0

# Sum up all CPU columns from /proc/stat
for value in "${cpu_values[@]:1}"; do
  total_start=$((total_start + value))
done

# Wait for a second to measure the CPU activity
sleep 1

# Collect CPU stats after the wait
read -r cpu_line < /proc/stat
cpu_values=($cpu_line)
idle_end=${cpu_values[4]}
total_end=0

for value in "${cpu_values[@]:1}"; do
  total_end=$((total_end + value))
done

# Calculate differences
idle_diff=$((idle_end - idle_start))
total_diff=$((total_end - total_start))
cpu_usage=$((100 * (total_diff - idle_diff) / total_diff))

# Print the CPU usage
echo "$cpu_usage%"
