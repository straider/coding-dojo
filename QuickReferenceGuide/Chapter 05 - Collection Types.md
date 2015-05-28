Quick Reference Guide
=====================

# 5. Collection Types

There are two special iterators in Ruby: the module **Enumerable** and the class **Enumerator**.

- The main iterator method is ```Enumerable.each()```;
- Other iterator methods are ```Enumerable.each_with_index()``` and ```Enumerable.each_with_object()```;
- The finder methods are ```Enumerable.select()```, ```Enumerable.find()``` and ```Enumerable.grep()```;
- The ```Enumerable.inject()``` method accumulates a value across the members of a collection;
- The ```Enumerable.partition()``` method divides a collection into two parts.

## 5.1. Structs

A Struct is a convenient way to bundle a number of attributes together, using accessor methods, without having to write an explicit class. The Struct class is a generator of specific classes, each one of which is defined to hold a set of variables and their accessors.

```ruby
Person = Struct.new( :name, :phone, :country )
joe = Person.new( 'José Monteiro', "+351.000.000.000", 'Portugal' )

joe[ 'name' ]
joe[ :phone ]
joe[ 2      ]
```

## 5.2. Arrays, Lists and Sets

- An Array is an ordered integer-indexed collection of items;
- Index start at 0 although a negative index means to start from the end of the array instead of the beginning;
- Every slot in the list acts like a variable;
- Ruby's arrays are mutable - arrays are dynamically resizable;
- Use a special Kernel module Array() method, to convert an object to an array;

```ruby
empty = []
clear = Array.new( 5 )
array = [ 'name', 1, 1.5, true ]
number_of_items = array.size
number_of_items = array.length
first_item      = array[ 0 ]
first_item      = array.first
last_item       = array[ array.size() - 1 ]
last_item       = array.last
```

```ruby
strings = %w{ word4 word2 word1 word3 }
strings.sort
strings.delete( 'word1' )
strings.clear
```

```ruby
array1 = [ 1, 2, 3 ]
array2 = [ 4, 5 ]
array1.concat( array2 )
array2.pop
array2.empty?
```

**Note**: Set is not part of Core since it is in Standard Library.

```ruby
require 'set'
set = Set.new( [ 0, 1, 1, 0, 1, 0, 2, 0, 1, 2 ] )
subset = [ 0, 1].to_set
subset.subset? set
set.subset? subset
```

### 5.2.1 Operators

| Operator | Operation      |
|:--------:|:---------------|
| %        | Formatting     |
| #{ ... } | Interpolation  |
| +        | Concatenation  |
| *        | Copy n times   |
| <<       | Append         |
| %w       | Array of Words |

```ruby
array_of_words = %w{ this is a string as typed, without single or double quotes }
=> ["this", "is", "a", "string", "as", "typed,", "without", "single", "or", "double", "quotes"]
```

**Note**: the %w{ ... } operator strips all whitespace. Works just like string.split( ' ' ).

## 5.3. Hashes, Maps or Dictionaries

- Hashes ( sometimes known as associative arrays, maps, or dictionaries ) are similar to arrays in that they are indexed collection of object references;
- A Hash is an unordered collection of key-value pairs;
- The key, like the value part, in the pair can be of any type, but all keys must have the same type ( while values can be of any type );
- It's best practice to uses symbols for keys, instead of strings.

```ruby
hash = { :key1 => 1, :key2 => true, :key3 => 'value' }
hash = { key1: 1, key2: true, key3: 'value' }
hash = { 1 => 'value', 2 => true, 3 => 1.0 }
```

## 5.4. Ranges

```ruby
digits.include?( -1 )
digits.include?(  1 )
digits.min
digits.max
```

### 5.4.1 Operators

| Operator | Operation         |
|:--------:|:------------------|
| ..       | Creates inclusive |
| ...      | Creates exclusive |
| ===      | Case equality     |

```ruby
digits = 0 .. 5
digits === 3
digits === 7
```

### 5.4.2 Ranges as Sequences

Sequences have a start point, an end point, and a way to produce successive values in the sequence. They are created with ".." and "..." range operators.

```ruby
digits = 0 .. 9
digits = 0 ... 10

letters = 'a' .. 'z'
```

### 5.4.3 Ranges as Conditions

Ranges may also be used as conditional expressions.

```ruby
score = 75

grade = case score
  when  0 ..  19 then 'Grade F'
  when 20 ..  34 then 'Grade E'
  when 35 ..  49 then 'Grade D'
  when 50 ..  74 then 'Grade C'
  when 75 ..  89 then 'Grade B'
  when 90 .. 100 then 'Grade A'
  else                'Invalid Score!'
end
```

### 5.4.4 Ranges as Intervals

Ranges may also be used as interval test expressions.

```ruby
inclusion_message = if ( 'a' .. 'z' ) === 'l'
  'Is included'
else
  'Not included'
end
```
