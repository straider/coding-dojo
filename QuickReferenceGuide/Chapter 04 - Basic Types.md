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

### 4.1.1. Integer

**Note**: integers can be represented in several base systems: decimal, octal and hexadecimal.

For signed integers:

```python
>>> 10
10
>>> 250
250
>>> -123
-123
>>> 060
48
>>> -045
-37
>>> 0x16
22
>>> -0x1234
-4660
```

For signed long integers:

```python
>>> 10L
10L
>>> 250L
250L
>>> -123L
-123L
>>> 060L
48L
>>> -045L
-37L
>>> 0x16L
22L
>>> -0x1234L
-4660L
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
>>> 0.0
0.0
>>> 2.50
2.5
>>> 3.14
3.14
>>> 1.23e4
12300.0
>>> -9.87e-5
-9.87e-05
```

For rational numbers:

```python
from fractions import Fraction

>>> Fraction()
Fraction(0, 1)
>>> Fraction( 0 )
Fraction(0, 1)
>>> Fraction( 1 )
Fraction(1, 1)
>>> Fraction( 1.1 )
Fraction(2476979795053773, 2251799813685248)
>>> Fraction( 3, 10 )
Fraction(3, 10)
>>> Fraction( '3/10' )
Fraction(3, 10)
>>> Fraction( 0.75 )
Fraction(3, 4)
>>> Fraction( '-1.75' )
Fraction(-7, 4)
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
>>> a = 1   / 10.0
>>> b = 2.0 / 10
>>> c = 3.0 / 10.0
>>> c - b == a
False

>>> a = Fraction( '1/10' )
>>> b = Fraction( '2/10' )
>>> c = Fraction( '3/10' )
>>> c - b == a
True
```

### 4.1.3. Complex

```python
>>> 1+0j
(1+0j)
>>> -2.5+3.4j
(-2.5+3.4j)
>>> -5.25-2j
(-5.25-2j)
>>> 7.75-8j
(7.75-8j)
```

#### 4.1.3.1 Operators

## 4.2. Strings

> Python accepts single ( ' ), double ( " ) and triple ( ''' or """ ) quotes to denote string literals, as long as the same type of quote starts and ends the string.

- String literals are sequences of characters between single or double quotation marks;
- Strings are **mutable**. They can expand as needed, without using much time and memory;
- DocHere strings can be defined between ```[<<END_OF_DOCHERE]...[DOCHERE]```
- A special kind of string exists that uses the back-tick ( "`" ) as a beginning and ending delimiter. This causes the string to the executed in the underlying operating system as a command.

### 4.2.1 Operators

| Operator | Operation      |
|:--------:|:---------------|
| +        | Concatenation  |
| *        | Copy n times   |

## 4.3. Booleans

```python
>>> True
True
>>> False
False
```

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
>>> True
True
>>> False
False

>>> True != False
True
>>> False == False
True
>>> None == None
True
>>> False == None
False
```

| Operator | Operation   |
|:--------:|:------------|
| and      | Logical AND |
| or       | Logical OR  |
| not      | Logical NOT |

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
