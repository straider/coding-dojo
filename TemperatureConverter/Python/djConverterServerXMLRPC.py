from SimpleXMLRPCServer import SimpleXMLRPCServer
from temperature        import Temperature

server = SimpleXMLRPCServer( ( 'localhost', 10000 ), allow_none = True )
server.register_introspection_functions()

def convert( value, source_unit, target_unit ) :
  instance = Temperature()
  return instance.convert( value, source_unit, target_unit )
server.register_function( convert, 'temperature.convert' )

try :
  print 'Temperature Converter listening on port 10000. Use Control-C to exit'
  server.serve_forever()
except KeyboardInterrupt :
  print 'Exiting'
