#!/bin/bash

# Get pretty uptime and strip "up " from the beginning
raw_uptime=$(uptime -p | sed 's/^up //')

# Optional: compact it more (e.g., replace "hours" with "h", "minutes" with "m")
formatted_uptime=$(echo "$raw_uptime" | sed -E 's/hours?/h/g; s/minutes?/m/g; s/,//g')

echo "$formatted_uptime"

