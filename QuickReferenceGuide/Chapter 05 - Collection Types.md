Quick Reference Guide
=====================

# 5. Collection Types

## 5.1. Structs

### 5.1.1 Operators

## 5.2. Arrays, Lists and Sets

- Lists are the most versatile of Python's compound data types;
- A list contains items separated by commas and enclosed within square brackets "[]";
- To some extent, lists are similar to arrays in C. One difference between them is that all the items belonging to a list can be of different data type;
- The values stored in a list can be accessed using the slice operator "[ ]" and "[:]" with indexes starting at 0 in the beginning of the list and working their way to end -1.

### 5.2.1 Operators

| Operator | Operation      |
|:--------:|:---------------|
| +        | Concatenation  |
| *        | Copy n times   |

## 5.3. Maps / Dictionaries

- Python's dictionaries are kind of hash table type;
- They work like associative arrays or hashes found in Perl and consist of key-value pairs;
- A dictionary key can be almost any Python type, but are usually numbers or strings. Values, on the other hand, can be any arbitrary Python object;
- Dictionaries are enclosed by curly braces "{ }" and values can be assigned and accessed using square braces "[]".

> Dictionaries have no concept of order among elements. It is incorrect to say that the elements are "out of order"; they are simply unordered.

### 5.3.1 Operators

## 5.4. Ranges

### 5.4.1 Operators

## 5.5. Slices

### 5.5.1 Operators

## 5.6. Tuples

- A tuple is another sequence data type that is similar to the list;
- A tuple consists of a number of values separated by commas. Unlike lists, however, tuples are enclosed within parentheses;
- The main differences between lists and tuples are: Lists are enclosed in brackets "[ ]" and their elements and size can be changed, while tuples are enclosed in parentheses "( )" and cannot be updated. Tuples can be thought of as read-only lists.

### 5.6.1 Operators

## 5.7. Data Type Conversions

- ```list( value )```: converts a value to a list;
- ```set( value )```: converts a value to a set;
- ```dict( pairs )```: converts a value to a dictionary, where pairs is a sequence of key-value tuples;
- ```list( value )```: converts a value to a list;
- ```repr( value )```: converts a value to a regular expression;
- ```tuple( value )```: converts a value to a tuple.
