Quick Reference Guide
=====================

# 4. Basic Types

## 4.1. Numbers

Python supports four different numerical types:

- **int** ( signed integers);
- **long** ( long integers );
- **float** ( floating point real values );
- **complex** ( complex numbers );
- **rational** ( rational numbers, but it's not part of _core_ - it's in Standard Library, in the **fractions** module ).

### 4.1.1. Integers

**Note**: integers can be represented in several base systems: decimal, octal and hexadecimal.

For signed integers:

```python
10
250
-123
060
-045
0x16
-0x1234
```

For signed long integers:

```python
10L
250L
-123L
060L
-045L
0x16L
-0x1234L
```

**Note**: in Python 3 it's not allowed to suffix values with either "L" or "l" and it's not possible to use octal literals.

#### 4.1.1.1 Operators

| Operator | Operation      |
|:--------:|:---------------|
| +        | Addition       |
| -        | Subtraction    |
| *        | Multiplication |
| /        | Division       |
| %        | Modulus        |
| **       | Exponent       |
| //       | Floor Division |

> Python's definition of the modulo ( "%" ) operator differs from that of C and Java. In Python, -7 % 3 is 2. In C and Java, the result is -1 instead. In Python, the sign of the result is always the same as the sign of the second operand, just like it is in Ruby.

| Operator | Operation                |
|:--------:|:-------------------------|
| =        | Assignment               |
| +=       | Increment itself by      |
| -=       | Decrement itself by      |
| *=       | Multiply itself by       |
| /=       | Divide itself by         |
| %=       | Modulus itself with      |
| **=      | Exponent itself by       |
| //       | Floor Division itself by |

| Operator | Operation               |
|:--------:|:------------------------|
| &        | Bitwise AND             |
| |        | Bitwise OR              |
| ^        | Bitwise XOR             |
| ~        | Bitwise Ones Complement |
| <<       | Bitwise Left Shift      |
| >>       | Bitwise Right Shift     |

### 4.1.2. Floats and Rationals

For floating-point numbers:

```python
0.0
2.5
3.14
1.23e4
-9.87e-5
```

For rational numbers:

```python
from fractions import Fraction

Fraction()
>>> Fraction(0, 1)
Fraction( 0 )
>>> Fraction(0, 1)
Fraction( 1 )
>>> Fraction(1, 1)
Fraction( 1.1 )
>>> Fraction(2476979795053773, 2251799813685248)
Fraction( 3, 10 )
>>> Fraction(3, 10)
Fraction( '3/10' )
>>> Fraction(3, 10)
Fraction( 0.75 )
>>> Fraction(3, 4)
Fraction( '-1.75' )
>>> Fraction(-7, 4)
```

#### 4.1.2.1. Operators

| Operator | Operation      |
|:--------:|:---------------|
| +        | Addition       |
| -        | Subtraction    |
| *        | Multiplication |
| /        | Division       |
| %        | Modulus        |
| **       | Exponent       |
| //       | Floor Division |

#### 4.1.2.2. Precision

```python
a = 1   / 10.0
b = 2.0 / 10
c = 3.0 / 10.0
c - b == a
>>> False

a = Fraction( '1/10' )
b = Fraction( '2/10' )
c = Fraction( '3/10' )
c - b == a
>>> True
```

### 4.1.3. Complexs

```python
1+0j
-2.5+3.4j
-5.25-2j
7.75-8j
```

#### 4.1.3.1 Operators

## 4.2. Strings

> Python accepts single ( ' ), double ( " ) and triple ( ''' or """ ) quotes to denote string literals, as long as the same type of quote starts and ends the string.

- String literals are sequences of characters between single or double quotation marks;
- Strings are **immutable**;
- A special kind of string exists that uses the back-tick ( "`" ) as a beginning and ending delimiter. This causes the string to the executed in the underlying operating system as a command.

```python
single_quote = 'Hello, World!'
double_quote = "Hello, World!"

string = 'aeiou'
string[  1 ]    # 'e'
string[ -2 ]    # 'o'
len( string )   # 5
string[ 1 : 4 ] # 'eio'
string[ 2 : ]   # 'iou'
string[ : 5 ]   # 'aeiou'
```

### 4.2.1 Operators

| Operator | Operation        |
|:--------:|:-----------------|
| +        | Concatenation    |
| *        | Copy n times     |
| %        | Interpolation    |
| in       | Includes         |
| not in   | Does not Include |

```python
'%s can be %s' % ( 'strings', 'interpolated' )

'{0} can be {1}'.format( 'strings', 'formatted' )
'{name} hates {weekday}'.format( name = 'Garfield', weekday = 'Monday' )
```

## 4.3. Booleans

```python
True
False
```

> Python assumes any non-zero and non-null values as TRUE, and if it is either zero or null, then it is assumed as FALSE value.

### 4.3.1 Operators

| Operator | Operation            |
|:--------:|:---------------------|
| ==       | Equal                |
| != / <>  | Not Equal            |
| >        | Greater than         |
| <        | Lesser than          |
| >=       | Greater or equal     |
| <=       | Lesser or equal      |

```python
True != False
>>> True
False == False
>>> True
None == None
>>> True
False == None
>>> False
```

**Note**: Don't use the equality "==" symbol to compare objects to **None**. Use ```is``` instead ( or ```is not``` ). **False** and **0** are considered the same.

```python
None == None # BAD
None != None # BAD
None is None
False is None
True is not None

a = None
a == None # BAD
a != None # BAD
a is None

b = True
b == None # BAD
b != None # BAD
b is not None

False == 0
None == 0
None == False
None == ''
None == ""
None == []
None == ()
None == {}
```

| Operator | Operation   |
|:--------:|:------------|
| and      | Logical AND |
| or       | Logical OR  |
| not      | Logical NOT |

It's possible to chain comparison operators:

```python
a = 5

if 0 < a < 10 :
  print 'Hit'
  
if a > 0 and a < 10 :
  print 'Hit'
```

### 4.3.2. Short-Circuiting

## 4.4. Basic Type Conversions

- ```int( value [, base ] )```: converts a value to a signed integer, where base optionally specified the base when the value is a string;
- ```long( value [, base ] )```: converts a value to a signed long integer, where base optionally specified the base when the value is a string;
- ```float( value )```: converts a value to a floating-point number, where base optionally specified the base when the value is a string;
- ```complex( real [, imaginary ] )```: converts a value to a complex number, where imaginary part is optionally;
- ```str( value )```: converts a value its string representation;
- ```chr( value )```: converts an integer to a character;
- ```unichr( value )```: converts an integer to an Unicode character;
- ```ord( value )```: converts a character to its integer value;
- ```hex( value )```: converts an integer to an hexadecimal representation;
- ```oct( value )```: converts an integer to an octal representation.
