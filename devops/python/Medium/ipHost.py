# https://medium.com/@dmitrijkumancev571/awesome-python-scripts-6711873a35c3
# Get Ipaddress and Hostname of Website
# importing socket library
import socket

def get_hostname_IP():
    hostname = input("Please enter website address(URL):")
    try:
        print (f'Hostname: {hostname}')
        print (f'IP: {socket.gethostbyname(hostname)}')
    except socket.gaierror as error:
        print (f'Invalid Hostname, error raised is {error}')
get_hostname_IP()
