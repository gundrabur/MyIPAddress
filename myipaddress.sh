#!/bin/bash

# This script continuously retrieves the local IP address,
# adds a timestamp, and saves it to a text file on the desktop.

while true; do
    # Get the current timestamp in the format "YYYY-MM-DD HH:MM:SS"
    timestamp=$(date +"%Y-%m-%d %H:%M:%S")

    # Use 'ifconfig' to get network interface information,
    # filter out loopback addresses (127.0.0.1), and extract the IPv4 address
    ip_address=$(ifconfig | grep "inet " | grep -Fv 127.0.0.1 | awk '{print $2}')

    # Display the timestamp and IP address in the terminal
    echo "[$timestamp] $ip_address"

    # Write the timestamp and IP address to a text file named 'ip_address.txt' on the desktop
    echo "[$timestamp] $ip_address" > ~/Desktop/ip_address.txt

    # Pause the script for 60 seconds before the next iteration
    sleep 60
done
