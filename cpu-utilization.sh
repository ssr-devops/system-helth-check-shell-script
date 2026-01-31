#!/bin/bash

# This script monitors CPU utilization and logs it to a file.


CPU_IDLE=$(top -bn1 | awk '/Cpu/ {print $8}')
CPU_USAGE=$((100 - ${CPU_IDLE%.*}))


THRESHOLD=50

if [ "$CPU_USAGE" -ge "$THRESHOLD" ]; then
  echo "ALERT 🚨 CPU usage is high: $CPU_USAGE%"
else
  echo "CPU usage is normal: $CPU_USAGE%"
fi