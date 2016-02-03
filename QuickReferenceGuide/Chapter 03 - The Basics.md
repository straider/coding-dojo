Quick Reference Guide
=====================

# 3. The Basics

## 3.1. Variables

> Variables are the reserved memory locations to store values. This means that when a variable is created than some space in memory is reserved. Based on the data type of a variable, the interpreter allocates memory and decides what can be stored in the reserved memory. Perl has the following three basic data types: **scalars**, **arrays** and **hashes**.

> Perl maintains every variable type in a separate namespace. So one can, without fear of conflict, use the same name for a scalar variable, an array, or a hash. This means that $foo and @foo are two different variables.

> Perl treats same variable differently based on Context, i.e. situation where a variable is being used. Perl's most distinctive feature is that its code is context-sensitive. Every expression in Perl is evaluated either in scalar context or list context, depending on whether it is expected to produce a scalar or a list. Without knowing the context in which an expression is evaluated, it is impossible to determine what it will evaluate to.

| Context        | Description |
|----------------|-------------|
| Scalar         | Assignment to a scalar variable evaluates the right-hand side in a scalar context. |
| List           | Assignment to an array or a hash evaluates the right-hand side in a list context. |
| Boolean        | Boolean context is simply any place where an expression is being evaluated to see whether it's true or false. |
| Void           | This context not only doesn't care what the return value is, it doesn't even want a return value. |
| Interpolative  | This context only happens inside quotes, or things that work like quotes. |

Perl allows the use of the following special variables:

| Special Variable | Description |
|------------------|-------------|
| $_               | Or $ARG, is the default input and pattern-searching space. |
| @_               | Or @ARG, within a subroutine is the array that contains the parameters passed to that subroutine. |
| $]               | Or $OLD_PERL_VERSION, is the revision, version, and subversion of the Perl interpreter, represented as a decimal of the form 5.XXXYYY. |
| $^V              | Or $PERL_VERSION, is the revision, version, and subversion of the Perl interpreter, represented as a version object. |
| $0               | Or $PROGRAM_NAME, is the name of the program being executed. |
| $$               | Or $PROCESS_ID or $PID, is the process number of the Perl running this script. |
| %ENV             | The hash %ENV contains the current environment variables. Setting a value in ENV changes the environment for any child processes which is subsequently fork() off. |
| @INC             | The array @INC contains the list of places that the do EXPR , require, or use constructs look for their library files. |
| %INC             | The hash %INC contains entries for each filename included via the do, require, or use operators. |

**Note**: ```$_``` is by default a global variable. However, as of perl v5.10.0, one can use a lexical version of ```$_``` by declaring it in a file or in a block with **my**. Moreover, declaring ```our $_``` restores the global ```$_``` in the current scope.

### 3.1.1. Single Declaration

> Perl variables do not have to be explicitly declared to reserve memory space. The declaration happens automatically when a value is assigned to a variable, by the ```=``` operator.

```perl
my $number;
my $text;
my @list;
my %map;
```

### 3.1.2. Multiple Declaration

```perl
my ( $a, $b, $c, $d );
```

### 3.1.3. Type Inference

### 3.1.4. Type Conversion

### 3.1.5. Multiple Assignment

```perl
my $a = $b = $c = $d = 1;
print $a, "\n";
print $b, "\n";
print $c, "\n";
print $d, "\n";

my ( $a, $b, $c, $d ) = ( 1, 2, 3, 4 );
print $a, "\n";
print $b, "\n";
print $c, "\n";
print $d, "\n";
```

### 3.1.6. Function Type Variables

### 3.1.7. Scope

## 3.2 Constants

### 3.2.1. Single Declaration

### 3.2.2. Multiple Declaration

### 3.2.3. Type Inference

## 3.3. Pointers

## 3.4. Named Types
