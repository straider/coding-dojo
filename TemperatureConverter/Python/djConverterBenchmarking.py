from temperature import Temperature
import time

temperature = Temperature()

INCREMENT = 0.05
start_time = time.time()

print 'From Celsius to Fahrenheit:'
value = -273.15
for steps in range( 0, 10000 ) :
  print '% 8.2f <=> % 8.2f' % ( value, temperature.convert( float( value ), 'c', 'f' ) )
  value = value + INCREMENT

print 'From Fahrenheit to Celsius:'
value = -459.67
for steps in range( 0, 10000 ) :
  print '% 8.2f <=> % 8.2f' % ( value, temperature.convert( float( value ), 'f', 'c' ) )
  value = value + INCREMENT

end_time = time.time()

print 'Elapsed Time = % 4.2f seconds' % ( end_time - start_time )
