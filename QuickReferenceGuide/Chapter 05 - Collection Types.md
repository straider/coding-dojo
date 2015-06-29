Quick Reference Guide
=====================

# 5. Collection Types

## 5.1. Structs

> Structures are used to represent a record, which is a set of fields of different types. To define a structure, use **type** and **struct** keywords. The struct keyword defines a new data type, with more than one member, and the type keyword binds a name with the type, which is struct in this case.

```c
type [STRUCT_NAME] struct {
  [FIELD_1_NAME] [FIELD_1_TYPE]
  [FIELD_2_NAME] [FIELD_2_TYPE]
}
```

```c
type [STRUCT_NAME] struct {
  [FIELD_1_NAME], [FIELD_2_NAME], [FIELD_3_NAME] [FIELDS_TYPE]
}
```

**Note**: structs are the receiver type in functions, by value or by reference, and when a function has a receiver type it's usually called a method ( like in object oriented paradigm concept ).

> - Field values are initialized by default, if no value is given;
> - Field values can be initialized by declaring them within curly braces in the same order in which they appear, each one separated by commas;
> - Field values can also be initialized by declaring pairs, separated by commas, of field name and its value separated by a colon;


```c
type Book struct {
  title   string
  author  string
  id      int
}

b0 := Book {}
b1 := Book { "Title", "Author", 123 }
b2 := Book { title: "Title", id: 123, author: "Author" }
```

### 5.1.1. Operators

> To access any member of a structure use the member access operator ".". The member access operator is coded as a period between the structure variable name and the structure member that is to be accessed.

```c
type Book struct {
  title   string
  author  string
  id      int
}

var b Book
b.title  = "Baby Blues"
b.author = "Rick Kirkman and Jerry Scott"
b.id     = 123456
```

### 5.1.2. Visibility

Just like with other constructs in Go, if a struct type is named with first letter in uppercase then it's exported out of the package else is not exported. Same thing happens with struct's fields: if a field is named with first letter in uppercase then it's visible outside the package else it is not.

### 5.1.3. Anonymous Fields

> A struct can have anonymous fields. Any named type, or pointer to one, may be used in an anonymous field and it may appear at any location in the struct.

```c
type [STRUCT_NAME] struct {
                 [FIELD_1_TYPE]
  [FIELD_2_NAME] [FIELD_2_TYPE]
                 [FIELD_3_TYPE]
}
```

This is useful for composition of structs, since the top level struct will seem to have direct access to the low level fields of the anonymous struct. When a field name is in conflict between outer and inner struct than it's required to explicit name the field.

```c
type Engine struct {
  hp   int
  fuel string
}

type Car struct {
  manufacturer string
  model        string
  color        string
               Engine
}

car := Car { "BMW", "Series 3", "Red", Engine { 250, "Petrol" } }
car.color = "Yellow"
car.hp    = 375
```

```c
type Book struct {
  title   string
  author  string
  id      int
}

type CD struct {
  title   string
  author  string
  id      int
}

type Bundle struct {
  id int
     Book
     CD
}

bc := Bundle { 1, Book { "Title", "Author", 123 }, CD { "Title", "Author", 456 } }
bc.id      = 2
bc.Book.id = 2
bc.CD.id   = 2
bc.Book.author = "Author et al"
bc.CD.author   = "The Band"
```

## 5.2. Arrays, Lists and Sets

> An array is a numbered sequence of elements of a single type with a fixed length.

> Go's arrays are values. An array variable denotes the entire array; it is not a pointer to the first array element ( as would be the case in C ). This means that when you assign or pass around an array value you will make a copy of its contents.

```c
var variable_name [SIZE] [TYPE]
```

```c
var balance = [ 5 ] float32 { 1000.0, 2.0, 3.4, 7.0, 50.0 }
```

**Note**: All arrays have 0 as the index of their first element which is also called base index and last index of an array will be total size of the array minus 1.

It's also possible do declare multi-dimensional arrays.

```c
var variable_name [SIZE1][SIZE2]...[SIZEN] [TYPE]
```

### 5.2.1. Operators

- ```[ index ]```: accesses the item in the array given its index position;

```c
var balance = [ 5 ] float32 { 1000.0, 2.0, 3.4, 7.0, 50.0 }

fmt.Println( balance[ 0 ] )
balance[ 1 ] = balance[ 1 ] + 100
balance[ 1 ] += 100
```

- ```len( array )```: returns the number of items in the array.

```c
var balance = [ 5 ] float32 { 1000.0, 2.0, 3.4, 7.0, 50.0 }
fmt.Println( len( balance ) )
```

## 5.3. Maps

> A map is an unordered collection of key-value pairs. Also known as an associative array, a hash table or a dictionary, maps are used to look up a value by its associated key. The map type is represented by the keyword **map**, followed by the key type in brackets and finally the value type.

```c
var variable_name map [ [KEY_TYPE] ] [VALUE_TYPE]
```

```c
var currencies = map[ string ] string { "Portugal": "€", "England": "£", "United 
States": "$" }
```

### 5.3.1. Operators

- ```[ key ]```: accesses the value in the map given its key;

```c
var currencies = map[ string ] string { "Portugal": "€", "England": "£", "United 
States": "$" }

fmt.Println( currencies[ "Portugal" ] )
currencies[ "England" ] = "€"
```

- ```len( array )```: returns the number of items in the array;
- ```delete( map, key )```: removes the key-value pair from the map, given its key.

```c
var currencies = map[ string ] string { "Portugal": "€", "England": "£", "United States": "$" }

fmt.Println( len( currencies ) )
delete( currencies, "United States" )
fmt.Println( len( currencies ) )

_, exists := currencies[ "United States" ]
fmt.Println( "Map has key:", exists )
```

## 5.4. Ranges

> The range keyword is used in for loop to iterate over items of an array, slice, map or string. With array and slices, it returns the index of the item as integer. With maps, it returns the key of the next key-value pair.

```c
words := "Hello, World!"
for index, character := range words {
  fmt.Println( "Item in position", index, "has value", character )
}

array := [ 10 ] int { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 }
for index, item := range array {
  fmt.Println( "Item in position", index, "has value", item )
}

slice := [] string { "foo", "bar" }
for index, item := range slice {
  fmt.Println( "Item in position", index, "has value", item )
}

currencies := map[ string ] string { "Portugal": "€", "England": "£", "United States": "$" }
for key, value := range currencies {
  fmt.Println( "Key:", key, "Value:", value )
}
```

## 5.5. Slices

> A slice is a segment of an array. Like arrays slices are indexable and have a length. Unlike arrays this length is allowed to change. Slices are always associated with some array, and although they can never be longer than the array, they can be smaller or equal.

```c
var slice [] int 

slice = [] int { 1, 2, 3, 2, 1 }

slice = make( [] int, 10 )

slice = make( [] int, 0, 10 )
```

> We use **make** instead of new because there’s more to creating a slice than just allocating the memory ( which is what new does ). Specifically, we have to allocate the memory for the underlying array and also initialize the slice.

> Slicing does not copy the slice's data. It creates a new slice value that points to the original array. This makes slice operations as efficient as manipulating array indexes. Therefore, modifying the elements ( not the slice itself ) of a re-slice modifies the elements of the original slice.

> Note that the key can be an int, a float, complex number, string, pointer, even an interface that supports **equality**.

### 5.5.1. Operators

- ```[ low : high ]```: slices an array of slice from low index to high index, but not including high position;

```c
array  := [ 5 ] int { 100, 200, 300, 400, 500 }
slice1 := array[ 0 : 5 ]
slice2 := slice1[ 2 : 4 ]
slice3 := slice2[ : ]
slice4 := slice1[ 0 : ]
slice5 := slice1[ : len( array ) ]
```

- ```len( slice )```: returns the number of items in the slice;
- ```cap( slice )```: returns the capacity of the underlining array that holds the slice;

```c
var slice [] string

slice = [] string { "a", "e", "i", "o", "u" }
fmt.Println( len( slice ) )
fmt.Println( cap( slice ) )

slice = make( [] string, 10 )
fmt.Println( len( slice ) )
fmt.Println( cap( slice ) )

slice = make( [] string, 0, 10 )
fmt.Println( len( slice ) )
fmt.Println( cap( slice ) )
```

- ```append( slice, items )```: appends the items to the slice and returns the extended slice;

```c
var slice [] string

slice = [] string { "a", "e", "i", "o", "u" }
slice = append( slice, "0", "1", "2", "3", "4", "5", "6", "7", "8", "9" )
fmt.Println( slice )

slice = make( [] string, 10 )
slice = append( slice, "0", "1", "2", "3", "4", "5", "6", "7", "8", "9" )
fmt.Println( slice )

slice = make( [] string, 0, 10 )
slice = append( slice, "0", "1", "2", "3", "4", "5", "6", "7", "8", "9" )
fmt.Println( slice )
```

- ```copy( target_slice, source_slice )```: copies the items from the source slice to the target slice, up to the capacity of the target slice. Remaining items in the source slice are discarded and target slice is not extended;

```c
source := [] string { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9" }
target := make( [] string, 5 )
copy( target, source )
fmt.Println( source, target )
```
