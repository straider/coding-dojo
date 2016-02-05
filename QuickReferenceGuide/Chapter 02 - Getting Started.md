Quick Reference Guide
=====================

# 2. Getting Started

> Perl is an interpreted language, which means that your code can be run as is, without a compilation stage that creates a non portable executable program.

> Traditional compilers convert programs into machine language. When you run a Perl program, it's first compiled into a byte code, which is then converted ( as the program runs) into machine instructions. So it is not quite the same as shells, or Tcl, which are strictly interpreted without an intermediate representation.

> It is also not like most versions of C or C++, which are compiled directly into a machine dependent format. It is somewhere in between, along with Python and awk and Emacs .elc files.

> Perl borrows syntax and concepts from many languages: awk, sed, C, Bourne Shell, Smalltalk, Lisp and even English.

> Perl is a loosely typed language and there is no need to specify a type for your data while using in your program. The Perl interpreter will choose the type based on the context of the data itself.

> Perl has three basic data types:
- **Scalars** are simple variables. They are preceded by a dollar sign ```$```. A scalar is either a number, a string, or a reference. A reference is actually an address of a variable;
- **Arrays of scalars** are ordered lists of scalars that one can access with a numeric index which starts with 0. They are preceded by an "at" sign ```@```;
- **Hashes of scalars**, also known as associative arrays, are unordered sets of key/value pairs that one can access using the keys as subscripts. They are preceded by a percent sign ```%```.

## 2.1. Comments

> Simply saying comments in Perl start with a hash symbol and run to the end of the line:

```perl
# Single line comment.
```

> Lines starting with = are interpreted as the start of a section of embedded documentation (pod), and all subsequent lines until the next =cut are ignored by the compiler.

```perl
=begin multi-line-comment
Multiple lines comment.
Generally used as POD - Plain Old Documentation - format.
=cut
```

## 2.2. Statements

> A Perl program consists of a sequence of declarations and statements, which run from the top to the bottom. Loops, subroutines, and other control structures allow you to jump around within the code. Every simple statement must end with a semicolon ```;```.

> To group together a bunch of statements one uses a **block**, by surrounding them with braces: ```{ ... }```.

## 2.3. Keywords and Identifiers

> A Perl identifier is a name used to identify a variable, function, class, module, or other object. A Perl variable name starts with either $, @ or % followed by zero or more letters, underscores, and digits (0 to 9).

> Perl does not allow punctuation characters such as @, $, and % within identifiers. Perl is a case sensitive programming language. Thus $Manpower and $manpower are two different identifiers in Perl.

> There are three special literals - __FILE__, __LINE__, and __PACKAGE__ - that represent the current filename, line number, and package name at that point in the program execution.

> In some languages there is a special way to say "this field does not have a value". In SQL, PHP and Java this would be NULL. In Python it is None. In Ruby it is called Nil. In Perl the value is called ```undef```.

## 2.4. Loading Sources

There are 3 distinct statements to load sources:

- ```do```: will look for a file by searching the @INC path and if the file can't be found, it'll silently move on. But if it is found, then it will run the file just as if it was placed in a block within the main program – but with one slight difference: it can see the lexical variables from the main program;
- ```require```: is like ```do```, but it'll only load and run once. It'll record the fact that a file has been loaded and will ignore further requests to require it again. It also fails with an error if it can't find the file;
- ```use```: is like ```require```, except that Perl applies it before anything else in the program. If Perl sees a use statement anywhere in the program, it'll include that module.

> **Note**: Using a bareword instead of a string tells Perl to look for a file called [bareword].pm in the @INC path. It also converts any instance of :: into a directory separator.

```perl
use Data::Dumper;

require 'module_once.pm';

do 'module_many.pm'
```

As a best practice, every program should use **strict** and **warnings**:

```perl
use strict;
use warnings;

...
```

## 2.5. Console Input / Output

### 2.5.1. Console Output 101

To output to the console there's one command, ```print```:

```perl
print "Hello, World!\n"
```

Since version 5.10 that there's a more simple command, ```say```:

```perl
use 5.010;
say "Hello, World";
```

To output to the console with formatting there's another command, ```printf```:

```perl
printf "%04d\n", 123;
```

### 2.5.2. Console Input 101

> Input is read from the user via the input stream.

```perl
my $input = <STDIN>;
print "User has typed: ${input}\n";
```

### 2.5.3. Command Line Arguments 101

## 2.6. UTF-8 Encoding
