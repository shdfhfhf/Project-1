#!/bin/bash

echo "---------------------------------------"
echo "      SERVER PERFORMANCE STATS         "
echo "---------------------------------------"

echo ""
echo "1️⃣ CPU Usage:"
top -bn1 | grep "Cpu(s)" | awk '{print "CPU Usage: " 100 - $8 "%"}'

echo ""
echo "2️⃣ Memory Usage:"
free -m | awk 'NR==2{
    total=$2;
    used=$3;
    free=$4;
    printf "Total: %sMB\nUsed: %sMB\nFree: %sMB\nUsage: %.2f%%\n", total, used, free, used*100/total
}'

echo ""
echo "3️⃣ Disk Usage:"
df -h --total | grep 'total' | awk '{
    print "Total: " $2 "\nUsed: " $3 "\nFree: " $4 "\nUsage: " $5
}'

echo ""
echo "4️⃣ Top 5 Processes by CPU Usage:"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6

echo ""
echo "5️⃣ Top 5 Processes by Memory Usage:"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n 6
