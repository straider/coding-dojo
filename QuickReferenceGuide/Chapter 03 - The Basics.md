Quick Reference Guide
=====================

# 3. The Basics

## 3.1. Variables

- Any given variable can at different times hold references to objects of many different types;
- Variables act as "references" to objects, which undergo automatic garbage collection.

> Variables, simply put, are just reserved memory locations to store values. Python variables do not need explicit declaration to reserve memory space. The declaration happens automatically when a value is assigned to a variable.

### 3.1.1. Single Declaration

Every variable declaration is untyped and initialized, except for class and instance variables which are untyped and are not initialized.

### 3.1.2. Multiple Declaration

There's no such concept, in Python. One can declare and assign multiple variables in one line but each is a statement of its own, separator by semicolon.

### 3.1.3. Type Inference
 
Variables are dynamic and therefor there's no need for type inference.

To find the type of value that a variables refers to one can use the function ```type()```.

In Python 2 the result is prefixed with **type**, while in Python 3 the result is prefixed with **class**.

```python
type( 1 )
>>> <type 'int'>
type( 1.0 )
>>> <type 'float'>
type( '1' )
>>> <type 'str'>
```

```python
type( 1 )
>>> <class 'int'>
type( 1.0 )
>>> <class 'float'>
type( '1' )
>>> <class 'str'>
```

### 3.1.4. Type Conversion

There are several functions to do type conversion: for basic types and for collection types.

### 3.1.5. Multiple Assignment

- ```x, y = 1, 2```
- ```i, f = 1, 1.0```
- ```a, b = 'same value'```

### 3.1.6. Function Type Variables

A variable can point to a function.

### 3.1.7. Scope

A variable can have global or local scope. All local variables with the same name as global variables shadow those global variables and their values are kept untouched.

To change the value of a global variable inside a function it's necessary to define it as global.

```python
number = 1

def add( value ) :
  global number
  number += value

add( 3 )
print number
```

## 3.2 Constants

There are no concept of constants in Python. By convention, if one wants a variable to remain fixed to a value one names it with capital letters, but that's only a convention, since it's still a variable.

But there are special constants:

- **False**
- **True**
- **None**
- **NotImplemented**: special value which can be returned by the "rich comparison" special methods ( ```__eq__()```, ```__lt__()```, and friends), to indicate that the comparison is not implemented with respect to the other type.
- **Ellipsis**: special value used in conjunction with extended slicing syntax.

### 3.2.1. Single Declaration

### 3.2.2. Multiple Declaration
 
### 3.2.3. Type Inference
