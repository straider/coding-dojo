Quick Reference Guide
=====================

# 3. The Basics

- By convention, use underscores to separate words in a multi-word name of a variable, constant or method;
- Classes names have to be in CamelCase format;
- Ruby is dynamically typed and everything one manipulates is an object and the results of those manipulations are themselves objects.

## 3.1. Variables

- Any given variable can at different times hold references to objects of many different types;
- Variables act as "references" to objects, which undergo automatic garbage collection.

Variables, simply put, are just references to objects. These objects can be values, symbols, methods, classes and so on, since everything is an object in Ruby.

### 3.1.1. Single Declaration

Every variable declaration is untyped and initialized, except for class and instance variables which are still untyped but are not initialized.

### 3.1.2. Multiple Declaration

There's no such concept, in Ruby. One can declare and assign multiple variables in one line but each is a statement of its own, separator by semicolon.

### 3.1.3. Type Inference

There's no such concept, in Ruby. A variable is by nature untyped, a reference to some sort of object in memory.

### 3.1.4. Type Conversion

In Ruby there are no casts. There are, though, methods such as ```to_i()```, ```to_f()```, ```to_r()```, ```to_c()```, ```to_s()```, ```to_a()``` that by convention transform an object into another.

### 3.1.5. Multiple Assignment

```ruby
x, y = 1, 2
i, f = 1, 1.0
a, b = 'same value'
a, b = b, a # this will interchange the values of both variables.
```

**Note**: careful with multiple assignment. Not always the left side variables are assigned as one think they should be the right side values. The following two statements are the same, when in fact one may want the result of the third statement: declare and initialize 3 variables with different values.

```ruby
a = 1, b = 2, b = 3
=> [1, 2, 3]
```

```ruby
[ a = 1, b = 2, c = 3 ]
=> [1, 2, 3]
```

```ruby
a = 1; b = 2; c = 3
=> 3
```

There's a **short-circuit** recipe to set a value to a variable only if it's not already initialized:

```ruby
variable = variable || 'default value'
=> "default value"
```

```ruby
variable = 'defined'
variable = variable || 'default value'
=> "defined"
```

Another option if to check if the variable is defined, using the **defined?** operator.

```ruby
defined? variable
```

### 3.1.6. Function Type Variables

Since Ruby doesn't doesn't associate type to variables there is no such concept as Function Type Variables. But there's something similar: a variable can point to a **block** ( _closure_ ) and the block will be called whenever the variable is evaluated.

### 3.1.7. Scope

- Variable name itself denotes its scope ( global, class, instance, local ), by using _sigils_ or by the lack of them;
- Local variables begin with a lowercase letter or _ and they lack any prefix _sigil_;
- Global variables begin with _sigil_ $;<br />Uninitialized global variables have the value nil and produce warnings with the -w option;
- Instance variables begin with _sigil_ @;<br />Uninitialized instance variables have the value nil and produce warnings with the -w option;
- Class variables begin with _sigils_ @@;<br />They must be initialized before they can be used in method definitions. Referencing an uninitialized class variable produces an error.

## 3.2 Constants

- Constants begin with capital letters;
- It's just a convention, there's no guarantee that the value will not change;
- If the interpreter detects a change to a constant it issues a warning, not an error.

### 3.2.1. Single Declaration

### 3.2.2. Multiple Declaration
 
### 3.2.3. Type Inference
 