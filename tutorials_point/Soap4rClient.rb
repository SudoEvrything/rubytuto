gem 'soap4r'
require 'soap/rpc/driver'

NAMESPACE = 'urn:ruby:calculation'
URL = 'http://localhost:8080/'

begin
	driver = SOAP::RPC::Driver.new(URL, NAMESPACE)
	
	#Add remote service methods
	driver.add_method('add', 'a', 'b')
	
	#Call remote service methods
	puts driver.add(20, 30)
rescue => err
	puts err.message
end
