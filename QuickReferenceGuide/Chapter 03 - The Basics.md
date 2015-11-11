Quick Reference Guide
=====================

# 3. The Basics

## 3.1. Variables

> A variable is nothing but a name given to a storage area that our programs can manipulate. Each variable in Pascal has:
- a specific type, which determines the size and layout of the variable's memory;
- the range of values that can be stored within that memory;
- the set of operations that can be applied to the variable.

> All variables must be declared before we use them in Pascal program. All variable declarations are followed by the var keyword. A declaration specifies a list of variables, followed by a colon (:) and the type:

```pascal
var
  variableA, variableB... : VariableType;
```

> Pascal variables are declared outside the code-body of the function which means they are not declared within the begin and end pairs, but they are declared after the definition of the procedure/function and before the begin keyword. For global variables, they are defined after the program header.

> Variables are assigned a value with a colon and the equal sign, followed by a constant expression. By default, variables in Pascal are not initialized and they may contain rubbish values. So it is a best practice to initialize variables in a program. The general form of assigning a value is:

```pascal
variableName := value;
```

> Variables can be initialized ( assigned an initial value ) in their declaration. The initialization is followed by the var keyword and the syntax of initialization is as follows:

```pascal
var
  variableName : Type = Value;
```

### 3.1.1. Single Declaration

```pascal
var
  i : integer;
  r : real;
  s : string = "Hello, World!";
```

### 3.1.2. Multiple Declaration

```pascal
var
  x, y, z : integer;
```

### 3.1.3. Type Inference

### 3.1.4. Type Conversion

### 3.1.5. Multiple Assignment

### 3.1.6. Function Type Variables

### 3.1.7. Scope

## 3.2 Constants

> Pascal allows numerical, logical, string and character constants. Constants can be declared in the declaration part of the program by specifying the const declaration.

Syntax of constant type declaration is follows:

```pascal
const
  Identifier = contantValue;
```

### 3.2.1. Single Declaration

```pascal
const
  PI = 3.141592;
```

### 3.2.2. Multiple Declaration
 
### 3.2.3. Type Inference

## 3.3. Pointers

## 3.4. Named Types

> The type declaration is used to declare the data type of an identifier. Syntax of type declaration is:

```pascal
type
  typeIdentifierA, typeIdentfierB = typeSpecifier;
```

```pascal
type
  days : integer;

var
  weekdays, holidays : days;
```