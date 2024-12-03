#!/bin/bash

# Check if acpi command is available
if ! command -v acpi &> /dev/null; then
    notify-send "Error: 'acpi' command is not available. Install it to use this script."
    exit 1
fi

# Infinite loop to monitor battery status
while true; do
    # Get the battery percentage using acpi
    POWER=$(acpi -b | grep -o '[0-9]\+%' | head -1 | tr -d '%')

    # Check if the battery percentage is less than or equal to 15
    if [[ $POWER -le 15 ]]; then
        notify-send "Battery power is low: ${POWER}%! Please charge your device."
    fi

    # Wait for 30 seconds before checking again
    sleep 30
done

