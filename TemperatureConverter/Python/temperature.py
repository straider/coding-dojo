class Temperature :

  def convert( self, value, source_unit, target_unit ) :
    conversion = source_unit.upper() + target_unit.upper()
    # http://simonwillison.net/2004/May/7/switch/
    result = {
      'CF': lambda value : float( value ) * 9 / 5 + 32,
      'FC': lambda value : ( float( value ) - 32 ) * 5 / 9
    }[ conversion ]( value )
    return result

if __name__ == '__main__' :
  temperature = Temperature()
  print '-40.0 C <=> ' + str( temperature.convert( -40, 'c', 'f' ) ) + ' F'
  print '-40.0 F <=> ' + str( temperature.convert( -40, 'f', 'c' ) ) + ' C'
