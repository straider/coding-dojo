Quick Reference Guide
=====================

# 5. Collection Types

## 5.1. Structs

### 5.1.1 Operators

## 5.2. Arrays, Lists and Sets

> Arrays contain a fixed number of elements of a specified data type.

> Groovy reuses the list notation for arrays, but to make such literals arrays, you need to explicitly define the type of the array through coercion or type declaration.

```java
Object[] bag = new Object[ 4 ]

String[] fruits = [ 'Ananas', 'Banana', 'Kiwi' ]
```

> List variables contain several items and are declared using square brackets "[...]".

```java
def temperatures = []
def temperatures = [ 10, 5, 8, 3, 6 ]

def mixed = [ 1, true, 'rabbit', 3.14 ]

def array_list  = [1, 2, 3] as ArrayList  // By default
def linked_list = [2, 3, 4] as LinkedList
```

> Sets are much like lists but each element in a set is unique.

```java
def names = ['sally', 'bob', 'sally', 'jane'] as Set
```

Useful methods:

- ```get()```: access an element by its index;
- ```add()```: add an element to the end;
- ```size()```: returns the number of elements;
- ```first()```: return the first element;
- ```last()```: return the last element;
- ```tail()```: returns the collection minus the first ( head ) element;
- ```init()```: returns the collection minus the last element;
- ```contains()```: returns true if the requested element is contained in the collection;
- ```sort()```: returns the collection sorting the elements in a "natural" order;
- ```reverse()```: returns the mirror of the collection.

### 5.2.1 Operators

| Operator | Operation      |
|:--------:|:---------------|
| in       | Is item in     |
| <<       | Add            |
| +        | Concatenation  |
| -        | Removal        |
| *        | Repeat         |
| *[]      | Spread items   |
| .*       | Apply method   |

> The Spread operator extracts each element in the List into another list or a method's parameters. This is helpful when you need to include a list's individual items in another list or when your list can be used as parameters in a method call.

## 5.3. Hashes, Maps or Dictionaries

> Maps allow us to build up a type of look-up table using keys and values. Other languages call these dictionaries or associated arrays. Each key in a map is unique and points to a value in the map.

```java
def grades   = [ : ]
def periodic = [ 'h'  : 'hydrogen',
                 'he' : 'helium'  ,
                 'li' : 'lithium' ]
```

Useful methods:

- ```get()```: access an element by its key;
- ```put()```: add a key-value pair;
- ```size()```: returns the number of pairs;
- ```keySet()```: returns a list containing all of the keys in a map;
- ```values()```: returns a list of the values in a map;
- ```containsKey()```: returns true if the map contains a key;
- ```containsValue()```: returns true if the map contains a value.

### 5.3.1 Operators

| Operator | Operation      |
|:--------:|:---------------|
| in       | Is key in      |
| <<       | Add            |
| +        | Concatenation  |
| -        | Removal        |

## 5.4. Ranges

> Ranges define a starting point and an end point. It's possible to declare a half-open range using "..<" instead of "..".

```java
def countdown = 10 .. 0
def floors    = 1 ..< 10
def alphabet  = 'a' .. 'z'
```

### 5.4.1 Operators

### 5.4.2 Ranges as Sequences

### 5.4.3 Ranges as Conditions

### 5.4.4 Ranges as Intervals

## 5.5. Slices

### 5.5.1 Operators
