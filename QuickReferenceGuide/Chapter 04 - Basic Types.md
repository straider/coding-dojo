Quick Reference Guide
=====================

# 4. Basic Types

By default a variable has no restrictions on the type of values that it can reference. But with ```define``` statement one can restrict the type of values that a variable can handle.

## 4.1. Numbers

### 4.1.1. Integer

```bash
number=100
```

#### 4.1.1.1 Operators

| Operator | Operation      |
|:--------:|:---------------|
| +        | Addition       |
| -        | Subtraction    |
| *        | Multiplication |
| /        | Division       |
| %        | Modulus        |
| **       | Exponent       |

To perform arithmetic calculations it is necessary to use an arithmetic expression:

```bash
echo $(( $number + 1 ))
echo $(( $number * 5 ))
echo $(( $number - 3 ))
echo $(( $number / 2 ))
echo $(( $number % 2 ))
echo $(( $number ** 2 ))
```

**Note**: the legacy notation, ```expr value1 operation value2```, should not be used and the new form is the recommended way to perform arithmetic calculations. The operations multiply and exponent don't use the same operator.

### 4.1.2. Floats and Rationals

N/A.

### 4.1.3. Complexs

N/A.

## 4.2. Strings

Any sequence of valid characters is considered a string. A string can be defined between single quotes or double quotes. The difference between them is that single quotes limit substitution while double quoted allows the shell to perform substitutions.

### 4.2.1 Operators

| Form                  | Description |
|-----------------------|-------------|
| ${#var}               | Size of value hold by variable var. |
| ${var:index:length}   | Slices a string value hold by variable var, from index position and with size length. |
| ${var%pattern}        | Removes the shortest occurrence of pattern that matches the end of the value referenced by var. |
| ${var%%pattern}       | Removes the longest occurrence of pattern that matches the end of the value referenced by var. |
| ${var#pattern}        | Removes the shortest occurrence of pattern that matches the beginning of the value referenced by var. |
| ${var##pattern}       | Removes the longest occurrence of pattern that matches the beginning of the value referenced by var. |
| ${var/pattern/value}  | Replaces the first occurrence of pattern by value. |
| ${var//pattern/value} | Replaces all occurrences of pattern with value. |
| ${var/%pattern/value} | Replaces an occurrence of pattern with value if suffix of var matches pattern. |
| ${var/#pattern/value} | Replaces an occurrence of pattern with value if prefix of var matches pattern. |
| ${#var\^pattern}       | Converts the first lowercase letter that matches the pattern in value referenced by var to uppercase letters. |
| ${#var\^\^pattern}      | Converts all lowercase letters that matches the pattern in value referenced by var to uppercase letters. |
| ${#var,pattern}       | Converts first uppercase letters that matches the pattern in value referenced by var to lowercase letters. |
| ${#var,,pattern}      | Converts all uppercaee letters that matches the pattern in value referenced by var to lowercase letters. |

```bash
var="Hello, World!"

echo "Length: ${#var}"
echo "Slice: ${var:7:5}"
echo "Replace First: ${var/l/L}"
echo "Replace All: ${var//l/L}"
```

```bash
pair="key:value"

echo "Key: ${pair%:*}"
echo "Key: ${pair%%:*}"
echo "Value: ${pair#*:}"
echo "Value: ${pair##*:}"

pair="key1:value1 key2:value2"

echo "Key: ${pair%:*}"
echo "Without Value: ${pair%:value*}"
echo "Key: ${pair%%:*}"
echo "Without Value: ${pair%%:value*}"
echo "Value: ${pair#*:}"
echo "Value by Key: ${pair#key*:}"
echo "Value: ${pair##*:}"
echo "Value by Key: ${pair##key*:}"
```

```bash
original="aeiou12345678900987654321uoiea-aeiou12345678900987654321uoiea"

echo "Replace if Suffix Match: ${original/%00/--}"
echo "Replace if Prefix Match: ${original/%00*/}"
echo "Replace if Suffix Match: ${original/%uoiea/UOIEA}"
echo "Replace if Prefix Match: ${original/#00/--}"
echo "Replace if Prefix Match: ${original/#*00/}"
echo "Replace if Prefix Match: ${original/#aeiou/AEIOU}"
```

```bash
original=aeiouBCDFGHJKLMNPQRSTVWXYZ

echo "Convert first letter to uppercase: ${original^*}"
echo "Convert all letters to uppercase: ${original^^*}"
echo "Convert first letter to lowercase: ${original,*}"
echo "Convert all letters to lowercase: ${original,,*}"

lowercase=‚ÈÌıu
uppercase=¬…Õ’U

echo "Convert first letter to uppercase: ${lowercase^*}"
echo "Convert all letters to uppercase: ${lowercase^^*}"
echo "Convert first letter to lowercase: ${uppercase,*}"
echo "Convert all letters to lowercase: ${uppercase,,*}"
```

## 4.3. Booleans

### 4.3.1. Operators

| Operator | Operation      |
|:--------:|:---------------|
| -eq      | Returns true if numeric operands are equal. |
| -ne      | Returns true if numeric operands are not equal. |
| -gt      | Returns true if left operand is greater than right operand. |
| -ge      | Returns true if left operand is greater or equal to the right operand. |
| -lt      | Returns true if left operand is less than right operand. |
| -le      | Returns true if left operand is less or equal to the right operand. |

| Operator | Operation      |
|:--------:|:---------------|
| ==       | Returns true if string operands are equal.       |
| !=       | Returns true if string operands are not equal.   |
| -z       | Returns true if the string operand is empty.     |
| -n       | Returns true if the string operand is not empty. |

| Operator | Operation      |
|:--------:|:---------------|
| !        | Logical negation of boolean operand. |
| -o       | Logical **or** operation: if any of the operands is true then it's true else it's false. |
| -a       | Logical **and** operation: if any of the operands is false then it's false else it's true. |

| Operator | Operation      |
|:--------:|:---------------|
| -d       | Returns true if the file operand is a folder.      |
| -f       | Returns true if the file operand is a file.        |
| -e       | Returns true if the file or folder operand exists. |
| -s       | Returns true if the file operand is not empty.     |

**Note**: there are many more file operators.

### 4.3.2. Short-Circuiting

## 4.4. Basic Type Conversions
