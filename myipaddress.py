#!/usr/bin/env python3

import os
import time
import socket
from datetime import datetime

def get_local_ip():
    hostname = socket.gethostname()
    ip_address = socket.gethostbyname(hostname)
    return ip_address

def main(output_file):
    prev_ip_address = ""

    while True:
        timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        ip_address = get_local_ip()

        if ip_address != prev_ip_address:
            print(f"[{timestamp}] {ip_address}")

            with open(output_file, "w") as file:
                file.write(f"[{timestamp}] {ip_address}\n")

            prev_ip_address = ip_address

        time.sleep(60)

if __name__ == "__main__":
    if len(os.sys.argv) == 1:
        output_file = os.path.expanduser("~/Desktop/ip_address.txt")
    elif len(os.sys.argv) == 2:
        output_file = os.sys.argv[1]
    else:
        print("Usage:", os.sys.argv[0], "[output_file]")
        os.sys.exit(1)

    main(output_file)
