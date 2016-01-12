Quick Reference Guide
=====================

# 5. Collection Types

## 5.1. Structs

N/A.

## 5.2. Arrays, Lists and Sets

Arrays are lists of values reference by a single name, variable. An array is a type that maps integers ( indexes ) to values ( often strings ). The size of an array is not fix and it can grow or shrink dinamically. An array may not have all positions assigned with a value and when this happens the array is called _sparse_. The indexes are non-negative integers, starting at zero.

## 5.2.1. Creating and Destroying

```bash
words=( one two three )
numbers=( 1 2 3 4 5 6 7 8 9 0 )
sparse=( [ 0 ]=first [ 1 ]=second [ 10 ]=last )

echo ${words[@]}
echo ${numbers[@]}
echo ${sparse[@]}

echo ${words[*]}
echo ${numbers[*]}
echo ${sparse[*]}

declare -a empty_array
echo ${empty_array[@]}
echo ${empty_array[*]}
```

> An indexed array is created automatically if any variable is assigned to using the syntax ```array_name[ index ]=value```. The index is treated as an arithmetic expression that must evaluate to a positive number. To explicitly declare an array, one can use the syntax ```declare -a array_name```, with or without index ( which is always ignored in this syntax ).

**Note**: For Ksh one should use the following syntax: ```set -A array_name item1 item2 ... itemN```.

```bash
unset words
echo ${words[@]}

unset numbers[*]
echo ${numbers[@]}

unset sparse[@]
echo ${sparse[@]}
```

## 5.2.2. Accessing an item

```
echo ${words[ 1 ]}
```

> If the index is ```@``` or ```*``` then the word expands to all members of the array name. These differ only when the word appears within double quotes:
- If the word is double-quoted then ```${array_name[*]}``` expands to a single word with the value of each array member separated by the first character of the IFS variable;
- If the word is double-quoted then ```${array_name[@]}``` expands each element of name to a separate word.

When there are no array members, ```${array_name[@]}``` or ```${array_name[*]}``` expands to nothing.

> Referencing an array variable without an index is equivalent to referencing with an index of 0. If the index used to reference an element of an indexed array evaluates to a number less than zero then it is interpreted as relative to one greater than the maximum index of the array, so negative indices count back from the end of the array, and an index of -1 refers to the last element.

```
echo ${words[ 1 ]}
```

## 5.2.3. Changing, Adding or Removing an item

```bash
numbers[ 0 ]=-1
numbers[ 4 ]=-5
echo ${numbers[@]}

numbers[ 10 ]=10
echo ${numbers[@]}

unset numbers[3]
echo ${numbers[@]}
```

**Note**: if the position given by the index does not exist then a new item is added to the array.

## 5.2.4. Iterating

```bash
for word in ${words[@]}; do
  echo $word
done

sum=0
for number in ${numbers[@]}; do
  sum=$(( $sum + $number ))
done
echo $sum
```

## 5.2.5. Size of an array

```bash
echo ${#words[@]}
echo ${#numbers[@]}
```

> The syntax ```${#name[ index ]}``` expands to the length of item at position given by index, unless index is ```@``` or ```*```, which expands to the number of items in the array.

## 5.2.6. Indexes of an array

```bash
echo ${!words[@]}
echo ${!words[*]}

echo ${!numbers[@]}
echo ${!numbers[*]}

echo ${!sparse[@]}
echo ${!sparse[*]}
```

## 5.3. Hashes, Maps or Dictionaries

### 5.3.1 Operators

## 5.4. Ranges

N/A.

## 5.5. Slices

N/A.

## 5.6. Tuples

N/A.

## 5.7. Regexp

### 5.7.1 Operators
