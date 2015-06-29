Quick Reference Guide
=====================

# 4. Basic Types

## 4.1. Numeric

In Ruby everything is an object and there are no primitive types. This means that there are no int, short, long, float or double.

### 4.1.1. Integers, Fixnums, Bignums

> Ruby will handle Bignums and Fixnums for you, and you can perform arithmetic and other operations without any problems. Results might vary depending on your system's architecture, but as these changes are handled entirely by Ruby, there's no need to worry.

```ruby
1
2 - 3
1000 * 500
100000 * 50000
```

**Attention**: when dividing an integer with 0 then the exception **ZeroDivisionError** will occur.

```ruby
4 / 0
0 / 0
```

#### 4.1.1.1 Operators

| Operator | Operation      |
|:--------:|:---------------|
| +        | Addition       |
| -        | Subtraction    |
| *        | Multiplication |
| /        | Division       |
| %        | Modulus        |
| **       | Exponent       |

> Ruby's definition of the modulo ( "%" ) operator differs from that of C and Java. In Ruby, -7 % 3 is 2. In C and Java, the result is -1 instead. In Ruby, the sign of the result is always the same as the sign of the second operand, just like it is in Python.

| Operator | Operation            |
|:--------:|:---------------------|
| =        | Assignment           |
| +=       | Increment itself by  |
| -=       | Decrement itself by  |
| *=       | Multiply itself by   |
| /=       | Divide itself by     |
| %=       | Modulus itself with  |
| **=      | Exponent itself by   |

> The increment and decrement operators ( ++ and -- ) are not available, neither in "pre" nor "post" forms.

| Operator | Operation               |
|:--------:|:------------------------|
| &        | Bitwise AND             |
| |        | Bitwise OR              |
| ^        | Bitwise XOR             |
| ~        | Bitwise Ones Complement |
| <<       | Bitwise Left Shift      |
| >>       | Bitwise Right Shift     |

### 4.1.2. Floats and Rationals

Ruby follows the [IEEE 754-2008 standard](http://en.wikipedia.org/wiki/IEEE_floating_point) and as such there are special numbers, required to deal with special values:
- Infinity: occurs when dividing a float with 0. It's not an error, it's allowed and the value returned represent a positive or negative infinite number;
- Not a Number ( NaN ): occurs when dividing 0 with 0.

```ruby
123.45
1.23e4

0.1r
1/10.to_r
0.1.to_r
```

> **Rational** numbers are any numbers that can be represented as a ratio or fraction of integers.

**Note*: the short notation for rationals does not work in JRuby. One has to use the Rational( 1, 10 ) or transform a float into a rational with method ```to_r()```.

#### 4.1.2.1. Operators

| Operator | Operation      |
|:--------:|:---------------|
| +        | Addition       |
| -        | Subtraction    |
| *        | Multiplication |
| /        | Division       |
| %        | Modulus        |
| **       | Exponent       |

There are useful methods to deal with division:
- ```div()```: performs an integer division, result will be an integer;
- ```fdiv()```: performs the usual floating-point division;
- ```quo()```: performs a division that returns a rational, when possible.
- ```divmod()```: returns an array with the integer quotient and the floating-point remainder.

| Operator | Operation            |
|:--------:|:---------------------|
| =        | Assignment           |
| +=       | Increment itself by  |
| -=       | Decrement itself by  |
| *=       | Multiply itself by   |
| /=       | Divide itself by     |
| %=       | Modulus itself with  |
| **=      | Exponent itself by   |

#### 4.1.2.2. Precision

```ruby
irb(main):001:0> a = 1   / 10.0
=> 0.1
irb(main):002:0> b = 2.0 / 10
=> 0.2
irb(main):003:0> c = 3.0 / 10.0
=> 0.3
irb(main):004:0> c - b == a
=> false
```

```ruby
irb(main):001:0> Rational( 3, 10 )
=> (3/10)
irb(main):002:0> rational = Rational( 3, 10 ) - Rational( 2, 10 )
=> (1/10)
irb(main):003:0> Rational( 1, 10 ).class
=> Rational
irb(main):004:0> Rational( 3, 10 ) - Rational( 2, 10 ) == Rational( 1, 10 )
=> true
```

### 4.1.3. Complexs

> Complex or Imaginary numbers are used to solve equations that involve more than one solution (such as the quadratic equation).

> A complex number can be represented as a paired real number with imaginary unit; a+bi. Where a is real part, b is imaginary part and i is imaginary unit. Real a equals complex a+0i mathematically.

```ruby
Complex( 1 )
Complex( 2, 3 )
3.to_c
0.3.to_c
Complex( '1-2i' )
Complex( '3.0+4.5i' )
Complex( '1/2+3/4i' )
```

#### 4.1.3.1 Operators

## 4.2. Strings and Symbols

- String literals are sequences of characters between single or double quotation marks;
- Strings are **mutable**. They can expand as needed, without using much time and memory;
- DocHere strings can be defined between ```[<<END_OF_DOCHERE]...[DOCHERE]```
- A special kind of string exists that uses the back-tick ( "`" ) as a beginning and ending delimiter. This causes the string to the executed in the underlying operating system as a command.

> Comparing two strings for equality can be done by ```==``` or ```.eql?``` ( for identical content ) and ```.equal?``` ( for identical objects ).

```ruby
string = 'hello, world!'
string.length
string.size
```

**Note**: method ```size()``` is actually an _alias_ for method ```length```.

```ruby
string = 'hello, world!'
string.count 'o'
```

```ruby
string = 'hello, world!'
string.upcase!
string.swapcase!
string.capitalize!
string.downcase!
```

```ruby
string = 'hello, world!'
string.slice( 5 )
string.slice( 0, 5 )
string.slice( -6, 5 )
string.slice( 0 )
```

```ruby
"  hello\n\tworld!  ".lstrp
"  hello\n\tworld!  "rstrip
"  hello\n\tworld!  "strip
```

```ruby
string = 'ALIGNME'
string.ljust( string.size + 2 )
string.rjust( string.size + 2 )
string.center( string.size + 4 )
```

```ruby
string = 'hello, world!'
string.reverse
string.reverse!
string.reverse!
```

```ruby
i = '1'
i.to_i

f = '1.25'
f.to_f

e = '2.75e-3'
e.to_f
```

### 4.2.1 Operators

| Operator | Operation      |
|:--------:|:---------------|
| %        | Formatting     |
| #{ ... } | Interpolation  |
| +        | Concatenation  |
| *        | Copy n times   |
| <<       | Append         |
| %q       | Single Quote   |
| %Q       | Double Quote   |
| %x       | Back-Tick      |

**Attention**: Interpolation only works with Double Quote Strings.

```ruby
string_as_is = %q{ this is a string as typed, without single or double quotes }
=> " this is a string as typed, without single or double quotes "
```

**Note**: there are extra whitespaces before and after the string, since the %q operator uses every character inside curly brackets.

It's possible to use Here Document notation.

> A "HereDoc" refers to building strings from multiple lines. A special identifier is specified after "<<" to indicate where will the string end. Everything after this special identifier declaration up to the point where it occurs again ( at the start of a new line ) will become the value for the string.

```ruby
string = <<END_OF_DOCHERE
    multiple
    lines of whatever
    and more
    become a single
    string value
END_OF_DOCHERE

string = <<"END_OF_DOCHERE"
    multiple
    lines of whatever
    and more
    become a single
    string value
END_OF_DOCHERE

array = <<"STACKED_1", <<"STACKED_2"
    multiple
    lines of whatever
STACKED_1
    and more
    become a single
    string value
STACKED_2
```

**Note**: the whitespaces are not discarded in HereDoc notation.

### 4.2.2. Symbols

- A symbol looks like a variable name but it's prefixed with a colon;
- Symbols are useful because a given symbol name refers to the same object throughout a Ruby program;
- Symbols are particularly useful when creating hashes, to have a distinction between keys and values.

> Symbols are more efficient than strings. Two strings with the same contents are two different objects, but for any given name there is only one Symbol object. This can save both time and memory.

Therefore, when do we use a string versus a symbol?
- If the contents ( the sequence of characters ) of the object are important, use a string;
- If the identity of the object is important, use a symbol.

```ruby
'string'.to_sym
:symbol.to_s
```

## 4.3. Booleans

- **nil** and **false** evaluate to _false_, everything else ( including **true** and **0** ) means _true_;
- **nil** and **false** are different from one another;

```ruby
puts nil.class       # NilClass  
puts nil.object_id   # 4  
  
puts false.class     # FalseClass  
puts false.object_id # 0  
```

### 4.3.1 Operators

| Operator | Operation            |
|:--------:|:---------------------|
| ==       | Equal                |
| !=       | Not Equal            |
| >        | Greater than         |
| <        | Lesser than          |
| >=       | Greater or equal     |
| <=       | Lesser or equal      |
| <=>      | Combined Comparison  |
| ===      | Equality in **case** |
| .eql?    | Objects are equal    |
| equal?   | Objects with same ID |

> "===" is called a combined comparison operator. Returns 0 if first operand equals second, 1 if first operand is greater than the second and -1 if first operand is less than the second.

| Operator | Operation   |
|:--------:|:------------|
| and      | Logical AND |
| or       | Logical OR  |
| not      | Logical NOT |

Each of these operators also have another notation: and = &&; or = || and not = !.

### 4.3.2. Short-Circuiting

## 4.4. Basic Type Conversions
