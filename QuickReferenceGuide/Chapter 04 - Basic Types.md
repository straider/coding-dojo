Quick Reference Guide
=====================

# 4. Basic Types

## 4.1. Numbers

### 4.1.1. Integers

- Go’s integer types are: uint8, uint16, uint32, uint64, int8, int16, int32 and int64;
- 8, 16, 32 and 64 tells how many bits each of the types use;
- uint means _unsigned integer_ while int means _signed integer_. Unsigned integers only contain positive numbers ( or zero );
- In addition there two alias types: byte which is the same as uint8 and rune which is the same as int32;
- There are also 3 machine dependent integer types: uint, int and uintpt.

The Go Standard Library offers two more types: big.Ints and big.Rats.

There are literal prefixes:

- without any prefix it means the number is in decimal notation;
- prefix **0** means it is in octal notation;
- prefix **0x** means it is in hexadecimal notation.

There are also literal suffixes:

- **u** means it is an unsigned integer;
- **l** means it is a long integer;
- **ul** means it is an unsigned long integer.

#### 4.1.1.1 Operators

| Operator | Description    |
|----------|----------------|
| +        | Addition       |
| -        | Subtraction    |
| *        | Multiplication |
| /        | Division       |
| %        | Modulus        |

Go's definition of the modulus ( "%" ) operator matches the definitions in other languages such as C or Java: the sign of the result is always the same as the sign of the first operand.

| Operator | Operation               |
|:--------:|:------------------------|
| &        | Bitwise AND             |
| |        | Bitwise OR              |
| ^        | Bitwise XOR             |
| <<       | Bitwise Left Shift      |
| >>       | Bitwise Right Shift     |

| Operator | Operation                      |
|:--------:|:-------------------------------|
| =        | Assignment                     |
| +=       | Increment itself by            |
| -=       | Decrement itself by            |
| *=       | Multiply itself by             |
| /=       | Divide itself by               |
| %=       | Modulus itself with            |
| ++       | Increments itself by 1         |
| --       | Decrements itself by 1         |
| &=       | Bitwise AND Assignment         |
| |=       | Bitwise OR  Assignment         |
| ^=       | Bitwise XOR Assignment         |
| <<=      | Bitwise Left Shift Assignment  |
| >>=      | Bitwise Right Shift Assignment |

### 4.1.2. Floats and Rationals

- Go has two floating point types: float32 and float64 ( also often referred to as single precision and double precision, respectively );
- Like integers, floating point numbers have a certain size ( 32 bit or 64 bit ). Using a larger sized floating point number increases it's precision ( how many digits it can represent );
- There are no constants denoting the IEEE-754 infinity and not-a-number values, but the **math** package's Inf, NaN, IsInf, and IsNaN functions return and test for those values at run time;
- There are two additional types for representing complex numbers ( numbers with
imaginary parts ): complex64 and complex128.

#### 4.1.2.1. Operators

| Operator | Operation      |
|:--------:|:---------------|
| +        | Addition       |
| -        | Subtraction    |
| *        | Multiplication |
| /        | Division       |

| Operator | Operation              |
|:--------:|:-----------------------|
| =        | Assignment             |
| +=       | Increment itself by    |
| -=       | Decrement itself by    |
| *=       | Multiply itself by     |
| /=       | Divide itself by       |
| ++       | Increments itself by 1 |
| --       | Decrements itself by 1 |

#### 4.1.2.2. Precision

**Attention**: Floating point precision is finite and you should always be very cautious when making comparisons on real numbers.

### 4.1.3. Complexs

> Complex numbers can be created using the built-in ```complex()``` function or by using constant literals involving imaginary numbers. Complex numbers' components
can be retrieved using the built-in ```real()``` and ```imag()``` functions, both of which return a float64 ( or a float32 for complex64s ).

```c
x := -7.3 - 8.9i
y := complex64( -18.3 + 8.9i )
z := complex( 3.2e5, 13.2 )
```

#### 4.1.3.1 Operators

| Operator | Operation      |
|:--------:|:---------------|
| +        | Addition       |
| -        | Subtraction    |
| *        | Multiplication |
| /        | Division       |

> The only comparison operators that can be used with complex numbers
are == and !=.

## 4.2. Strings

- Interpreted string literals are UTF-8 characters between double quotes ```""``` and may contain non-ASCII characters;
- Once a variable of type string is assigned then it cannot be changed: strings in Go are **immutable**.

### 4.2.1 Operators

## 4.3. Booleans

### 4.3.1 Operators

| Operator | Operation            |
|:--------:|:---------------------|
| ==       | Equal                |
| !=       | Not Equal            |
| >        | Greater than         |
| <        | Lesser than          |
| >=       | Greater or equal     |
| <=       | Lesser or equal      |

| Operator | Operation   |
|:--------:|:------------|
| &&       | Logical AND |
| ||       | Logical OR  |
| !        | Logical NOT |

### 4.3.2. Short-Circuiting
