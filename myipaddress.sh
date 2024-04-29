#!/bin/bash

# This script continuously retrieves the local IP address,
# adds a timestamp, and saves it to a text file.

if [ $# -eq 0 ]; then
    output_file=~/Library/Mobile\ Documents/com\~apple\~CloudDocs/Developer/macOS/Shell\ Scripts/MyIPAddress/ip_address.txt
elif [ $# -eq 1 ]; then
    output_file="$1"
else
    echo "Usage: $0 [output_file]"
    exit 1
fi

# Initialize the previous IP address variable
prev_ip_address=""

while true; do
    # Get the current timestamp in the format "YYYY-MM-DD HH:MM:SS"
    timestamp=$(date +"%Y-%m-%d %H:%M:%S")

    # Use 'ifconfig' to get network interface information,
    # filter out loopback addresses (127.0.0.1), and extract the IPv4 address
    ip_address=$(ifconfig | grep "inet " | grep -Fv 127.0.0.1 | awk '{print $2}')

    # Compare the current IP address with the previous IP address
    if [ "$ip_address" != "$prev_ip_address" ]; then
        # Display the timestamp and IP address in the terminal
        echo -e "[$timestamp] $ip_address\n$output_file"

        # Write the timestamp and IP address to the specified text file
        echo "[$timestamp] $ip_address" > "$output_file"

        # Update the previous IP address variable
        prev_ip_address="$ip_address"
    else
        # Display the timestamp and IP address in the terminal
        echo -e "[$timestamp] no IP change $ip_address\n$output_file"
        # Write the timestamp and IP address to the specified text file
        echo "[$timestamp] no IP change $ip_address" > "$output_file"
    fi

    # Pause the script for 60 seconds before the next iteration
    sleep 60
done
