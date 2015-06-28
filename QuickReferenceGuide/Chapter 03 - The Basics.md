Quick Reference Guide
=====================

# 3. The Basics

## 3.1. Variables

> Variables can be defined using either their type or by using the keyword **def**.

### 3.1.1. Single Declaration

```java
int x
def y = 2

String word
def hi = 'Hello'
```

### 3.1.2. Multiple Declaration

```java
def a, b, c
```

### 3.1.3. Type Inference

> **def** is a replacement for a type name. In variable definitions it is used to indicate that you don't care about the type.

### 3.1.4. Type Conversion

> The ```as``` operator can be used to cast ( change ) a value to another class.

### 3.1.5. Multiple Assignment

```java
def a = 1, b = 2.5, c = 'foo'
def ( a, b, c ) = [ 1, 2.5, 'foo' ]
```

### 3.1.6. Function Type Variables

### 3.1.7. Scope

> Variable Scope refers to the visibility of a variable from other blocks. A variable declared at the top level is visible to blocks nested within it. The reverse, however, is not true. This lets us declare variables within a block that is specific to that block ( and any nested blocks ) but doesn't interfere with the rest of the program.

## 3.2 Constants

### 3.2.1. Single Declaration

### 3.2.2. Multiple Declaration
 
### 3.2.3. Type Inference
 