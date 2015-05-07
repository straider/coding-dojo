coding-dojo / HelloWorld
========================

First and most simple dojo.

Useful to quickly check software development kits, compilers or interpreters setup and configuration.

## Goals

- Check proper installation and configuration of builder / interpreter for a given programming language;
- Gain traction with if..else and ternary operator;
- Gain traction in outputting to console, specially in UTF-8 encoding mode ( if possible );
- Gain traction handling Strings: concatenation, interpolation;
- Gain traction handling command line arguments.

## Variants

----

### Simple OneLiner

#### Requirements

- Output the string "Hello, World!" to console.

#### Constraints

- Code as less lines as possible.

----

### UTF-8 with argument

#### Requirements

- Parse optional command-line argument: name;
- If argument is not passed then output the string "Hello, World!" to the console;
- Else, since argument is passed, then output the string "Hello, [name]!" to the console, where [name] stands for the value passed as argument;
- Always output after the greeting message the string "» José Carlos Monteiro «" in a new line.

**Note**: the console must be in UTF-8 encode mode.

#### Constraints

- Code without objects ( but methods are allowed ).

----

### Notes

- Offers **say()** and **print()** to output to console;
- But say() requires version 5.10.0 or higher;
- Requires module _utf8_ to handle UTF-8 encoding mode;
- Handles String concatenation with operator ".";
- Handles String interpolation inline "$variable";
- Handles command line arguments through $ARGV array.

**Attention**: it's not good at following Object Oriented paradigm.
