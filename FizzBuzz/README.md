coding-dojo / FizzBuzz
======================

Dojo to register different programming paradigms of FizzBuzz Challenge.

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
