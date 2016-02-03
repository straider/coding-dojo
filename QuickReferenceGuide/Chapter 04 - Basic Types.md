Quick Reference Guide
=====================

# 4. Basic Types

## 4.1. Numeric

> Numeric literals are simply constant numbers. Numeric literals are much easier to comprehend and use than string literals. There are only a few basic ways to express numeric literals:

| Type                | Value    |
|---------------------|----------|
| Integer             | 1234     |
| Negative Integer    | -100     |
| Hexadecimal         | 0xffff   |
| Octal               | 0577     |
| Floating Point      | 20.55    |
| Scientific Notation | 16.12E14 |

**Note**: it's also allowed to express a large number as ```1_234_567```.

### 4.1.1. Integers

```perl
my $integer     = 100;
my $octal       = 020;
my $hexadecimal = 0xFF;

print "$integer\n";
print "$octal\n";
print "$hexadecimal\n";

print 1_234_567, "\n";
```

#### 4.1.1.1. Operations

| Operator | Operation      |
|:--------:|:---------------|
| +        | Addition       |
| -        | Subtraction    |
| *        | Multiplication |
| /        | Division       |
| %        | Modulus        |
| **       | Exponent       |

#### 4.1.1.2. Operations and Assigment

| Operator | Operation            |
|:--------:|:---------------------|
| =        | Assignment           |
| ++       | Increment by one     |
| --       | Decrement by one     |
| +=       | Increment itself by  |
| -=       | Decrement itself by  |
| *=       | Multiply itself by   |
| /=       | Divide itself by     |
| %=       | Modulus itself with  |
| **=      | Exponent itself by   |

#### 4.1.1.3. Bitwise Logic

| Operator | Operation               |
|:--------:|:------------------------|
| &        | Bitwise AND             |
| |        | Bitwise OR              |
| ^        | Bitwise XOR             |
| ~        | Bitwise Ones Complement |
| <<       | Bitwise Left Shift      |
| >>       | Bitwise Right Shift     |

### 4.1.2. Floats and Rationals

#### 4.1.2.1. Operations

| Operator | Operation      |
|:--------:|:---------------|
| +        | Addition       |
| -        | Subtraction    |
| *        | Multiplication |
| /        | Division       |
| %        | Modulus        |
| **       | Exponent       |

#### 4.1.2.2. Operations and Assigment

| Operator | Operation            |
|:--------:|:---------------------|
| =        | Assignment           |
| +=       | Increment itself by  |
| -=       | Decrement itself by  |
| *=       | Multiply itself by   |
| /=       | Divide itself by     |
| %=       | Modulus itself with  |
| **=      | Exponent itself by   |

#### 4.1.2.3. Precision

### 4.1.3. Complexs

N/A.

## 4.2. Strings

> One can use double quotes or single quotes around literal strings. There is an important difference in single and double quotes. Only double quotes interpolate variables and special characters such as newlines \n, where as single quote does not interpolate any variable or special character.

```perl
print "Hello, World!\n"
print 'Hello, World!\n'
```

It's also possible to use HereDoc notation. The identifier can be quoted either by using double quotes or single quotes. The difference is that with single quotes nothing is interpolated and the content is used as-is.

```perl
print <<END_OF_HEREDOC
Multiple lines string.
Using no quotes is the same as using double quotes: $HOME.
END_OF_HEREDOC
;

print <<"END_OF_HEREDOC_DOUBLE_QUOTED"
Multiple lines string.
Using double quotes allows interpolation: $HOME.
END_OF_HEREDOC_DOUBLE_QUOTED
;

print <<'END_OF_HEREDOC_SINGLE_QUOTED'
Multiple lines string.
Using single quotes does not allow interpolation: $HOME.
END_OF_HEREDOC_SINGLE_QUOTED
;
```

**Note**: the closing identifier must always start at column 1.

It's also possible to work with multiple line strings, when using single quotes:

```perl
my $content = '
A multiple line string,
with content defined between single quotes.
';
```

A special kind of string is called **v-string**, and is any literal started with lowercase v and followed by one or more dot-seperated numeric elements:

```perl
my $version=v1.02.30.45;
my $ip=v192.168.0.1;

print "$version\n";
print "$ip\n";
```

### 4.2.1. Operators

| Operator | Operation |
|:--------:|:----------|
| q{}      | Encloses a string between single quotes. |
| qq{}     | Encloses a string between double quotes. |
| qx{}     | Encloses a string between backticks. |
| .        | Concatenation |
| x        | Copy n times. |
| ++       | It takes the last character and increments it by one according to the ASCII table restricted to letters. |

```perl
my $verbatim  = q{ This is a verbatim string, without interpolation };
my $quoted    = qq{ This is a quoted string, with interpolation: $verbatim };
my $timestamp = qx{ date };

print $verbatim . "\n";
print $quoted . "\n";
print $timestamp . "\n";

print '-' x 10 . "\n";

my $vowel = "a";
$vowel++;
print $vowel . "\n";
```

### 4.2.2. Functions

| Function | Operation |
|:--------:|:----------|
| length   | Returns the number of characters in the given string. |
| lc       | Converts all characters to lowercase. |
| lcfirst  | Converts the first character to lowercase. |
| uc       | Converts all characters to uppercase. |
| ucfirst  | Converts the first character to uppercase. |
| index    | Returns the location of the second string within the first string. |
| rindex   | Returns the location of the second string within the first string, searching from the right hand side. |
| substr   | Returns the substring at a given locations. |
| chomp    | Chops last character only if it is really a newline. |
| chop     | Chops off the last character, no matter what it is, from the string. |
| chr      | Returns the ASCII character belonging to a numeric value. |
| ord      | Returns the numeric value of the first character in a string. |
| sprintf  | Provides formatting capabilities for numbers and strings. |

```perl
print "\$verbatim has ", length( $verbatim ), " characters.\n";
print "Lowercase: ", lc( $verbatim ), "\n";
print "Uppercase: ", uc( $verbatim ), "\n";

print "\$verbatim containts 'verbatim' string at position ", index( $verbatim, 'verbatim' ), "\n";
print "\$verbatim containts 'verbatim' string at position ", rindex( $verbatim, 'verbatim' ), "\n";

print substr( $verbatim, 11, 15 ) . "\n";
my $original = substr( $verbatim, 11, 15, 'altered phrase' );
print $original . "\n";
print $verbatim . "\n";

my $word = 'Word';
print lcfirst( $word) , "\n";
print ucfirst( $word) , "\n";

chomp( $word );
print $word, "\n";
chop( $word );
print $word, "\n";

print ord( $word ), "\n";
print chr( 90 ), "\n";

my $x = 2;
my $y = 3;
print sprintf( '%02d\n', $x + $y );

my $i = 2.25;
my $j = 3.47;
print sprintf( "%02.2f\n", $i + $j );
```

## 4.3. Booleans

> Perl does not have a special boolean type and yet, in the documentation of Perl one can often see that a function returns a _Boolean_ value. Sometimes the documentation says the function returns true or returns false. Perl does not have specific boolean type, but every scalar value - if checked using if - will be either true or false.

> The following scalar values are considered false:
- undef: the undefined value;
- 0: the number 0, even if written as 000 or 0.0;
- '': the empty string;
- '0': the string that contains a single 0 digit.

> The Perl documentation repeatedly claims that functions return "true" or "false" values in certain situations. In practice, when a function is claimed to return "true" it usually returns 1, and when it is claimed to return false it usually returns the empty string, "".

### 4.3.1. Operators

#### 4.3.1.1. Numerical

| Operator | Operation        |
|:--------:|:-----------------|
| ==       | Equal            |
| !=       | Not Equal        |
| >        | Greater than     |
| <        | Lesser than      |
| >=       | Greater or equal |
| <=       | Lesser or equal  |
| <=>      | Checks if the value of two operands are equal or not, and returns -1, 0, or 1 depending on whether the left argument is numerically less than, equal to, or greater than the right argument. |

#### 4.4.1.2. String

| Operator | Operation        |
|:--------:|:-----------------|
| eq       | Equal            |
| ne       | Not Equal        |
| gt       | Greater than     |
| lt       | Lesser than      |
| ge       | Greater or equal |
| le       | Lesser or equal  |
| cmp      | Checks if the value of two operands are equal or not, and returns -1, 0, or 1 depending on whether the left argument is stringwise less than, equal to, or greater than the right argument. |

#### 4.3.1.3. Bitwise Logic

| Operator | Operation |
|:--------:|:----------|
| &        | Binary AND Operator copies a bit to the result if it exists in both operands. |
| |        | Binary OR Operator copies a bit if it exists in either operand. |
| ^        | Binary XOR Operator copies the bit if it is set in one operand but not both. |
| ~        | Binary Ones Complement Operator is unary and has the efect of 'flipping' bits. |
| >>       | Binary Right Shift Operator. The left operands value is moved right by the number of bits specified by the right operand. |
| <<       | Binary Left Shift Operator. The left operands value is moved left by the number of bits specified by the right operand. |

#### 4.3.1.4. Logical

| Operator | Operation   |
|:--------:|:------------|
| and      | Logical AND |
| or       | Logical OR  |
| not      | Logical NOT |

### 4.3.2. Short-Circuiting

## 4.4. Basic Type Conversions

> Perl treats numbers and strings on an equal footing, and where necessary, it converts between strings, integers, and floating-point numbers behind the scenes. This means that one doesn't have to worry about making the conversions, like in other languages. There is, however, one area where this doesn't take place: octal, hexadecimal, and binary numbers in string literals or strings stored in variables don't get converted automatically.

```perl
my $number = 1;
my $PI     = "3.14";
print $number * $PI ** 2, "\n";

my $value = "2.5";
print $value * 3, "\n";

print "0xFF", "\n";
print hex( "0xFF" ), "\n";
print "022", "\n";
print oct( "022" ), "\n";
```
