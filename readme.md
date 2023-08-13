```markdown
# IP Address Tracking Script
# 2023.08.11
# code by Christian Möller

This shell or python-script continuously retrieves the local IP address, adds a timestamp,
and saves it to a text file on a given path or the desktop as default if no path was given.
It can be useful for monitoring your device's IP address changes over time.
It was made on a Mac running macOS 13.4 Ventura but it
should run on older macOS versions as well

## Table of Contents

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Usage](#usage)
- [Customization](#customization)
- [Stopping the Script](#stopping-the-script)
- [License](#license)

## Overview

This shell script is designed to run on macOS and uses the Bash shell.
It fetches the local IPv4 address of your device's active network interface,
appends a timestamp to it, and displays it in the terminal.
Additionally, it writes the timestamped IP address to a text file
named `ip_address.txt` on your desktop, allowing you to track
IP changes over time. It does that only if the IP addresss changes.

## Prerequisites

- macOS (tested on macOS 10.13)
- Bash shell (usually pre-installed on macOS)

## Usage

1. Download or clone this repository to your local machine.
2. Open Terminal and navigate to the directory containing the script.

```bash
cd /path/to/ip-address-script
```

3. Make the script executable if needed:

```bash
chmod +x ip_address_script.sh
```

4. Run the script:

```bash
./ip_address_script.sh
```

The script will start fetching and tracking your IP address at one-minute intervals.

## Customization

You can customize the behavior of the script by modifying the following:

- `sleep` duration: In the script, you can adjust the `sleep` duration
to change how often the IP address is checked and updated.

## Stopping the Script

To stop the script, press `Ctrl + C` in the terminal where the script is running.

## License

This script is released under the [MIT License](LICENSE).

Feel free to use, modify, and distribute the script according to the terms of the license.

---

_Disclaimer: This script is provided as-is and may not work in all environments
or under all conditions. Use it responsibly and at your own risk._
```

Replace `/path/to/ip-address-script` with the actual path to the directory where your script is located.
