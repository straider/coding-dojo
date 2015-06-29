Quick Reference Guide
=====================

# 4. Basic Types

## 4.1. Numeric

> We can force a number ( including binary, octals and hexadecimals ) to have a specific type by giving a suffix, either in uppercase or lowercase. The suffixes are:

- BigInteger: G or g
- Long: L or l
- Integer: I or i
- BigDecimal: G or g
- Double: D or d
- Float: F or f

### 4.1.1. Integers

> The integral literal types are the same as in Java: byte, char, short, int, long and java.lang.BigInteger:

```java
// primitive types
byte  b = 1
char  c = 2
short s = 3
int   i = 4
long  l = 5

// infinite precision
BigInteger bi =  6
```

> In Java 6 and before, as well as in Groovy, numbers could be represented in decimal, octal and hexadecimal bases, and with Java 7 and Groovy 2, you can use a binary notation with the 0b prefix:

```java
int   xInt   = 0b10101111
short xShort = 0b11001001
byte  xByte  = 0b11
long  xLong  = 0b101101101101

BigInteger xBigInteger = 0b111100100001

int   xInt   = 077
short xShort = 011
byte  xByte  = 032
long  xLong  = 0246

BigInteger xBigInteger = 01111

int   xInt   = 0x77
short xShort = 0xaa
byte  xByte  = 0x3a
long  xLong  = 0xffff

BigInteger xBigInteger = 0xaaaa
```

> It's possible to use underscores in number literals, to help figure out how some numbers are grouped together:

```java
long creditCardNumber      = 1234_5678_9012_3456L
long socialSecurityNumbers = 999_99_9999L

long bytes    = 0b11010010_01101001_10010100_10010010
long hexBytes = 0xFF_EC_DE_5E
long hexWords = 0xFFEC_DE5E

long maxLong     = 0x7fff_ffff_ffff_ffffL
long alsoMaxLong = 9_223_372_036_854_775_807L

double monetaryAmount = 12_345_132.12
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

| Operator | Operation             |
|:--------:|:----------------------|
| =        | Assignment            |
| ++       | Increment itself by 1 |
| --       | Decrement itself by 1 |
| +=       | Increment itself by n |
| -=       | Decrement itself by n |
| *=       | Multiply itself by n  |
| /=       | Divide itself by n    |
| %=       | Modulus itself with   |
| **=      | Exponent itself by n  |

| Operator | Operation               |
|:--------:|:------------------------|
| &        | Bitwise AND             |
| |        | Bitwise OR              |
| ^        | Bitwise XOR             |
| ~        | Bitwise Ones Complement |
| <<       | Bitwise Left Shift      |
| >>       | Bitwise Right Shift     |

> The bitwise collection of operators also includes compound operators, such as &=, |=, <<= and >>=.

### 4.1.2. Floats and Rationals

> The decimal literal types are the same as in Java: float, double and java.lang.BigDecimal:

```java
// primitive types
float  f = 1.234
double d = 2.345

def atomicMass = 1.67e-27

// infinite precision
BigDecimal bd =  3.456
```

> Conveniently for exact decimal number calculations, Groovy choses java.lang.BigDecimal as its decimal number type. In addition, both float and double are supported, but require an explicit type declaration, type coercion or suffix. Even if BigDecimal is the default for decimal numbers, such literals are accepted in methods or closures taking float or double as parameter types.

#### 4.1.2.1. Operators

| Operator | Operation      |
|:--------:|:---------------|
| +        | Addition       |
| -        | Subtraction    |
| *        | Multiplication |
| /        | Division       |
| %        | Modulus        |
| **       | Exponent       |

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

### 4.1.3. Complexs

#### 4.1.3.1 Operators

## 4.2. Strings

> Text literals are represented in the form of chain of characters called strings. Groovy lets you instantiate **java.lang.String** objects, as well as **groovy.lang.GString** objects, which are also called interpolated strings in other programming languages.

String literals can be declared between:

- **Single quotes**: Single quoted strings are plain java.lang.String and don't support interpolation;
- **Double quotes**: Double quoted strings are plain java.lang.String if there's no interpolated expression, but are groovy.lang.GString instances if interpolation is present;
- **Triple single quotes**: Triple single quoted strings are plain java.lang.String and don't support interpolation. Triple single quoted strings are multiline;
- **Triple double quotes**: Triple double quoted strings behave like double quoted strings, with the addition that they are multiline;
- **Slashes**: Slashy strings are particularly useful for defining regular expressions and patterns, as there is no need to escape backslashes. Slashy strings are multiline and can also be interpolated;
- **Dollar slashes**: Dollar slashy strings are multiline GStrings delimited with an opening $/ and and a closing /$. The escaping character is the dollar sign, and it can escape another dollar, or a forward slash.

```java
'a single quoted string'
"a double quoted string"
'''a triple single quoted string'''
"""a triple double quoted string"""
/.*foo.*/
$/.*foo.*/$
```

> There's a difference between plain character strings and Groovy's GStrings ( interpolated strings ), as in that the latter case, the interpolated values are inserted in the final string for evaluating the whole identifier.

> If your code is indented, for example in the body of the method of a class, your string will contain the whitespace of the indentation. The Groovy Development Kit contains methods for stripping out the indentation with the ```String.stripIndent()``` method and with the ```String.stripMargin()``` method that takes a delimiter character to identify the text to remove from the beginning of a string.

> For characters that are not present on the keyboard, on can use unicode escape sequences: a backslash, followed by 'u', then 4 hexadecimal digits.

```java
'The Euro currency symbol: \u20AC'
```

### 4.2.1 Operators

| Operator | Operation        |
|:--------:|:-----------------|
| +, <<    | Concatenate      |
| -        | Removal          |
| *        | Repeat           |
| +=, <<=  | Append           |
| -=       | Removal in-place |
| *        | Repeat in-place  |

### 4.2.2. Interpolation

> Any Groovy expression can be interpolated in all string literals, apart from single and triple single quoted strings. Interpolation is the act of replacing a placeholder in the string with its value upon evaluation of the string. The placeholder expressions are surrounded by "${}" or prefixed with "$" for dotted expressions.

> Although interpolated strings can be used in lieu of plain Java strings, they differ with strings in a particular way: their hash-codes are different. Plain Java strings are immutable, whereas the resulting String representation of a GString can vary, depending on its interpolated values. Even for the same resulting string, GStrings and Strings don't have the same hash-code.

**Attention**: using GString as Map keys should be avoided, especially if we try to retrieve an associated value with a String instead of a GString.

### 4.2.3. Characters

> Unlike Java, Groovy doesn't have an explicit character literal. However, you can be explicit about making a Groovy string an actual character, by three different means:

```java
char c1 = 'A'
def c2 = 'B' as char
def c3 = ( char ) 'C'
```

## 4.3. Booleans

> **true** and **false** are the only two primitive boolean values. False is false but so is 0, an empty string and null.

### 4.3.1. Operators

| Operator | Operation            |
|:--------:|:---------------------|
| ==       | Equal                |
| !=       | Not Equal            |
| >        | Greater than         |
| <        | Lesser than          |
| >=       | Greater or equal     |
| <=       | Lesser or equal      |

> For those coming from a Java background, "==" is used to determine if the two variables reference the same instance and the ```equals()``` method is used to determine if two variables are equivalent. Groovy conflates "==" and ```equals()``` to perform the same comparison.

| Operator | Operation   |
|:--------:|:------------|
| &&       | Logical AND |
| ||       | Logical OR  |
| !        | Logical NOT |

### 4.3.2. Short-Circuiting

> The logical "||" and "&&" operators supports short-circuiting:

- **||**: if the left operand is true, it knows that the result will be true in any case, so it won’t evaluate the right operand. The right operand will be evaluated only if the left operand is false;
- **&&**: if the left operand is false, it knows that the result will be false in any case, so it won’t evaluate the right operand. The right operand will be evaluated only if the left operand is true.
