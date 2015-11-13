coding-dojo / benchmarking / Fibonnaci
======================================

# 1. Introduction

Personal Coding Dojo, for simple benchmarking of several technologies.

## 1.1. Goal and Objectives

- To test execution times of array operations;
- Using simple addition operation;
- Evaluate technology support for dynamic arrays: append / push.

## 1.2. Constraints

- Compilers and code should have no optimization features turned on;
- Must follow procedural paradigm, without using - as much as possible - classes or functional logic or specific language constructs.

# 2. Technologies

## 2.1. Compiled

### 2.1.1. Pascal

Although it seems that some Pascal implementations offers dynamic arrays it's still unclear if it's an ISO standard or not.

### 2.1.2. C

It doesn't support dynamic arrays.

### 2.1.3. C#

It supports **List< int >** and it's quite fast. And **List** class offers ```Add()``` and ```AddRange()``` methods.

It also has a very good ```String.Format()``` method to format strings.

But there's no **foreach** loop over the list that provides an index and the iterated value.

### 2.1.4. Java

There are two collections, **ArrayList< Integer >** and **LinkedList< Integer >**, that can't have primitive type such as **int**. Both implement the interface **List** and offer ```add()``` and ```addAll()``` methods to add an item to the list and to concatenate a list with another list.

It also has a good ```String.Format()``` method to format strings.

But there's no **foreach** loop over the list that provides an index and the iterated value.

**Note**: The collection chosen was **ArrayList** because of performance reasons.

### 2.1.5. Go

Instead of array or list it's better to use **slice**, using []int. The ```append()``` method is polymorphic and can handle adding an item to the slice or concatenating a slice into another slice.

The **for** loop can iterate over a slice by providing an index and the iterated value.

It also offers a good ```fmt.Sprintf()``` method to format strings.

## 2.2. Interpreted

### 2.2.1. Perl

Usual use of an array, with function ```push()``` that can handle adding an item or concatenating an array into another array.

Although it offers a **foreach** loop that only provides the iterated value and not the index as well, so the index has to be managed manually.

It offers the usual ```printf()``` function.

### 2.2.2. Python / Jython

Usual use of a list, with function ```append()``` to add an item to the list and with the operator ```+=``` to concatenate a list with another list.

Like Perl, it offers a **foreach** loop that only provides the iterated value and not the index as well, so the index has to be managed manually.

It also has a very good ```String.Format()``` method to format strings, second to no other and in par with C#.

**Note**: the Jython execution was even faster than Java execution itself.

### 2.2.3. Ruby / JRuby

Usual use of a list, with ```push()``` or ```<<``` method to add an item to the list and the operator ```+=``` to concatenate a list with another list.

Like Go, it offers an ```each_with_index()``` method that can provides an index and the iterated value.

It also offers a good ```%``` method to format strings.

### 2.2.4. Groovy

It support the same two implementations of **List** that Java does: **ArrayList** and **LinkedList**. And like Java it also can't handle items of primitive type **int**.

Like Ruby, it offers the operator ```<<``` to add an item to the list and the operator ```+=``` to concatenate a list with another list.

And like Java, it offers a good ```String.Format()``` method to format strings.

**Note**: The collection chosen was **ArrayList** because of performance reasons.

# 3. Results

- Perl is the fastest of all and the fastest of the interpreted languages;
- Python is the second, twice as slow as Perl;
- C# and Go are twice faster than Java, when using ArrayList< Integer >;
- Ruby and JRuby are slow;
- Groovy is the slowest, almost 3 times slower than JRuby.

**Note**: Ruby and JRuby have better performance when using the _splat_ operator ```*```.
