#!/bin/bash

# This script monitors CPU utilization and logs it to a file.

#!/bin/bash

CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')

THRESHOLD=80

if (( $(echo "$CPU_USAGE > $THRESHOLD" | bc -l) )); then
  echo "ALERT 🚨 CPU usage is high: $CPU_USAGE%"
else
  echo "CPU usage is normal: $CPU_USAGE%"
fi
