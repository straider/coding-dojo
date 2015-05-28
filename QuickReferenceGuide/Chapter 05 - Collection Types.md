Quick Reference Guide
=====================

# 5. Collection Types

## 5.1. Structs

### 5.1.1 Operators

## 5.2. Arrays, Lists and Sets

> An array is a numbered sequence of elements of a single type with a fixed length.

> Go's arrays are values. An array variable denotes the entire array; it is not a pointer to the first array element ( as would be the case in C ). This means that when you assign or pass around an array value you will make a copy of its contents.

```c
var variable_name [SIZE] variable_type
```

```c
var balance = [ 5 ]float32 { 1000.0, 2.0, 3.4, 7.0, 50.0 }

var balance = []float32 { 1000.0, 2.0, 3.4, 7.0, 50.0 }
```

**Note**: All arrays have 0 as the index of their first element which is also called base index and last index of an array will be total size of the array minus 1.

It's also possible do declare multi-dimensional arrays.

```c
var variable_name [SIZE1][SIZE2]...[SIZEN] variable_type
```

## 5.3. Maps

### 5.3.1 Operators

## 5.4. Ranges

### 5.4.1 Operators

## 5.5. Slices

> A slice is a segment of an array. Like arrays slices are indexable and have a length. Unlike arrays this length is allowed to change.

```c
var scores []int 

scores := []int { 1, 4, 293, 4, 9 }

scores := make( []int, 10 )

scores := make( []int, 0, 10 )
```

> We use **make** instead of new because there’s more to creating a slice than just allocating the memory ( which is what new does ). Specifically, we have to allocate the memory for the underlying array and also initialize the slice.

### 5.5.1 Operators
