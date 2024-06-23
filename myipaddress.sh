#!/bin/bash

# This script continuously retrieves the local IP address, adds a timestamp,
# and saves it to a text file.  It will only update the file if the IP address
# has changed.

# Check for optional output file argument
if [ $# -eq 0 ]; then
    # If no argument provided, use a default location for the output file
    output_file=~/Library/Mobile\ Documents/com\~apple\~CloudDocs/Developer/macOS/Shell\ Scripts/MyIPAddress/ip_address.txt
elif [ $# -eq 1 ]; then
    # If one argument provided, use it as the output file path
    output_file="$1"
else
    # Script usage message and exit with error code 1
    echo "Usage: $0 [output_file]"
    exit 1
fi

# Get the current date and time in YYYY-MM-DD HH:MM:SS format for timestamp
timestamp=$(date +"%Y-%m-%d %H:%M:%S")

# Use 'ifconfig' to get network interface information
# Filter loopback addresses (127.0.0.1) and extract the IPv4 address using awk
ip_address=$(ifconfig | grep "inet " | grep -Fv 127.0.0.1 | awk '{print $2}')

# Display timestamp and IP address on the terminal with a newline
echo -e "[$timestamp] My IP is: $ip_address\n"

# Write the timestamp and IP address to the output file, overwriting previous content
echo "[$timestamp]  My IP is: $ip_address" > "$output_file"
# write to console
syslog -s "My IP is: $ip_address"
