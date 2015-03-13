import xmlrpclib

server = xmlrpclib.ServerProxy( 'http://localhost:10000', verbose = False, allow_none = True )
# server = xmlrpclib.ServerProxy( 'http://localhost:10000/xmlrpc-in-java/', verbose = False, allow_none = True )
# server = xmlrpclib.ServerProxy( 'http://localhost:10000/xmlrpc-in-ruby/', verbose = False, allow_none = True )

# Print list of available methods
#~ for method_name in server.system.listMethods() :
  #~ print '=' * 60
  #~ print method_name
  #~ print '-' * 60
  #~ print server.system.methodSignature( method_name )
  #~ print server.system.methodHelp( method_name )
  #~ print
#~ print '=' * 60
# print 'MethodSignature: ', server.system.methodSignature( 'temperature.convert' )
# print 'MethodHelp:      ', server.system.methodHelp( 'temperature.convert' )
# print

temperature = server.temperature

print 'From Celsius to Fahrenheit:'
values = [ -273.15, -40, 0, 100 ]
for value in values :
  print '% 8.2f <=> % 8.2f' % ( value, temperature.convert( float( value ), 'c', 'f' ) )

print 'From Fahrenheit to Celsius:'
values = [ -459.67, -40, 0, 212 ]
for value in values :
  print '% 8.2f <=> % 8.2f' % ( value, temperature.convert( float( value ), 'f', 'c' ) )

try :
  print
  print 'Raise fault:'
  #~ print temperature.convert( -40.0, 'F', 'F' )
  #~ print temperature.convert( -40.0, None, 'F' )
  print temperature.convert( None, None, None )
except Exception, error :
  print '  Fault code: ', error.faultCode
  print '  Message   : ', error.faultString
