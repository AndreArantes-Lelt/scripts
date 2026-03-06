#!/bin/bash
source database/config.sh

if docker inspect --format='{{.State.Running}}' "$CONTAINER" 2>/dev/null | grep -q "true"; then
    echo ""$CONTAINER" already running."
else
    echo "Running "$CONTAINER"..."
    docker start "$CONTAINER" &>/dev/null
fi
