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

N/A.

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
- V2 is easy to adapt to new pairs: just requires a new line of code: ```$line .= '[WORD]' if ( $i % [PRIME] == 0 );```
- V3 is the easiest to adapt to new pairs: just requires a new key-value-pair: ```( ... [PRIME] => '[WORD]' )```

**Note**: it's great when a language offers collection types as basic types.

**Attention**: it is necessary to sort the keys of the PrimeWords hash, in V3, since in Perl the hash is an unordered collection.

#### Object Oriented

N/A.

#### Functional
