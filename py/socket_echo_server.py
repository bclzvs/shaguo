#!usr/bin/env python 
# -*- coding: utf-8 -*-
import socket

sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server_address = ('0.0.0.0', 1000)
sock.bind(server_address)
sock.listen(1)

while True:
	print 'waiting for a connection'
	connection, client_addr = sock.accept()
	try:
		print 'connection from', client_addr
		data = connection.recv(1024)
		if data:
			print data.decode('utf-8')
			connection.sendall(data)
		else:
			print 'no data from', client_addr
	finally:
		connection.close()
		
		
