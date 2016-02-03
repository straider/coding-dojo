Quick Reference Guide
=====================

# 5. Collection Types

## 5.1. Structs

N/A.

## 5.2. Arrays, Lists and Sets

> An array is a variable that stores an ordered list of scalar values. Array variables are preceded by an "at" ```@``` sign. To refer to a single element of an array, one uses the dollar sign ```$``` with the variable name followed by the index of the element in square brackets.

```perl
my @numbers = ( 1, 2, 3, 4, 5 );
my @words   = ( 'word 1', 'word 2', 'word 3' );
my @phrase  = qw/ This is a sentence, without using quotes of any kind. /;
my @days    = qw/
  Sunday
  Monday
  Tuesday
  Wednesday
  Thursday
  Friday
  Saturday
/;

print "@numbers\n";
print "@words\n";
print "@phrase\n";
print "@days\n";

print "\$numbers[ 0 ] = $numbers[ 0 ]\n";
print "\$words[ 1 ] = $words[ 1 ]\n";
print "\$phrase[ -1 ] = $phrase[ -1 ]\n";
print "\$days[ -2 ] = $days[ -2 ]\n";
```

> **Note**: A list is not a variable. A list is an ephemeral value which can be assigned to an array or a hash variable. This is why the syntax for declaring array and hash variables is identical. There are many situations where the terms "list" and "array" can be used interchangeably, but there are equally many where lists and arrays display subtly different and extremely confusing behaviour. List values cannot be nested. Perl assumes that it is neither an inner array or an inner hash and flattens the list out into a single long list.

### 5.2.1. Operators

| Operator | Operation |
|:--------:|:----------|
| [index]  | Item at position given by index, when the array variable is prefixed with sigil ```$```. |
| [slices] | Slices items of an array, when the array variable is prefixed with sigil ```@```. |
| scalar   | The size of an array. **Note**: it's the physical size and not the number of items. |
| $#       | Maximum index allowed. |

```perl
my @sparse;
$sparse[ 1 ] = 1;
$sparse[ 3 ] = 'word';
$sparse[ 5 ] = 1.5;
$sparse[ 7 ] = 'z';

print "@sparse\n";
print "\@sparse has ", scalar @sparse, " items\n";
print "\@sparse maximum index = ", $#sparse, "\n";

my @slice;
@slice = @sparse[ 0 .. 7 ];
print "@slice\n";
@slice = @sparse[ 3 .. 5 ];
print "@slice\n";
@slice = @sparse[ 1, 2, 4, 6 ];
print "@slice\n";
```

**Note**: The specification for a slice must have a list of valid indexes, either positive or negative, each separated by a comma. For speed, one can also use the ```..``` range operator.

### 5.2.2. Functions

| Function | Operation |
|:--------:|:----------|
| push     | Pushes the values of the list onto the end of the array. |
| pop      | Pops off and returns the last value of the array. |
| unshift  | Pushes the values of the list onto the begin of the array. |
| shift    | Pops off and returns the first value of the array. |
| sort     | Sorts the LIST and returns the sorted array value. |
| reverse  | Reverses the LIST and returns the reversed array value. |
| splice   | Remove the elements of an array designated by OFFSET and LENGTH, and replaces them with LIST, if specified. Finally, it returns the elements removed from the array. |
| split    | Splits a string into an array of strings, and returns it. If LIMIT is specified, splits into at most that number of fields. If PATTERN is omitted, splits on whitespace. |
| join     | Joins the separate strings of LIST into a single string with fields separated by the value of EXPR, and returns the string. |
| grep     | Looks through an array or list and returns the number of times the regular expression is found in the elements, in scalar context. Looks through an array or list and returns the elements matching the regular expression, in array context. |
| map     | It takes a list as an argument and performs a user-defined operation on each element in turn. Then it returns the list consisting of the modified values. |

```perl
my @stack = qw/ first second third /;
print "@stack\n";

push( @stack, 'last' );
print "@stack\n";

pop( @stack );
print "@stack\n";

unshift( @stack, 'top' );
print "@stack\n";

shift( @stack );
print "@stack\n";
```

```perl
my @scrambled = ( 'e', 'u', 'a', 'i', 'o', '4', '3', '2', '1', '5' );
my @sorted    = sort( @scrambled );
my @reversed  = reverse( @sorted );
print "@sorted\n";
print "@reversed\n";

my @letters = ( 'a' .. 'z' );
splice( @letters, 5, 10, 0 .. 9 );
print "@letters\n";

my $line   = '0|2016-01-01 00:00:00|Warning message...|';
my @record = split( '\|', $line ); # Must escape the pipe character, even when single quoted.
my $items  = join( ';', @record );
print "@record\n";
print "$items\n";
```

```perl
my @array1 = ( 1, 2, 3 );
my @array2 = ( 3, 4, 5 );
my @merged = ( @array1, @array2 );
print "@merged\n";

my @list = ( 1, ( 2, 3 ), ( 3, ( 4, 5 ) ) );
print "@list\n";

my $count    = grep( /3/, @list );
my @elements = grep( /3/, @list );
print $count, "\n";
print @elements, "\n";

my $sum = 0;
map( { $sum += $_ } @list );
print $sum, "\n";
```

**Note**: Perl has a special variable, which is written as ```$[```. This special variable is a scalar containing the first index of all arrays. Because Perl arrays have zero-based indexing, ```$[``` will almost always be 0. But if ```$[``` is set to 1 then all the arrays will use one-based indexing. It is recommended not to use any other indexing other than zero.

## 5.3. Hashes, Maps or Dictionaries

> A hash is a set of key/value pairs. Hash variables are preceded by a percent ```%``` sign. To refer to a single element of a hash, one uses the hash variable name followed by the "key" associated with the value in curly brackets. Hashes are created in one of the two following ways:

- The first way is to assign a value to a named key on a one-by-one basis;
- The second way uses a list, which is converted by taking individual pairs from the list: the first element of the pair is used as the key, and the second, as the value.

**Note**: one can use ```=>``` as an alias for ```,``` to indicate the key/value pairs. Another variant of the this form is to preceed the keys with an hyphen ```-``` and no quotation is required around them.

```perl
my %scores;
$scores{ 'Player1' } = 5;
$scores{ 'Player2' } = 7;

print "\$scores{ 'Player1' } = $scores{ 'Player1' }\n";
print "\$scores{ 'Player2' } = $scores{ 'Player2' }\n";

my %capitals = ( 'PT', 'Lisbon', 'UK', 'London' );
$capitals{ 'FR' } = 'Paris';

print "\$capitals{ 'PT' } = $capitals{ 'PT' }\n";
print "\$capitals{ 'FR' } = $capitals{ 'FR' }\n";

my %employees = ( 'Joe' => 44, 'John' => 36 );
$employees{ 'Carl' } = 55;

print "\$employees{ 'John' } = $employees{ 'John' }\n";
print "\$employees{ 'Carl' } = $employees{ 'Carl' }\n";

my %currencies = ( -pt => '€', -us => '$' );
$currencies{ -uk } = '£';

print "\$currencies{ -pt } = $currencies{ -pt }\n";
print "\$currencies{ -uk } = $currencies{ -uk }\n";
```

### 5.3.1. Operators

| Operator | Operation         |
|:--------:|:------------------|
| { key }  | Value given by its key, when the hash variable is prefixed with sigil $. |
| scalar   | Returns the number of elements from a hash by using the scalar context on either keys or values. |

```perl
print "There are ", scalar keys @employees, " employees.\n";
```

### 5.3.2. Functions

| Function | Operation         |
|:--------:|:------------------|
| keys     | Returns a list of all of the keys from a hash. |
| values   | Returns a list of all of the values from a hash. |
| exists   | Checks if a given key exists in the list of keys of an hash. |
| delete   | Removes an element from the hash, given its key. |


```perl
print "Keys: ", keys %currencies, "\n";
print "Values: ", values %capitals, "\n";

print "\$employees{ 'John' } exists? ", exists( $employees{ 'John' } ), "\n";
print "\$employees{ 'Doe' } exists? ", exists( $employees{ 'Doe' } ), "\n";

delete( $capitals{ 'FR' } );
print "Countries: ", keys %capitals, "\n";
```

## 5.4. Ranges

> Perl offers a shortcut for sequential numbers and letters, similar to an array but using then double dot ```..``` between lower and upper limits, also known as then range operator.

```perl
my @letters = ( a .. z );
my @range   = ( 1 .. 9 );

print "@letters\n";
print "@range\n";
```

### 5.4.1 Operators

### 5.4.2 Ranges as Sequences

### 5.4.3 Ranges as Conditions

### 5.4.4 Ranges as Intervals

## 5.5. Slices

## 5.6. Tuples

N/A.

## 5.7. Regexp

### 5.7.1 Operators
