Quick Reference Exercises
=========================

# 1. Introduction

# 2. Getting Started

## 2.1. Comments

- Write one-liner comment "This is an one-liner comment";
- Write multi-line comments, using the above comment in several consecutive lines;
- Write language self-documenting comments;
- Does the language have DocTest features?<br />**Yes**

## 2.2. Statements

- Write multiple statements in one line ( which is the statement separator in this case? );
- Does the language allow statements without END_OF_STATEMENT_CHARACTER ( are linefeeds considered a statement separator )?<br />**Yes**
- Write a statement that spans across several lines ( which is the LINEFEED_ESCAPE_CHARACTER? );
- Does the language impose restrictive indentation?<br />**No**

## 2.3. Keywords and Identifiers

## 2.4. Packages / Namespaces

## 2.5. Import Libraries

### 2.5.1. Console Output 101

- Output "Hello, World!" to the console, without a linefeed;
- Output "Hello, World!" to the console, with a linefeed;
- Output "Hello, World!" to the console, by using formatting verbs;

### 2.5.2. Console Input 101

- Input from user, using message "What's your name: " ;
- Does the language require cutting off the linefeed entered by user?<br />**No**, if using ```fmt.Scan()``` or ```fmt.Scanln()```, but it seems to require if using ```fmt.Scanf()``` on Windows.

### 2.5.3. Command Line Arguments 101

- Output number of arguments when program executed without any arguments;
- Output number of arguments when program executed with one argument;
- Output number of arguments when program executed with several arguments, separated by whitespace;
- Output number of arguments when program executed with one argument, composed of several words separated by whitespace ( wrapped in single or double quotes ).

### 2.6. UTF-8 Encoding

- Output "» José Carlos Monteiro «" to the console;
- Ask input for EUR or GBP currency symbol and output "Currency Symbol: € / £" to the console.

# 3. The Basics

## 3.1. Variables

- Declare typed uninitialized numeric variables ( short, int, long, float, double, complex );
- Declare untyped uninitialized numeric variables ( short, int, long, float, double, complex );
- Declare typed initialized numeric variables ( short, int, long, float, double, complex );
- Declare untyped initialized numeric variables ( short, int, long, float, double, complex );
- Declare typed uninitialized string variables ( character, string, symbol );
- Declare untyped uninitialized string variables ( character, string, symbol );
- Declare typed initialized string variables ( character, string, symbol );
- Declare untyped initialized string variables ( character, string, symbol );
- Declare typed uninitialized collection variables ( range, array, list, set, map );
- Declare untyped uninitialized collection variables ( range, array, list, set, map - Declare typed initialized collection variables ( range, array, list, set, map );
- Declare untyped initialized collection variables ( range, array, list, set, map ).

- Declare multiple variables in one line;
- Assign multiple values to multiple variables in one line;
- Assign same value to multiple variables in one line;
- Assign a value to a variable if it doesn't already have a value;
- Swap the values of two variables of same type;
- Swap the values of two variables of different types.
 
### 3.1.6. Function Type Variables

- Can a variable hold a function value?

### 3.1.7. Scope

- Does the language allow global variables?<br />**Yes**
- Does the language allow local variables?<br />**Yes**
- Does the language allow instance variables ( properties or fields )?
- Does the language allow class variables ( properties or fields )?
- Do local variables shadow higher level variables of the same name?<br />**Yes**

## 3.2 Constants

- Declare typed uninitialized numeric constants ( short, int, long, float, double, complex );
- Declare untyped uninitialized numeric constants ( short, int, long, float, double, complex );
- Declare typed initialized numeric constants ( short, int, long, float, double, complex );
- Declare untyped initialized numeric constants ( short, int, long, float, double, complex );
- Declare typed uninitialized string constants ( character, string, symbol );
- Declare untyped uninitialized string constants ( character, string, symbol );
- Declare typed initialized string constants ( character, string, symbol );
- Declare untyped initialized string constants ( character, string, symbol );
- Declare typed uninitialized collection constants ( range, array, list, set, map );
- Declare untyped uninitialized collection constants ( range, array, list, set, map );
- Declare typed initialized collection constants ( range, array, list, set, map );
- Declare untyped initialized collection constants ( range, array, list, set, map ).

- Declare multiple constants in one line;
- Assign multiple values to multiple constants in one line;
- Assign same value to multiple constants in one line;
- Does the language enforce that constant is unchanged after assignment?<br />**Yes**

# 4. Basic Types

## 4.1. Numeric

- Does the language allow Cardinal ( also known as Unsigned Numbers )?<br />**Yes**

- Add two numbers;
- Subtract one number from another;
- Multiply two numbers;
- Divide one number by another;
- Divide one number by the other and get the remainder ( modulus );
- Raise one number with an exponent of another.

- Are there short-notation operators for basic mathematical operations?
- Does the language have increment and decrement operators ( postfix and prefix forms )?<br />**Yes**, but only in postfix form.
- Does the language have bitwise operators ( AND, OR, XOR, One's Complement, Shift - left and right )?

- Does the language provide a decimal type suitable for money and currency operations ( avoiding floating point precision errors )?

## 4.2. Strings

- Are string mutable or immutable?<br />**Immutable**
- Concatenate two strings;
- Does the language have string interpolation?
- Append a string to another string;
- Output several values of distinct types with formatting verbs;
- Does the language allow HereDoc notation?
- Does the language allow back-tick strings, that issue commands to the operating system?<br />**No**

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

- Is null / nil equal to itself?
- Is false and null / nill and 0 equal to one another?
- Is true and 1 equal to one another?
- Can the language comply with short-circuit logic in a ternary operator replacement ( condition and trueValue or falseValue )?

# 5. Collection Types

- Does the language offer **structs**?<br />**Yes**
- Does the language offer **arrays** or **lists**?<br />**Yes**
- Does the language offer **sets**?<br />**Yes**
- Does the language offer **maps** or **hashes**?<br />**Yes**
- Does the language offer **ranges**?<br />**Yes**
- Does the language offer **iterators**?<br />**Yes**

## 5.1. Sequences

## 5.5. Regular Expressions

## 5.6. Enumerables 

# 6. Control Flow Structures

- Does the language allow **if..else if..else**?<br />**Yes**
- Does the language allow **unless..else**?<br />**No**
- Does the language allow **if statement modifiers**?<br />**No**
- Does the language allow **ternary operator**?<br />**No**
- Does the language allow **switch**?<br />**Yes**
- Does the language allow **for** loops?<br />**Yes**
- Does the language allow **while** loops?<br />**No**
- Does the language allow **while statement modifiers**?<br />**N/A**
- Does the language allow **until** loops?<br />**No**
- Does the language allow **until statement modifiers**?<br />**/NA**
- Does the language allow catching exceptions?<br />**Yes**

Exercises:

- FizzBuzz ( if, for, range );
- FuzzBuzzDazzKezz ( for, range, string concatenation, map, iterator );
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
- Temperature Converter

# 8. Closures

# 9. Classes

# 10. Mixins

# 11. Concurrency

# 12. Core Packages / Standard Library

# 13. Libraries

- Math: holds Infinity and NaN
- Handle short / long command line options
- Logging
- SQL: Database and Drivers ( Connection, Statements, DataSets, ... )
- Unit Testing Frameworks

# 14. Testing

# 15. Benchmarking

# 16. File Handling / Input-Output

# 17. Random Numbers
