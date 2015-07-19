coding-dojo / Factorial-20
==========================

# 1. Introduction

Personal Coding Dojo, for simple benchmarking of several technologies.

## 1.2. Goal and Objectives

- To test execution times of nested loops;
- Using intensive multiplication operation;
- Evaluate technology precision between 32-bit and 64-bit long integer data types.

## 1.3. Constraints

- Use primitive signed integers, as much as possible;
- Compilers and code should have no optimization features turned on;
- Must follow procedural paradigm, without using - as much as possible - classes or functional logic or specific language constructs.

# 2. Technologies

The main problem here is how the technology deals with long integer: is it a 32-bit or a 64-bit wide number?

**Note**: compiled technologies may suffer more from the host operating system mode than on the compiler itself. But it may require several versions of the compiler, 32-bit and 64-bit, in a 64-bit operating system.

## 2.1. Compiled

### 2.1.1. Pascal

For this challenge it's necessary to use **int64** primitive data type, offer by Free Pascal Compiler.

### 2.1.2. C

Usually **long** is a 32-bit integer and for this challenge it's necessary to use **long long** primitive data type, which is a 64-bit integer.

### 2.1.3. C#

### 2.1.4. Java

### 2.1.5. Go

It's necessary to use **int64** primitive data type, for Go to output result with enough precision.

## 2.2. Interpreted

### 2.2.1. Perl

### 2.2.2. Python / Jython

### 2.2.3. Ruby / JRuby

### 2.2.4. Groovy

# 3. Results

- Fastest is C;
- Pascal is second;
- Perl, Ruby, Go and Python have close enough results, so they all take the third place;
- C# and Java run slower than interpreted languages, with similar results, and for this reason they take the forth place;
- JVM interpreted languages - Jython, Groovy and JRuby - run slower, which may be because of JVM startup overhead.
