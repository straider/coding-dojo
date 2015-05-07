coding-dojo / FizzBuzz
======================

Dojo to register different programming paradigms of FizzBuzz Challenge.

## Goals

- Gain experience with if..else and ternary operator;
- Take advantage of String concatenation;
- Learn to format output: number of characters, padding, ...;
- Gain experience with collections and foreach;
- Compare Programming Paradigms in a simple context;
- Gain traction in Object Oriented Design and Programming;
- Gain traction in following S.O.L.I.D. principles;
- Gain traction by applying Design Patterns.

## Variants

**Note**: in all variants and versions, if possible, the output of the numeric value to the console should be formatted to 4 digits, padded with 0s on the left.

----

### Procedural

#### Requirements

- Iterate numbers from 1 to 100;
- Output each number in a distinct line, to the console;
- Unless the number is, in order:
  - If divisible by 3 then output string "Fizz" instead;
  - If divisible by 5 then output string "Buzz" instead;
  - If divisible by 3 and by 5 then output string "FizzBuzz" instead.

#### Constraints

- v1: using only if..else;
- v2: using ternary operator and string concatenation;

----

### Object Oriented

#### Requirements

- Iterate numbers from 1 to 100;
- Output each number in a distinct line, to the console;
- Unless the number is, in order:
  - If divisible by 3 then output string "Fizz" instead;
  - If divisible by 5 then output string "Buzz" instead;
  - If divisible by 3 and by 5 then output string "FizzBuzz" instead.

#### Constraints

- v1: using object PrimeWord that after instantiated with a number and a word returns the word if a value is divisible by number else returns an empty string;
- v2: using object PrimeWord, ordered list and Iterator;
- v3: using object NumberWord and a Decorator for each pair;
- v4: use steps in Chain Of Responsibility.

----

### Functional

#### Requirements

- Iterate numbers from 1 to 100;
- Output each number in a distinct line, to the console;
- Unless the number is, in order:
  - If divisible by 3 then output string "Fizz" instead;
  - If divisible by 5 then output string "Buzz" instead;
  - If divisible by 3 and by 5 then output string "FizzBuzz" instead.

#### Constraints

- v1: using pattern matching;
- v2: using high order functions;
- v3: using recursion.

----

### Challenge

Add another prime number pair ( 7, Dazz ) and compare coding effort of each variant and version to adapt to this new requirement.

#### Procedural

- V1 is very verbose and prone to human error, more so as more pairs are added;
- V2 is the easiest to adapt to new pairs: just requires a new line of code: line += ( i % [PRIME] == 0 ) ? "[WORD]" : "";

#### Object Oriented

- V1 is the second best to adapt to new pairs: requires 2 new lines of code for each pair;
- V2 is also a second best to adapt and could be even better if instead of hard-coded instances would process a map of pairs. It would then be the best of all, even better than Procedural V1;
- V3 requires one new line of code for each pair and new Decorator class ( to follow this Design Pattern convention );
- V4 requires 3 new lines of code for each pair plus changing one line of code ( introduce a new step in the chain ).

#### Functional
