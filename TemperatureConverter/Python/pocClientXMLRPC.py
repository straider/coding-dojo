import xmlrpclib

server  = xmlrpclib.ServerProxy( 'http://localhost:10000/', verbose = True )
service = server.units_converter

#~ print service.calculate( -40.0, 'C', 'F' )
try :
  result = service.calculate( 20.1234567, 'C', 'F' )
  print result
  print result[ 'last_conversion_on' ].__class__
except Exception, error :
  print '  Fault code: ', error.faultCode
  print '  Message   : ', error.faultString
