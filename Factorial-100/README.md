coding-dojo / Factorial-100
===========================

# 1. Introduction

Personal Coding Dojo, for simple benchmarking of several technologies.

## 1.2. Goal and Objectives

- To test execution times of nested loops;
- Using intensive multiplication operation;
- Evaluate technology precision between 32-bit and 64-bit long integer data types;
- Evaluate technology support for BigInteger and its speed cost.

## 1.3. Constraints

- Use primitive signed integers, as much as possible;
- Compilers and code should have no optimization features turned on;
- Must follow procedural paradigm, without using - as much as possible - classes or functional logic or specific language constructs.

# 2. Technologies

The main problem here is how the technology deals with big integer: by using a standard library not in core or by handling it automatically?

**Note**: compiled technologies may suffer more from the host operating system mode than on the compiler itself. But it may require several versions of the compiler, 32-bit and 64-bit, in a 64-bit operating system.

## 2.1. Compiled

### 2.1.1. Pascal

The **int64** primitive data type it's not enough for Pascal to complete this challenge.

### 2.1.2. C

The **long long** primitive data type it's not enough for C to complete this challenge.

### 2.1.3. C#

It's necessary to use class **BigInteger** to solve this challenge, which only exists for .NET 4.0 onward.

Use the following command to compile the solution in C# using Mono:

```bash
dmcs -reference:System.Numerics.dll -out:Factorial100.exe Factorial100.cs
```

**Note**: there are some non-standard libraries that may work, even for .NET 2.0.

### 2.1.4. Java

It's necessary to use class **BigInteger** to solve this challenge.

### 2.1.5. Go

It's necessary to use **big.Int** to solve this challenge.

## 2.2. Interpreted

### 2.2.1. Perl

It requires the use of bigint, but it causes Perl to run too slow, which makes it non viable.

### 2.2.2. Python / Jython

It handles **BigInteger** automatically.

### 2.2.3. Ruby / JRuby

It handles **BigInteger** automatically.

### 2.2.4. Groovy

It's necessary to use class **BigInteger** to solve this challenge, just like in Java.

**Note**: Groovy is a bit better than Java at wrapping integers in BigInteger operations, without requiring the use of ```BigInteger.valueOf()``` method like Java does.

# 3. Results

- Fastest is C#, although Java is close by;
- Python, Jython, JRuby, Ruby have close enough results, so they all take the second place;
- Groovy and Go run slower, and since Go aims to be very fast it then makes Groovy the third and Go the forth;
- Perl did finish, but it can't be compared to any of the other technologies;
- C and Pascal don't have enough precision to complete this challenge.
