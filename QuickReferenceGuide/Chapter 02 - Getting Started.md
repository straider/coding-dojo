Quick Reference Guide
=====================

# 2. Getting Started

- [Getting Started](http://golang.org/doc/install)

Go implementations use a traditional compile and link model to produce executables suitable for the operating system where Go runs. Programs are constructed using packages and Go as an efficient mechanism to manage dependencies.

Go programs are made of keywords, constants, variables, operators, types and functions. The source should be in text files with extension ".go", and if necessary encoded in UTF-8 without BOM.

## 2.1. Comments

There are two type of comments:
- Single line comment: starting with ```//```;
- Multiple lines comment: between ```/* ... */```.

```c
// Single line comment

... // Single line comment
```

```c
/*
Multiple
lines
comment
*/
```

**Attention**: nested comments are not possible.

## 2.2. Statements

- Statements don't need to end with semi-colon: ";";
- Multiple statements in one line must be separated with semi-colon ";".

## 2.3. Keywords and Identifiers

There are 25 keywords, or reserved words, which may not be used as identifiers.

|          |             |        |           |        |
|----------|-------------|--------|-----------|--------|
| break    | default     | func   | interface | select |
| case     | defer       | go     | map       | struct |
| chan     | else        | goto   | package   | switch |
| const    | fallthrough | if     | range     | type   |
| continue | for         | import | return    | var    |      

Identifiers are used to name variables, constants, types, functions and more.

- An identifier is a sequence of alphanumeric characters or underscore;
- The first character must be a letter or an underscore;
- Identifiers are case-sensitive.

**Note**: there is a _blank identifier_, "_", which is a special identifier used for discarding values that are not necessary.

## 2.4. Packages

> Go operates in terms of packages rather than files. This means that we can split
a package across as many files as we like, and from Go's point of view if they all
have the same package declaration, they are all part of the same package and
no different than if all their contents were in a single file. Naturally, we can also break our applications' functionality into as many local packages as we like, to keep everything neatly modularized.

- All Go files start with package [PACKAGE_NAME];
- Declarations have an order in a file: package always first, then import, then everything else;
- Package **main** is required for a standalone executable;
- By convention packages names are single-word lowercase identifiers; there should be no need for underscores or CamelCase;
- By convention the package name is the last element of the import path: a package imported as "checksum/md5" should be named md5;
- An identifier is exported if it starts with capital letter. Exported means that a function or variable / constant is accessible to the importer of the respective package.

## 2.4. Loading Sources

- A package other than **main** is commonly called a library;
- A Go program is created by linking together a set of packages;
- To load library packages, that are referenced in the file, it's required to use the **import** keyword;
  - import loads the public declarations from the compiled package;
  - import does not insert the source code.
- The package names are enclosed within double-quotes, ```""```;
- The Go installation contains a number of ready-to-use packages, which form the standard library. The entire [standard library](http://golang.org/pkg/) is documented, with examples;
- Go allows the aliasing of imports. Conventionally, aliases are only used when necessary ( such as when package names would otherwise collide ).

There are two ways to import packages:
- single package declaration;
- multiple package declaration.

```c
import "fmt"
```

```c
import (
  "fmt"
  "os"
)
```

**Attention**: importing a package which is not used in the rest of the code is a build-error.

> The presence of an unused variable may indicate a bug, while unused imports just slow down compilation, an effect that can become substantial as a program accumulates code and programmers over time. For these reasons, Go refuses to compile programs with unused variables or imports, trading short-term convenience for long-term build speed and program clarity.

> The reason for having no warnings. If it's worth complaining about, it's worth fixing in the code. And if it's not worth fixing, it's not worth mentioning. Nowadays, most Go programmers use a tool, **goimports**, which automatically rewrites a Go source file to have the correct imports, eliminating the unused imports issue in practice.

## 2.5. Console Input / Output

To handle console input and output it's required to import a package, called **fmt**.

```c
import "fmt"
...
```

### 2.5.1. Console Output 101

There are 3 functions to output to the console, **os.Stdout**:
- ```fmt.Print()```: outputs to the console, without ending it with a newline; Several arguments are possible and the output will have them joined together without any extra whitespace in between;
- ```fmt.Println()```: outputs to the console, ending it with a newline; Several arguments are possible and the output will have them joined together with an extra whitespace in between, if the value is not of type string;
- ```fmt.Printf()```: outputs to the console, using formatting verbs to output the values in a given format.

There are low-level functions to output to the console, without having to import the package "fmt". But these are mainly used for debugging purposes and should not be used in production programs. The functions are ```print()``` and ```println()```.

### 2.5.2. Console Input 101

There are 3 functions to output to the console, **os.Stdin**:
- ```fmt.Scan()```: scans text read from standard input, storing successive space-separated values into successive arguments. Newlines count as space. It returns the number of items successfully scanned;
- ```fmt.Scanln()```: is similar to Scan, but stops scanning at a newline and after the final item there must be a newline or EOF;
- ```fmt.Scanf()```: scans text read from standard input, storing successive space-separated values into successive arguments as determined by the format. It returns the number of items successfully scanned. Scanf parses the arguments according to a format string, analogous to that of Printf with certain restrictions.

### 2.5.3. Command Line Arguments 101

To handle command line arguments it's required to import a package, called **os**.

```c
import "os"
...
```

In the package os there's a special variable: ```var Args []string```

Args holds the command-line arguments, starting with the program name. os.Args provides access to raw command-line arguments. Note that the first value in this slice is the path to the program, and ```os.Args[ 1 : ]``` holds the arguments to the program.

### 2.6. UTF-8 Encoding

> In Go, an individual code point ( i.e., a character ) is represented by a **rune** in memory. Unicode text — whether in files or in memory — must be represented using an encoding. The Unicode standard defines various Unicode Transformation Formats ( encodings ), such as UTF-8, UTF-16,and UTF-32. Go uses the UTF-8 encoding for strings. UTF-8 is the most widely used encoding; it is also the defacto standard encoding for text files and the default encoding for XML and
JSON files.
