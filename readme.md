# IP Address Logger

2023.08.13 - Christian Möller

This repository contains three code files: a shell script, a Python script, and a Swift program, all of which serve the purpose of continuously retrieving the local IP address, adding a timestamp, and saving the information to a text file.

## Shell Script (myipaddress.sh)

The `myipaddress.sh` shell script is responsible for retrieving the local IP address and saving it, along with a timestamp, to a text file. It continuously checks for changes in the IP address and updates the file accordingly. Here's how it works:

1. It takes an optional command-line argument specifying the output file path. If no argument is provided, the default path is `~/Desktop/ip_address.txt`.
2. The script initializes a variable to store the previous IP address.
3. In an infinite loop:
   - It obtains the current timestamp.
   - It uses the `ifconfig` command to extract the IPv4 address, excluding loopback addresses.
   - If the current IP address differs from the previous one:
     - It displays the timestamp and IP address in the terminal.
     - It writes the timestamp and IP address to the specified text file.
     - It updates the previous IP address variable.
   - It pauses the script for 60 seconds before the next iteration.

## Python Script (myipaddress.py)

The `myipaddress.py` Python script achieves the same goal as the shell script but uses Python for implementation. Here's how it works:

1. It imports necessary libraries: `os`, `time`, `socket`, and `datetime`.
2. It defines a function, `get_local_ip()`, to retrieve the local IP address using the hostname.
3. It takes an optional command-line argument specifying the output file path. If no argument is provided, the default path is `~/Desktop/ip_address.txt`.
4. The script initializes a variable to store the previous IP address.
5. In an infinite loop:
   - It obtains the current timestamp.
   - It uses the `get_local_ip()` function to retrieve the IPv4 address.
   - If the current IP address differs from the previous one:
     - It displays the timestamp and IP address in the terminal.
     - It writes the timestamp and IP address to the specified text file.
     - It updates the previous IP address variable.
   - It pauses the script for 60 seconds before the next iteration.

## Swift Program (myipaddress.swift)

The `myipaddress.swift` Swift program also accomplishes the same objective using Swift programming language. Here's how it works:

1. It defines a function, `getLocalIP()`, which uses a shell command to retrieve the local IP address.
2. It defines a function, `main(outputFile:)`, to periodically retrieve the IP address, similar to the shell and Python scripts.
3. The script checks the number of command-line arguments:
   - If only one argument is provided, it generates the output file path on the user's desktop and calls `main(outputFile:)`.
   - If two arguments are provided (executable name and output file path), it uses the provided output file path and calls `main(outputFile:)`.
   - If an incorrect number of arguments is provided, it displays usage information and exits.

## Usage

To use any of the provided scripts or Swift program, follow these steps:

1. Make the script/program executable (if needed): `chmod +x ip_address.sh`.
2. Run the script/program: `./ip_address.sh [output_file]`.
3. You can compile the swift code in XCode, copy it to main.swift. Target macOS can be from 10.13 up.

If you don't provide an output file argument, the scripts will save the IP address information to a file named `ip_address.txt` on your desktop by default.

Remember to replace `[output_file]` with the desired file path if you choose to provide a custom output file location.