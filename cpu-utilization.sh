#!/bin/bash

# This script monitors CPU utilization and logs it to a file.

CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')

THRESHOLD=50

if (( $(echo "$CPU_USAGE > $THRESHOLD" | bc -l) )); then
    echo "$(date): High CPU usage detected: $CPU_USAGE%" >> /var/log/cpu_utilization.log
else
    echo "$(date): CPU usage is normal: $CPU_USAGE%" >> /var/log/cpu_utilization.log
fi