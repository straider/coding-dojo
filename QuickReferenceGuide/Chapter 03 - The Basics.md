Quick Reference Guide
=====================

# 3. The Basics

There are two kinds of expressions in Go:
- **lvalue**: Expressions that refer to a memory location is called "lvalue" expression. An lvalue may appear as either the left-hand or right-hand side of an assignment;
- **rvalue**: The term rvalue refers to a data value that is stored at some address in memory. An rvalue is an expression that cannot have a value assigned to it which means an rvalue may appear on the right but not on the left hand side of an assignment.

> When there is a value stored in memory, it is stored in a physical location. This location is called its address. To access the data in a location use the _sigil_ **&** before the variable name.

## 3.1. Variables

A variable is a storage location for holding a value.

- The **var** keyword declares a list of variables;
- A var statement can be at package or function level;
- The type comes after the variable name ( postfix notation );
- The set of permissible values is determined by the variable's type;
- Go assigns a _zero-value_ by default to most data types.

**Attention**: Declared, but otherwise, unused variables are a compiler error in Go.

### 3.1.1. Single Declaration

```c
var i int32       // Typed Variable.
var f       = 2.0 // Untyped Variable.
```

### 3.1.2. Multiple Declaration

```c
// Typed Variables
var (
  i int32
  f float64
  c complex128
  s string
)

// Untyped variables
var (
  i = 1
  f = 3.14
  c = 1 + 2i
  s = "Hello"
)

// Multiple typed declaration must have one type.
var x, y int

// Multiple untyped declaration and parallel assignment with different types.
var a, b = 3.14, 5

// Untyped parallel assignment with different types.
a, b, c := 3.14, 5, "Hello"
```

**Note**: parallel assignment does not work for variables already declared, unless there's one more undeclared variables among the variables in the parallel assignment statement.

### 3.1.3. Type Inference

Go can infer the type of the declared and initialized variable: this means that if an initializer is present, the type can be omitted.

**Note**: Outside a function the := construct is not available.
 
### 3.1.4. Type Conversion

### 3.1.5. Multiple Assignment

```c
a, b, c = 3.14, 5, "Hello"
```

### 3.1.6. Function Type Variables

> Functions are values. Functions can be passed around just like any other value. A function's type signature describes the types of its arguments and return values.

### 3.1.7. Scope

> A scope in any programming is a region of the program where a defined variable can have its existence and beyond that variable can not be accessed. There are three places where variables can be declared in Go programming language:

- Inside a function or a block which is called local variables;
- Outside of all functions which is called global variables;
- In the definition of function parameters which is called formal parameters.

## 3.2 Constants

The constants refer to fixed values that the program may not alter during its execution. These fixed values are also called literals. The constants are treated just like regular variables except that their values cannot be modified after their definition.

Like with variables, constants can be declared as untyped constants, just with the value set, or as types constants, when both the type and value are used in the declaration.

**Attention**: Constants cannot be declared using the := syntax.

- The **const** keyword declares a list of constants;
- A const statement can be at package or function level;
- The type comes after the constant name ( postfix notation );
- The set of permissible values is determined by the constant's type.

**Note**: Declared, but otherwise, unused constants are not a compiler error, as opposed to what happens with variables.

### 3.2.1. Single Declaration

```c
const i int32 = 1   // Typed Constant.
const f       = 2.0 // Untyped Constant
```

### 3.2.2. Multiple Declaration

```c
// Multiple Typed Constants.
const (
  i int32      = 1
  f float64    = 3.14
  c complex128 = 1 + 2i
  s string     = "Hello"
)

// Multiple Untyped Constants.
const (
  i = 1
  f = 3.14
  c = 1 + 2i
  s = "Hello"
)

// Multiple typed declaration must have one type.
const x, y int = 1, 2

// Multiple untyped declaration and parallel assignment with different types.
const a, b = 3.14, "Hello"
```
 
### 3.2.3. Type Inference

Go can infer the type of the declared and initialized constant: this means that if an initializer is present, the type can be omitted.

**Note**: Outside a function the := construct is not available.

## 3.3. Pointers

> A pointer is a variable whose value is the address of another variable, i.e., direct address of the memory location. Like any variable or constant, you must declare a pointer before you can use it to store any variable address.

```c
var var_name *var-type
```

There are few important operations, which we will do with the help of pointers very frequently:

- define a pointer variable;
- assign the address of a variable to a pointer;
- access the value at the address available in the pointer variable. This is done by using unary operator "*" that returns the value of the variable located at the address specified by its operand.

> Go compiler assign a Nil value to a pointer variable in case you do not have exact address to be assigned. This is done at the time of variable declaration. A pointer that is assigned nil is called a nil pointer.

> On most of the operating systems, programs are not permitted to access memory at address 0 because that memory is reserved by the operating system. However, the memory address 0 has special significance; it signals that the pointer is not intended to point to an accessible memory location. But by convention, if a pointer contains the nil (zero) value, it is assumed to point to nothing.

**Note**: pointers are required to pass values by reference in a function call.

> Another way to get a pointer is to use the built-in **new** function: it takes a type as an argument, allocates enough memory to fit a value of that type and returns a pointer to it.

> In some programming languages there is a significant difference between using new and &, with great care being needed to eventually delete anything created with new. Go is not like this, it's a garbage collected programming language which means memory is cleaned up automatically when nothing refers to it anymore.

## 3.4. Named Types

> Named types are another way to create user defined types. They provide some interesting feature/functionality that is not always available in other languages. The standard library in Go used named types very effectively.
