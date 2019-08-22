require 'socket'

host = 'www.tutorialspoint.com'
port = 80
path = '/index.htm'

#This is the HTTP request we send to fetch a file
request = "GET #{path} HTTP/1.0\r\n\r\n"

socket = TCPSocket.open(host,port) #Connect to server
socket.print(request)	#send request
response = socket.read	#Read complete response
#Split response at first blank line into headers and body
headers,body = response.split("\r\n\r\n", 2)
print body	#display it