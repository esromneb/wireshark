from socket import *

serverSocket = socket(AF_INET, SOCK_DGRAM) # UDP
serverSocket.bind(('', 1234))

while True:
    message, address = serverSocket.recvfrom(1024) # buffer size
    serverSocket.sendto('thanks'.encode(), address)
