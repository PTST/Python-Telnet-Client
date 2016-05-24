import getpass
import sys
import telnetlib
import time

HOST = "85.81.8.40"
user = "support"
password = "daca1ea1fb"
port = "23023"
acs = "wireless acs rescan"
cnt = "connection stats"

tn = telnetlib.Telnet()

tn.open(HOST, port, 10)
tn.set_debuglevel(1)
tn.read_until("Username : ")
time.sleep(1)
tn.write(user + "\r\n")
if password:
    tn.read_until("Password : ")
    time.sleep(1)
    tn.write(password + "\r\n")

tn.read_until("MediaAccess")
time.sleep(1)
tn.write(command + "\r\n")
tn.write("exit\r\n")

print tn.read_all() 