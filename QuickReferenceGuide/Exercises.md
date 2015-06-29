Quick Reference Exercises
=========================

# 1. Introduction

# 2. Getting Started

## 2.1. Comments

- Write one-liner comment "This is an one-liner comment";
- Write multi-line comments, using the above comment in several consecutive lines;
- Write language self-documenting comments;
- Does the language have DocTest features?<br />**Yes**, but requires an external gem.

## 2.2. Statements

- Write multiple statements in one line ( which is the statement separator in this case? );
- Does the language allow statements without END_OF_STATEMENT_CHARACTER ( are linefeeds considered a statement separator )?<br />**Yes**
- Write a statement that spans across several lines ( which is the LINEFEED_ESCAPE_CHARACTER? );
- Does the language impose restrictive indentation?<br />**No**

## 2.3. Keywords and Identifiers

## 2.4. Loading Sources

## 2.5. Console Input / Output

### 2.5.1. Console Output 101

- Output "Hello, World!" to the console, without a linefeed;
- Output "Hello, World!" to the console, with a linefeed;
- Output "Hello, World!" to the console, by using formatting verbs;

### 2.5.2. Console Input 101

- Input from user, using message "What's your name: " ;
- Does the language require cutting off the linefeed entered by user?<br />**Yes**

### 2.5.3. Command Line Arguments 101

- Output number of arguments when program executed without any arguments;
- Output number of arguments when program executed with one argument;
- Output number of arguments when program executed with several arguments, separated by whitespace;
- Output number of arguments when program executed with one argument, composed of several words separated by whitespace ( wrapped in single or double quotes ).

### 2.6. UTF-8 Encoding

- Output "» José Carlos Monteiro «" to the console;
- Ask input for EUR or GBP currency symbol and output "Currency Symbol: € / £" to the console.

# 3. The Basics

Write a fully documented "Circle Area Calculator", using a constant for PI and receiving an argument: radius.

## 3.1. Variables

> Typed variables is a concept, in Ruby. A variable is said to be of a type when it refers to a value of that type. Given the dynamic features of Ruby, a variable does not have a fixed type and once declared is also initialized ( unless it's a class or instance variable ).

### 3.1.1. Basic Types

- ~~Declare typed uninitialized numeric variables ( short, int, long, float, double, complex )~~;
- ~~Declare untyped uninitialized numeric variables ( short, int, long, float, double, complex )~~;
- ~~Declare typed initialized numeric variables ( short, int, long, float, double, complex )~~;
- Declare untyped initialized numeric variables ( short, int, long, float, double, complex ).

**Attention**: there is no Cardinal type.

**Note**: there are more "Basic Types" in Ruby: **Rational** and **BigDecimal** ( this is in Standard Library ).

- ~~Declare typed uninitialized string variables ( character, string, symbol )~~;
- ~~Declare untyped uninitialized string variables ( character, string, symbol )~~;
- ~~Declare typed initialized string variables ( character, string, symbol )~~;
- Declare untyped initialized string variables ( character, string, symbol );

> Symbols are more efficient than Strings, since these are mutable in Ruby.

**Attention**: there is no Character type.

### 3.1.2. Collections

- ~~Declare typed uninitialized collection variables ( range, array, list, set, map )~~;
- Declare untyped uninitialized collection variables ( range, array, list, set, map );
- ~~Declare typed initialized collection variables ( range, array, list, set, map )~~;
- Declare untyped initialized collection variables ( range, array, list, set, map ).

**Note**: Sets are in Standard Library.

Exercises:

- Declare multiple variables in one line;
- Assign multiple values to multiple variables in one line;
- Assign same value to multiple variables in one line;
- Assign a value to a variable if it doesn't already have a value;
- Swap the values of two variables of same type;
- Swap the values of two variables of different types.
- Declare a variable with the number of seconds in a hour;
- Declare a variable with the perimeter of a rectangle with sides 2 and 3.

### 3.1.6. Function Type Variables

- Can a variable hold a function value?**Yes**, by using **Proc** or **lambda**.

### 3.1.7. Scope

- Does the language allow global variables?<br />**Yes**
- Does the language allow local variables?<br />**Yes**
- Does the language allow instance variables ( properties or fields )?<br />**Yes**
- Does the language allow class variables ( properties or fields )?<br />**Yes**
- Do local variables shadow higher level variables of the same name?<br />**Yes**

## 3.2 Constants

- ~~Declare typed uninitialized numeric constants ( short, int, long, float, double, complex )~~;
- ~~Declare untyped uninitialized numeric constants ( short, int, long, float, double, complex )~~;
- ~~Declare typed initialized numeric constants ( short, int, long, float, double, complex )~~;
- Declare untyped initialized numeric constants ( short, int, long, float, double, complex );
- ~~Declare typed uninitialized string constants ( character, string, symbol )~~;
- ~~Declare untyped uninitialized string constants ( character, string, symbol )~~;
- ~~Declare typed initialized string constants ( character, string, symbol )~~;
- Declare untyped initialized string constants ( ~~character~~, string, symbol );
- ~~Declare typed uninitialized collection constants ( range, array, list, set, map )~~;
- ~~Declare untyped uninitialized collection constants ( range, array, list, set, map )~~;
- ~~Declare typed initialized collection constants ( range, array, list, set, map )~~;
- Declare untyped initialized collection constants ( range, array, list, set, map );
- Declare multiple constants in one line;
- Assign multiple values to multiple constants in one line;
- Assign same value to multiple constants in one line;
- Does the language enforce that constant is unchanged after assignment?<br />**No**, although it output a warning.

Exercises:

- Declare an integer constant, KB, which represents the number 2 ^ 10;
- Declare multiple integer constants, KB and MB, which represents the numbers 2 ^ 10 and 2 ^ 20;
- Declare a decimal constant, PI, with the value of [Pi](http://en.wikipedia.org/wiki/Pi) up to 10th decimal digit;
- Declare multiple constants, PI and e, with the value of Pi and [Euler's Number](http://en.wikipedia.org/wiki/E_(mathematical_constant)), up to the 10th decimal digit, in one line;
- Declare multiple constants, KB and PI and "Hello, World!" and true, in one line.

# 4. Basic Types

- Swap the values of two variables of same type;
- Swap the values of two variables of different types;
- Compare ```0.3 - 0.2 == 0.1```, using **float**, **Rational** and **BigDecimal**;
- Output the value of ```3/10 - 2/10``` in rational format.

## 4.1. Numeric

- Add two numbers;
- Subtract one number from another;
- Multiply two numbers;
- Divide one number by another;
- Divide one number by the other and get the remainder ( modulus );
- Raise one number with an exponent of another.

- Are there short-notation operators for basic mathematical operations?<br />**Yes**: +=, -=, \*=, /=, %=, \**=
- Does the language have increment and decrement operators ( postfix and prefix forms )?<br />**No**
- Does the language have bitwise operators ( AND, OR, XOR, One's Complement, Shift - left and right )?<br />**Yes**: &, |, ^, ~, <<, >>
- Does the language provide a decimal type suitable for money and currency operations ( avoiding floating point precision errors )?<br />**Yes**: either with **Rational**, in Core, or with **BigDecimal**, in Standard Library.
- Does the language allow Cardinal ( also known as Unsigned Numbers )?<br />**No**

Exercises:

- Calculate the circumference of a circle with radius 8 ( 2πr );
- Calculate the area of a circle with radius 8 ( πr^2 );

## 4.2. Strings

- Are string mutable or immutable?<br />**Mutable**
- Concatenate two strings;
- Does the language have string interpolation?<br />**Yes**: #{...}, but only for double quoted strings.
- Append a string to another string;
- Output several values of distinct types with formatting verbs;
- Does the language allow HereDoc notation?<br />**Yes**
- Does the language allow back-tick strings, that issue commands to the operating system?<br />**Yes**

Exercises:

- Compare two strings;
- Change the case of a string ( upper-case, lower-case, swap-case, title-case );
- Reverse a string by its characters;
- Count the number of characters in a string;
- Count the number of occurrences of a string ( character or sub-string ) in another string;
- Slice a string in sub-strings;
- Split a string in an array of strings;
- Join an array of strings into a string;
- Trim ( left, right, both ) a string;
- Pad ( left, right, both ) a string;
- Copy a string n times.

## 4.3. Symbols

## 4.4. Booleans

- What are the boolean operators?<br />and or &&, or or ||, not or !, where the shorter have higher precedence.
- Is null / nil equal to itself?<br />**Yes**
- Is false and null / nill and 0 equal to one another?<br />**No**
- Is true and 1 equal to one another?<br />**No**
- Can the language comply with short-circuit logic in a ternary operator replacement ( condition and trueValue or falseValue )?<br />**Yes**

# 5. Collection Types

- Does the language offer **structs**?<br />**Yes**
- Does the language offer **arrays** or **lists**?<br />**Yes**
- Does the language offer **sets**?<br />**Yes**, on Standard Library.
- Does the language offer **maps** or **hashes**?<br />**Yes**
- Does the language offer **ranges**?<br />**Yes**
- Does the language offer **iterators**?<br />**Yes**, as part of **Enumerable** or **Enummerator**.

## 5.1. Sequences

## 5.5. Regular Expressions

## 5.6. Enumerables 

# 6. Control Flow Structures

- Does the language allow **if..else if..else**?<br />**Yes**
- Does the language allow **unless..else**?<br />**Yes**
- Does the language allow **if statement modifiers**?<br />**Yes**
- Does the language allow **ternary operator**?<br />**Yes**
- Does the language allow **switch**?<br />**Yes**
- Does the language allow **for** loops?<br />**Yes**
- Does the language allow **while** loops?<br />**Yes**
- Does the language allow **while statement modifiers**?<br />**Yes**
- Does the language allow **until** loops?<br />**Yes**
- Does the language allow **until statement modifiers**?<br />**Yes**
- Does the language allow catching exceptions?<br />**Yes**

Exercises:

- FizzBuzz ( if, for, range );
- FuzzBuzzDazzKezz ( for, range, string concatenation, map, iterator );
- [Collatz conjecture](https://en.wikipedia.org/?title=Collatz_conjecture): Take any natural number n. If n is even, divide it by 2 to get n / 2. If n is odd, multiply it by 3 and add 1 to obtain 3n + 1. Repeat the process ( which has been called "Half Or Triple Plus One", or HOTPO ) indefinitely. The conjecture is that no matter what number you start with, you will always eventually reach 1. The property has also been called oneness. For this exercises, get the maximum number of the sequence of numbers produced by iterating over every step;
- Convert numbers from 1 .. 7 into name of weekdays ( switch );
- Refactor big if..elsif..else into a case..when..else ( switch );
- Deaf Gradma, with random year ( input, while, random );
- Text Analyzer ( string, array, if, iterator );
- Top 10 words more frequent in a text;
- Calculate elapsed number of seconds / minutes from a given date up to current date, taking into consideration leap and non leap years;
- Given any two integers then calculate the division of one by the other, by handling situations of n/0 ( exceptions ).

# 7. Functions

- Can functions with same name and different arguments exist?<br />**No**
- Are functions with arguments having default values allowed?<br />**Yes**
- Are functions with variable number of arguments allowed?<br />**Yes**

Exercises:

- Fibonacci
- Factorial
- Is Palindrome
- Temperature Converter

# 8. Closures

# 9. Objects

## 9.1. Classes

## 9.2. Interfaces / Modules

## 9.3. Mixins

# 10. Concurrency

# 11. Core Packages / Standard Library

## 11.1 BigDecimal

## 11.2. File Handling / Input-Output

## 11.3. Random Numbers

## 11.4. Date and Time

## 11.5. Regexp

## 11.6. Testing

## 11.7. Benchmarking

# 12. Libraries

## 12.1. SQL

## 12.2. Networking

## 12.3. Concurrency

## 12.4. Logging

## 12.5. Command Line Options

## 12.5. Testing

## 12.6. Benchmarking

## 12.7. File Handling / Input-Output

## 12,8. Random Numbers
