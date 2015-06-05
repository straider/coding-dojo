Quick Reference Guide
=====================

# 2. Getting Started

## 2.1. Comments

- One-liner: use ```# This is an one-liner comment````;
- Multi-line: use ```=begin ... =end```.

**Note**: multi-line syntax dictates that the "=" signs are the first characters of each line.

```ruby
=begin
This
is
a
multiple
line comment
=end
```

## 2.2. Statements

- Multiple statements on one line must be separated by semicolons;
- Semicolons are optional, not required, at the end of a line with just one statement;
- A linefeed is treated like a semicolon;
- If a line ends with a backslash "\" then the linefeed following it is ignored.

## 2.3. Keywords and Identifiers

These are reserved words:

|          |        |         |          |
|----------|--------|---------|----------|
| BEGIN    | do     | next    | then     |
| END      | else   | nil     | true     |
| alias    | elsif  | not     | undef    |
| and      | end    | or      | unless   |
| begin    | ensure | redo    | until    |
| break    | false  | rescue  | when     |
| case     | for    | retry   | while    |
| class    | if     | return  | __FILE__ |
| def      | in     | self    | __LINE__ |
| defined? | module | super   |          |

Identifiers are used to name variables, constants, methods and classes. The coding style for each will be given in Chapter 03. Any identifier is case-sensitive and is a sequence of alphanumeric and underscore characters. Some special characters can be used, following a convention for identifying variables and methods:
- Identifiers for variables can be prefixed with "$", "@" or "@@";
- Identifiers for methods can be suffixed with "?", "!" or "=".

**Note**: an identifier can start with an underscore.

## 2.4. Loading Sources

In Ruby every source file ends with the extension **.rb**. To load code from other source files there are 2 keywords:
- **load**: Loads and executes the Ruby program in the file filename;
- **require**: Loads the given name, returning true if successful and false if the feature is already loaded;
- **relative_require**: Loads the given name relative to the requiring file's path. If the file's path cannot be determined a LoadError is raised. If a file is loaded true is returned and false otherwise.

> **Note**: In no circumstance will any local variables in the loaded file be propagated to the loading environment.

Before **relative_require** keyword existed it was necessary to tell the interpreter to include files from current directory, using the statement: ```$LOAD_PATH << '.'```.

## 2.5. Console Input / Output

### 2.5.1. Console Output 101

- **puts** and **print** are used to output to the console;
- If **puts** is passed an object that is not a string, it then calls the to_s() method of that object and prints the string returned by that method;
- STDOUT is a global constant which is the actual standard output stream for the program;

> ```STDOUT.sync = true``` will allow you to have flushed Ruby based IO without repeated flush() calls.

### 2.5.2. Console Input 101

- **gets** ( get a string ) and **chomp** ( a string method ) are used to accept input from a user;

### 2.5.3. Command Line Arguments 101

Arguments passed on the command line are collected on a special array, called **ARGV**, that holds as many items as distinct arguments have been used when calling the program.

- Class **GetoptLong** supports command-line option parsing;

### 2.6. UTF-8 Encoding

> The default character set for Ruby is ASCII, whose characters may be represented by single bytes. To change the character set use $KCODE at the beginning of the program to one of the allowed encoding modes.

| Code | Description |
|:----:|:-----------:|
| a    | ASCII       |
| e    | EUC         |
| n    | None        |
| u    | UTF-8       |

**Note**: modes ASCII or None are the same.

```ruby
$KCODE = 'u'
```

~~To specify that a source file is encoded in UTF-8 one must use ```# coding: utf-8``` or ```# encoding: utf-8``` special comment~~.

**Note**: with version 2.0 it's no longer required to have this special comment. The interpreter uses UTF-8 if it finds a source file encoded in UTF-8 without BOM.

