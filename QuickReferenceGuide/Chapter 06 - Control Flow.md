Quick Reference Guide
=====================

# 6. Control Flow Structures

## 6.1. If

> Groovy supports the usual if - else syntax from Java. Groovy also supports the normal Java "nested" if then else if syntax.

```java
if ( ... ) {
    ...
} else if (...) {
    ...
} else {
    ...
}
```

### 6.1.1. Statement Modifiers

Groovy doesn't provide statement modifiers for **if**.

### 6.1.2. Ternary Operator

> The ternary operator is a shortcut expression that is equivalent to an if/else branch assigning some value to a variable.

### 6.1.3. Elvis Operator

> The "Elvis operator" is a shortening of the ternary operator. One instance of where this is handy is for returning a 'sensible default' value if an expression resolves to false or null.

```java
displayName = user.name ? user.name : 'Anonymous' # Ternary
displayName = user.name ?: 'Anonymous'            # Elvis
```

## 6.2. Switch

> The switch statement in Groovy is backwards compatible with Java code; so you can fall through cases sharing the same code for multiple matches. One difference though is that the Groovy switch statement can handle any kind of switch value and different kinds of matching can be performed. Switch supports the following kinds of comparisons:

- Collection case values match if the switch value is contained in the collection;
- Class case values match if the switch value is an instance of the class;
- Regular expression case values match if the toString() representation of the switch value matches the regex;
- Closure case values match if the calling the closure returns a result which is true according to the Groovy truth;
- If none of the above are used then the case value matches if the case value equals the switch value.

```java
switch ( x ) {
    case "foo" :
        result = "found foo"
        // lets fall through
    case "bar":
        result += "bar"
        // lets continue to fall through
    case [ 4, 5, 6, 'inList' ] :
        result = "list"
        break
    case 12..30 :
        result = "range"
        break
    case Number:
        result = "number"
        break
    case ~/fo*/: // toString() representation of x matches the pattern?
        result = "foo regex"
        break
    case { it < 0 } : // or { x < 0 }
        result = "negative"
        break
    default:
        result = "default"
}
```

> The **break** statement indicates the end of the set of statements for the **case** and signals that the **switch** statement has completed.

## 6.3. For

```java
for ( int i = 0; i < 5; i++ ) {
    println i
}
```

```java
for ( i in 0 ..< 5 ) {
    println i
}
```

```java
for ( i in [ 0, 1, 2, 3, 4 ] ) {
    println i
}
```

> The **break** statement is also used to exit out of a loop - even if there are more iterations possible. The **continue** statement will cause the next iteration of the loop - ignoring anything within the rest of the current iteration.

### 6.3.1. Labeled Statements

> Any statement can be associated with a label. Labels do not impact the semantics of the code and can be used to make the code easier to read. Despite not changing the semantics of the the labeled statement, it is possible to use labels in the break instruction as a target for jump.

> Labels are used when you have nested loops - a loop within a loop. Both break and continue can be given a label that directs the program to another nesting level.

## 6.4. While / Until

```java
def i = 0
while ( i < 5 ) {
    println i
}
```

> Unlike Java, Groovy does not have a do...while loop.

### 6.4.1. Statement Modifiers

Groovy doesn't provide statement modifiers for **while**.

## 6.5. Error Handling

### 6.5.1. Exceptions / Errors

> You can specify a complete try-catch-finally, a try-catch, or a try-finally set of blocks. Braces are required around each block's body.

```java
try {
    ...
} catch ( ... ) {
    ...
} finally {
    ...
}
```

> With the multi catch block ( since Groovy 2.0 ), we're able to define several exceptions to be catch and treated by the same catch block.

> The **throw** keyword is used to intentionally cause an exception.

### 6.5.2. Assertions

> Unlike Java with which Groovy shares the assert keyword, the latter in Groovy behaves very differently. First of all, an assertion in Groovy is always executed, independently of the -ea flag of the JVM. It makes this a first class choice for unit tests. The notion of "power asserts" is directly related to how the Groovy assert behaves. A power assertion is decomposed into 3 parts:

```java
assert [left expression] == [right expression] : (optional message)
```
