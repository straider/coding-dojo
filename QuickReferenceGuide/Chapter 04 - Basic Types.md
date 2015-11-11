Quick Reference Guide
=====================

# 4. Basic Types

> Data types of an entity indicates the meaning, constraints, possible values, operations, functions and mode of storage associated with it.

> Integer, Real, Boolean and Character types are referred as standard data types.

> Data types can be categorized as scalar, pointer and structured data types:
- Examples of scalar data types are Integer, Real, Boolean, Character, Subrange and Enumerated;
- Structured data types are made of the scalar types; for example: arrays, records, files and sets.

## 4.1. Numbers

### 4.1.1. Integers

In Pascal there are several Integer types:

|  Type    |  Minimum    | Maximum    |  Format         |
|:---------|------------:|-----------:|:----------------|
| Integer  | -2147483648 | 2147483647 | signed 32-bit   |
| Shortint |        -128 |        127 | signed 8-bit    |
| Smallint |      -32768 |      32767 | signed 16-bit   |
| Longint  | -2147483648 | 2147483647 | signed 32-bit   |
| Int64    |       -2^63 |   2^63 - 1 | signed 64-bit   |
| Cardinal |           0 | 4294967295 | unsigned 32-bit |
| Byte     |           0 |        255 | unsigned 8-bit  |
| Word     |           0 |      65535 | unsigned 16-bit |
| Longword |           0 | 4294967295 | unsigned 32-bit |

#### 4.1.1.1 Operators

| Operator | Operation      |
|:--------:|:---------------|
| +        | Addition       |
| -        | Subtraction    |
| *        | Multiplication |
| div      | Division       |
| mod      | Modulus        |

**Note**: there's no exponent operator.

| Operator | Operation               |
|:--------:|:------------------------|
| &        | Bitwise AND             |
| | or !   | Bitwise OR              |
| ~        | Bitwise Ones Complement |
| <<       | Bitwise Left Shift      |
| >>       | Bitwise Right Shift     |

### 4.1.2. Floats and Rationals

#### 4.1.2.1. Operators

#### 4.1.2.2. Precision

### 4.1.3. Complexs

#### 4.1.3.1 Operators

## 4.2. Strings

### 4.2.1 Operators

## 4.3. Booleans

### 4.3.1. Operators

| Operator | Operation            |
|:--------:|:---------------------|
| ==       | Equal                |
| !=       | Not Equal            |
| >        | Greater than         |
| <        | Lesser than          |
| >=       | Greater or equal     |
| <=       | Lesser or equal      |

| Operator | Operation                    |
|:--------:|:-----------------------------|
| and      | Logical AND                  |
| and then | Logical AND, short-circuited |
| or       | Logical OR                   |
| or else  | Logical OR, short-circuited  |
| not      | Logical NOT                  |

### 4.3.2. Short-Circuiting

> Pascal supports short-circuiting:

- **or else**: if the left operand is true, it knows that the result will be true in any case, so it won’t evaluate the right operand. The right operand will be evaluated only if the left operand is false;
- **and then**: if the left operand is false, it knows that the result will be false in any case, so it won’t evaluate the right operand. The right operand will be evaluated only if the left operand is true.

## 4.4. Basic Type Conversions
