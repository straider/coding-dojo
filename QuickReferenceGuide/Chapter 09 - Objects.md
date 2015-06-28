Quick Reference Guide
=====================

# 9. Objects

## 9.1. Classes: Structs and Interfaces

**Note**: _private_ and _public_ visibility is set by naming the attribute, method or struct / interface: if first letter is in uppercase then it's public else it's private.
 
### 9.1.1. Attributes

The attributes are the fields of a struct, which can be composed with other structs.

```c
type Engine struct {
  brand string
  model string
  hp    int
}

type Car struct {
  manufacturer string
  model        string
  color        string
  engine       Engine
}
```

### 9.1.2. Methods

The methods, which can be grouped in an interface, are functions with a receiver type that is a struct.

```c
func ( car Car ) accelerate( value float64 ) speed float64 {
}
```

```c
type Shaper interface {
  area()
  perimeter()
}

type Square struct {
  width float64
}

func ( square Square ) area() ( result float64 ) {
  result = square.width * square.width
  return result
}

func ( square Square ) perimeter() ( result float64 ) {
  result = square.width * 4
  return result
}

type Rectangle struct {
  width  float64
  height float64
}

func ( rectangle Rectangle ) area() ( result float64 ) {
  result = rectangle.width * rectangle.height
  return result
}

func ( rectangle Rectangle ) perimeter() ( result float64 ) {
  result = rectangle.width * 2 + rectangle.height * 2
  return result
}
```

### 9.1.3. Inheritance

> Go provides two features that replace class inheritance. The first is embedding, an automated form of composition. The second are its interfaces.

> interface{}, the empty interface, is an important corner case because it can refer to an item of any concrete type, including builtin types like string. Code using the empty interface can't simply call methods (or built-in operators) on the referred-to object, but it can store the interface{} value, try to convert it to a more useful type via a type assertion or type switch, or inspect it with Go's reflect package. Because interface{} can refer to any value, it's a limited way to escape the restrictions of static typing, like void* in C but with additional run-time type checks.

> An interface is two things: it is a set of methods, but it is also a type. A core concept in Go is that instead of designing abstractions in terms of what kind of data the types can hold, one designs abstractions in terms of what actions the types can execute.

### 9.1.4. Method Overriding

### 9.1.5. Method Overloading

### 9.1.6. Abstract Classes

### 9.1.7. Freezing Objects

## 9.2. Mixins

## 9.3. Garbage Collector

## 9.4. Principles

### 9.4.1. Abstraction

### 9.4.2. Encapsulation

### 9.4.3. Inheritance

### 9.4.4. Polymorphism
