Quick Reference Guide
=====================

# 8. Closures


## 8.1. Lambdas

> A closure is a function which "captures" any constants and variables that are present in the same scope where it is created, if it refers to them. This means that a closure is able to access such constants and variables when the closure is called, even if it is called far away from the place where it was created. It doesn't matter if any captured constants or variables have gone out of scope — so long as a closure refers to them they are kept alive for the closure to use.

> In Go, every anonymous function ( or function literal, as they are called in the Go
specification ) is a closure.

> A closure is created using almost the same syntax as for a normal function, but with one key difference: The closure has no name ( so the keyword func is immediately followed by an opening parenthesis ). To make use of a closure we normally assign it to a variable or put it in a data structure ( such as a map or slice ).

```c
addPng := func( name string ) string { return name + ".png" }
addJpg := func( name string ) string { return name + ".jpg" }

fmt.Println( addPng( "filename" ), addJpg( "filename" ) )
```

```c
func AddSuffix( suffix string ) func( string ) string {
  return func( name string ) string {
    if ! strings.HasSuffix( name, suffix ) {
      return name + suffix
    }
    return name
  }
}

addZip := AddSuffix( ".zip" )
addTgz := AddSuffix( ".tar.gz" )
fmt.Println( addTgz( "filename" ), addZip( "filename" ), addZip( "filename.zip" ) )
```

## 8.2. Procs

## 8.3. List Comprehension

## 8.4. High-Order Functions

> A higher order function is a function that takes one or more other functions as
arguments and uses them in its own body.

## 8.5. Pure Functions

> A pure function is a function which always produces the same result for a given
argument or arguments — and that has no side effects. If a pure function is expensive to compute and frequently used with the same arguments, we can use memoization to reduce the processing overhead—at the price of using more memory. The memoization technique is where we store the results of a computation so that when the same computation is next requested we are able to return the stored results rather than perform the computation all over again.
