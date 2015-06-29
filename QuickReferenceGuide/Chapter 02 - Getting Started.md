Quick Reference Guide
=====================

# 2. Getting Started

## 2.1. Comments

> A hash sign, "#", that is not inside a string literal begins a comment. All characters after the # and up to the end of the physical line are part of the comment and the Python interpreter ignores them.

> Multiline strings can be written using three double quotes and are often used as comments. They are called DocumentStrings or _docstrings_.

> if one of these _docstrings_ is the first statement in a program, module, function definition or class definition then that string is assigned to the attribute name ```__doc__```. This _docstring_ can later be extracted in various ways ( see e.g. Retrieving source code in module inspect; also see modules pydoc and doctest ).

```python
# Single line comment.

"""
Multiple
lines
Comment
is actually a String.
"""
```

## 2.2. Statements

### 2.2.1. Lines and Indentation

- Python provides no braces to indicate blocks of code for class and function definitions or flow control;
- Blocks of code are denoted by line indentation, which is rigidly enforced;
- Indentation consists of whitespace formed by blanks, tabs, and newlines;
- The number of spaces in the indentation is variable, but all statements within the block must be indented in the same way as the leading statement.
- Incorrect indentation can lead to errors.

### 2.2.2. Multi-Line Statements

> Statements in Python typically end with a new line. Python does, however, allow the use of the line continuation character backslash, "\", to denote that the line should continue.

### 2.2.3. Multiple Statements on a Single Line

> The semicolon, ";", allows multiple statements on the single line given that neither statement starts a new code block.

### 2.2.4. Blank Lines

> A line containing only whitespace, possibly with a comment, is known as a blank line and Python totally ignores it.

### 2.2.5. Multiple Statement Groups as Suites

- A group of individual statements, which make a single code block are called suites in Python;
- Compound or complex statements, such as if, while, def, and class require a header line and a suite;
- Header lines begin the statement ( with the keyword ) and terminate with a colon, ":", and are followed by one or more lines which make up the suite.

## 2.3. Keywords and Identifiers

These are the reserved keywords:

|          |        |         |        |       |        |
|----------|--------|---------|--------|-------|--------|
| and      | def    | exec    | if     | not   | return |
| assert   | del    | finally | import | or    | try    |
| break    | elif   | for     | in     | pass  | while  |
| class    | else   | from    | is     | print | with   |
| continue | except | global  | lambda | raise | yield  |

```python
import sys
import keyword


print "Python version: ", sys.version_info
print "Python keywords: ", keyword.kwlist
```

> A Python identifier is a name used to identify a variable, function, class, module or other object. An identifier starts with a letter or an underscore, "_", followed by zero or more letters, underscores or digits. Python does not allow punctuation characters such as @, $, and % within identifiers. Python is a case sensitive programming language.

By convention:

- Class names start with an uppercase letter. All other identifiers start with a lowercase letter;
- Starting an identifier with a single leading underscore indicates that the identifier is protected;
- Starting an identifier with two leading underscores indicates a private identifier;
- If the identifier also ends with two trailing underscores, the identifier is a language-defined special name.

## 2.4. Loading Sources

## 2.5. Console Input / Output

### 2.5.1. Console Output 101

- ```print```: outputs a comma separated list of values to the console with an ending newline.

**Note**: values separated by commas are concatenated with an extra whitespace.

### 2.5.2. Console Input 101

- ```raw_input()```: gets input from the console.

### 2.5.3. Command Line Arguments 101

- The Python sys module provides access to any command-line arguments via the sys.argv:
  - sys.argv is the list of command-line arguments;
  - len( sys.argv ) is the number of command-line arguments;
  - sys.argv[ 0 ] is the program, ie. script name.
- Python provides a getopt module that helps parse command-line options and arguments.

## 2.6. UTF-8 Encoding

> Unicode strings are expressed as instances of the **unicode** type, one of Python's repertoire of built-in types. It derives from an abstract type called basestring, which is also an ancestor of the str type; you can therefore check if a value is a string type with ```isinstance( value, basestring )```. Under the hood, Python represents Unicode strings as either 16- or 32-bit integers, depending on how the Python interpreter was compiled.

In Python source code, Unicode literals are written as strings prefixed with the "u" or "U" character. Python supports writing Unicode literals in any encoding, but you have to [declare the encoding](https://www.python.org/dev/peps/pep-0263/) being used. This is done by including a special comment as either the first or second line of the source file:

```python
#!/usr/bin/env python
# -*- encoding: utf-8 -*-

u = u'abcdé'
print u
```

**Note**: the default encoding mode for Python 2 is ASCII. This can be changed
using ```sys.setdefaultencoding()```:

```python
reload( sys )
sys.setdefaultencoding( 'utf-8' )
```

**Attention**: in Windows, using chcp 65001, causes Python 2 to crash. The fix is simply to set an Environment Variable like this:

```bash
set PYTHONIOENCODING=utf-8
```

In Python 3, by default, strings are in Unicode and it's fine to use ```<type 'str'>``` while in Python 2 one should use ```<type 'basestr'>```. So it's no longer necessary to prefix an Unicode string with the character "u".
