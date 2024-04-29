import socket
import time

def get_local_ip():
    return socket.gethostbyname(socket.gethostname())

def write_to_file(ip_address):
    with open('ip_address.txt', 'a') as file:
        file.write(ip_address + '\n')

while True:
    ip_address = get_local_ip()
    print(ip_address)
    write_to_file(ip_address)
    time.sleep(300)  # Sleep for 5 minutes
