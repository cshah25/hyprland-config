#!/bin/bash
# Show last clipboard entry (truncated to 30 characters)

text=$(copyq read 0 2>/dev/null | head -c 30)
if [ -z "$text" ]; then
    echo "📋 empty"
else
    echo "📋 $text"
fi
