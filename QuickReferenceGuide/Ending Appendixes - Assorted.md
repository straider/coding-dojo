Quick Reference Guide
=====================

# 11. Core Packages / Standard Library

## 11.1 BigDecimal

## 11.2. File Handling / Input-Output

These are the basic methods to work with files:

- ```open()```: opens a file, for reading ( "r" ) or writing ( "w" ) and returns a file handler to it;
- ```read()```: reads the entire file content to memory;
- ```write()```
- ```close()```

**Note**: a file handler, returned from ```open()``` works just like a sequence.

```python
file_handler = open( 'somefile.txt', 'rU' )

for line in file_handler :
  print line
```

**Note**: ```U``` is the "Universal" option for text files where it's smart about converting different line-endings so they always come through as a simple ```'\n'```.

To handle UTF-8 all it's required is to pass a 3rd argument while using codecs module:

```python
import codecs

file_handler = codecs.open( 'somefile.txt', 'rU', 'UTF-8' )

for line in file_handler :
  print line
```

## 11.3. Random Numbers

- Python comes with a random number generator;
- The module Random has to be imported, first;
- ```random.random()```: returns a random number between 0 and 1, including 0;
- ```random.randint( a, b )```: returns an int from a to b inclusive;
- ```random.randrange( [start], stop[, step] )```: returns an integer from start ( inclusive ) to stop (not included ), skipping numbers by step;
  - If step is not specified ( only two parameters ), it defaults to 1;
  - If start is also omitted ( only one parameter ), it defaults to 0.
- ```random.choice( list )```: returns a random value from the list or a random character from a string ( list of characters ).


```python
import random

random.random()

random.randint(   1, 10 )
random.randint( -10, 10 )

random.randrange( 1, 10, 2 )
random.randrange( 0, 51, 5 )
random.randrange( 10 )
random.randrange( -10, 0 )

random.choice( [ 1, 2, 3, 4, 5 ] )
random.choice( [ True, False, 'yes', 'no', 1, 0 ] )
random.choice( "Hello, World!" )
```

## 11.4. Date and Time

## 11.5. Regexp

## 11.6. Testing

## 11.7. Benchmarking

## 11.8. Logging

# 12. Eggs

## 12.1. SQL

## 12.2. Networking

## 12.3. Concurrency
