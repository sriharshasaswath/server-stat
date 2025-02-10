#!/bin/bash

echo "===== Server Performance Stats ====="

# Total CPU usage
echo -e "\nCPU Usage:"
top -bn1 | grep "Cpu(s)" | awk '{print "Usage: " $2 + $4 "%"}'

# Total memory usage
echo -e "\nMemory Usage:"
free -m | awk 'NR==2{printf "Used: %sMB / %sMB (%.2f%%)\n", $3, $2, $3*100/$2}'

# Total disk usage
echo -e "\nDisk Usage:"
df -h / | awk 'NR==2 {print "Used: " $3 " / " $2 " (" $5 " used)"}'

# Top 5 processes by CPU usage
echo -e "\nTop 5 Processes by CPU Usage:"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6

# Top 5 processes by memory usage
echo -e "\nTop 5 Processes by Memory Usage:"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6
