Quick Reference Guide
=====================

# 7. Functions

## 7.1. main()

- ```func main() { ... }``` is a function definition. **main** is a special function, since it is the entry point for the executable program;
- Function ```main()``` has no parameters and no return type.

## 7.2. Signature and Body

> A function declaration tells the compiler about a function's name, return type, and parameters. A function definition provides the actual body of the function.

A function is declared by following this pattern:

```c
func function_name( [parameter list] ) [return_types] {
  ...
}
```

- Functions can be declared, in a program, in any order you wish. The compiler scans the entire file before execution, so function prototyping is a thing of the past in Go;
- Go uses curly braces:
  - The opening ```{``` must be on the same line as the function signature: this is imposed by the compiler;
  - The closing ```}``` is positioned after the code of the function declaration in the column beneath keyword **func**.
- Function names starting with a capital letter are exported outside the package, that is, they are visible and can be used by other packages; then they follow PascalCasing eg. MyFunctionInGo(). Use dot notation to access an exported identifier of a package, such as ```os.Args```;
- When a function is not exported outside a package then they follow camelCasing: every new word in the name starts with a capital letter eg. myFunctionInGo();
- A function can optionally be bound to a specific type. This is called the receiver.

```c
func subroutine() { return }

func procedure( input int ) { return }

func identity( id long ) long { return id }
```

## 7.3. Scope

Variables declared inside a function have a local scope. If the name of a local variable clashes with a global variable ( both have the same name ) then the global variable is shadowed inside the body of the function by the local variable and no changes occur to the global variable value.

## 7.4. Function Call

While calling a function, there are two ways that arguments can be passed to a function:

- **Call by value**: This method copies the actual value of an argument into the formal parameter of the function. In this case, changes made to the parameter inside the function have no effect on the argument;
- **Call by reference**: This method copies the address of an argument into the formal parameter. Inside the function, the address is used to access the actual argument used in the call. This means that changes made to the parameter affect the argument.

## 7.5. Variadic Functions

> There is a special form available for the last parameter in a Go function. They are known as Variadic functions and can be called with any number of trailing arguments. By using ... before the type name of the last parameter you can indicate that it takes zero or more of those parameters. We invoke the function like any other function except we can pass as many values as we want.

```c
func add( numbers ...int ) ( int ) {
  total := 0
  for _, number := range numbers { # Use blank identifier to discard index.
    total += number
  }
  return total
}
```

## 7.6. Return Values

- Go requires explicit returns, i.e. it won't automatically return the value of the last expression;
- Functions in Go can have multiple return values;
- Naming the return parameters is optional. The parentheses around returning clause can be omitted when there's only one return type;
- It is legitimate to discard some or all of a function's return values by assigning them to the blank identifier "_". However, if no return values are wanted it is more conventional to simply ignore them.

> Go’s return values may be named and act just like variables. These names should be used to document the meaning of the return values. A return statement without arguments returns the current values of the results. This is known as a _naked_
return. Naked return statements should be used only in short functions.

```c
func SumAndProduct( x, y int ) ( sum, product int ) {
  sum, product = x + y, x * y
  return // Naked Return
}
```

## 7.7. defer

Go has a special statement called **defer** which schedules a function call to be run after the function completes. It is often used when resources need to be freed in some way.

> The defer statement allows you to designate specified functions to be executed just before returning from the current function block. Why would this be useful? In programming we often have to allocate/block/lock resources, but then the program abruptly ends in between and is unable to reach the part of the code where we un-allocate/unblock/unlock these sources, which is not a good thing. By using defer we are ensuring that we free up all these resources whatever happens.

> You are allowed to call multiple defer-ed functions. When you do, it behaves like a stack: the functions are execute in Last In First Out (LIFO) order. In the example below the order of deferring is fA() first and then fB(). But the order of execution is reversed or in LIFO order - fB() is executed first, and then fA().

## 7.8. panic()

> A **panic** generally indicates a programmer error ( for example attempting to access an index of an array that's out of bounds, forgetting to initialize a map, etc.) or an exceptional condition that there's no easy way to recover from.

> Panic is a built-in function that stops the ordinary flow of control and begins panicking. When the function F calls panic, execution of F stops, any deferred functions in F are executed normally, and then F returns to its caller. To the caller, F then behaves like a call to panic. The process continues up the stack until all functions in the current goroutine have returned, at which point the program crashes. Panics can be initiated by invoking panic directly. They can also be caused by runtime errors, such as out-of-bounds array accesses.

## 7.9. recover()

> We can handle a run-time panic with the built-in **recover** function: it stops the panic and returns the value that was passed to the call to panic.

> Recover is a built-in function that regains control of a panicking goroutine. Recover is only useful inside deferred functions. During normal execution, a call to recover will return nil and have no other effect. If the current goroutine is panicking, a call to recover will capture the value given to panic and resume normal execution.

## 7.10. init()

> Every Go package may contain one or more ```init()``` functions specifying actions that should be taken during program initialization. Here, multiple declarations of the same identifier can occur without either resulting in a compilation error or the shadowing of a variable.
