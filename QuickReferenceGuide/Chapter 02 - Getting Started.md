Quick Reference Guide
=====================

# 2. Getting Started

## 2.1. Comments

### 2.1.1. Single line Comments

> Single line comments start with "//" and can be found at any position in the line. The characters following "//", till the end of the line, are considered part of the comment.

```java
// a standalone single line comment
println "hello" // a comment till the end of the line
```

> Beside the single line comment, there is a special line comment, often called the _shebang_ line understood by UNIX systems which allows scripts to be run directly from the command-line, provided you have installed the Groovy distribution and the groovy command is available on the PATH.

```bash
#!/usr/bin/env groovy
```

### 2.1.2. Multi-line Comments

> A multiline comment starts with "/*" and can be found at any position in the line. The characters following "/*" will be considered part of the comment, including new line characters, up to the first "*/" closing the comment. Multiline comments can thus be put at the end of a statement, or even inside a statement.

```java
/* a standalone multiline comment
   spanning two lines */
println "hello" /* a multiline comment starting
                   at the end of a statement */
println 1 /* one */ + 2 /* two */
```

### 2.1.3. GroovyDoc Comments

> Similarly to multiline comments, GroovyDoc comments are multiline, but start with "/**" and end with "*/". Lines following the first GroovyDoc comment line can optionally start with a star "*". Those comments are associated with:

- type definitions ( classes, interfaces, enums, annotations );
- fields and properties definitions;
- methods definitions.

## 2.2. Statements

- A Groovy statement is generally completed by an end-of-line (EOL) character such as a carriage return;
- A semicolon ";" can be used to explicitly mark the end of a statement however this is deemed to be redundant in most cases and spoils readability;
- A semicolon can be used to separate two statements appearing on the same line;
- The backslash "\" is used to indicate that a statement continues on the next line.

> Groovy uses curly brackets "{ ... }" to enclose blocks of code. These are primarily used to group a set of statements within elements such as control flow, class, method and closure declarations. Blocks also let you "partition off" parts of code so that items such as variables aren't visible to other parts of your code - referred to as "scope".

> Groovy doesn’t allow the use of anonymous code block, they have to be _labeled_.

## 2.3. Keywords and Identifiers

These are reserved words:

|          |         |            |         |        |
|----------|---------|------------|---------|--------|
| as       | def     | for        | new     | throws |
| assert   | default | goto       | null    | trait  |
| break    | do      | if         | package | true   |
| case     | else    | implements | return  | try    |
| catch    | enum    | import     | super   | while  |
| class    | extends | in         | switch  |        |
| const    | false   | instanceof | this    |        |
| continue | finally | interface  | throw   |        |

Identifiers start with a letter, a dollar or an underscore. They cannot start with a number. All keywords are also valid identifiers when following a dot, but one should avoid using reserved keywords as identifiers for classes properties or methods.

> Quoted identifiers appear after the dot of a dotted expression. For instance, the name part of the person.name expression can be quoted with person."name" or person.\'name'. This is particularly interesting when certain identifiers contain illegal characters that are forbidden by the Java Language Specification, but which are allowed by Groovy when quoted.

## 2.4. Loading Sources

## 2.5. Console Input / Output

### 2.5.1. Console Output 101

- ```print()```
- ```println()```

### 2.5.2. Console Input 101

### 2.5.3. Command Line Arguments 101

> args is a variable ( an array ) that holds any command-line arguments we pass to the script.

## 2.6. UTF-8 Encoding

## 2.7. Tools

Groovy provides, by default, a set of tools besides the interpreter itself ( **groovy** ):

- **groovysh**: it's a normal REPL ( Read-Evaluate Print Loop ) for Groovy;
- **groovyConsole**: provides a handy environment for preparing and testing basic Groovy scripts;
- **groovyc**: it's possible to compile a Groovy script into a Java class file - the same type of file that Java developers compile their code into. The resulting class file is in bytecode format that can be read by the Java Virtual Machine (JVM). Once compiled to bytecode, Groovy code can work on the same JVM that runs existing Java systems - this is extremely handy if you work in a Java-centric organisation but want to use Groovy.
