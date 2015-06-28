Quick Reference Guide
=====================

# 10. Concurrency

Without any gems, the concurrency model in Python is very simple.

> The implementation CPython uses a [**GIL**](http://en.wikipedia.org/wiki/Global_Interpreter_Lock) - _Global Interpreter Lock_ - mechanism, which made this implementation unsuitable for concurrent applications. An option is to use jython or IronPython.

# 11. Core Packages / Standard Library

## 11.1 BigDecimal

## 11.2. File Handling / Input-Output

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
