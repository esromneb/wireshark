import time
from socket import *

clientSocket = socket(AF_INET, SOCK_DGRAM)
clientSocket.settimeout(1)
message = 'test'.encode()
addr = ('127.0.0.1', 1234)

start = time.time()
clientSocket.sendto(message, addr)
try:
    data, server = clientSocket.recvfrom(1234)
    end = time.time()
    elapsed = end - start
    print('%s %d' % (data, elapsed))
except timeout:
    print('REQUEST TIMED OUT')
