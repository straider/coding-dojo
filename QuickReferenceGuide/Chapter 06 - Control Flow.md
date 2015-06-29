Quick Reference Guide
=====================

# 6. Control Flow Structures

> Decision making structures require that the programmer specify one or more conditions to be evaluated or tested by the program, along with a statement or statements to be executed if the condition is determined to be true, and optionally, other statements to be executed if the condition is determined to be false.

> In general, statements are executed sequentially: The first statement in a function is executed first, followed by the second, and so on. Programming languages provide various control structures that allow for more complicated execution paths. A loop statement executes a statement or group of statements multiple times.

## 6.1. If

```c
if [CONDITION_TRUE_1] {
  [STATEMENTS_BLOCK_WHEN_TRUE_1]
} else if [CONDITION_TRUE_2] {
  [STATEMENTS_BLOCK_WHEN_TRUE_2]
} else {
  [STATEMENTS_BLOCK_WHEN_OTHERWISE]
}
```

**Attention**: Go requires the curly braces and the **if** .. **else** keywords to be on the same line with the corresponding braces.

**Note**: there is no ternary operator in Go.

### 6.1.1. Statement Modifiers

### 6.1.2. Ternary Operator

### 6.1.3. Elvis Operator

## 6.2. Switch

```c
switch any expression of type T {
  case any expression of same type T : { 
    // code to be executed if this case expression is equal to the switch expression
  }
  case any expression of same type T : { 
    // code to be executed if this case expression is equal to the switch expression 
  }
  //any number of case statements are allowed
  default : { 
    // code to be executed if none of the case expressions match the switch expression
  }
}
```

```c
switch x.( type ) {
  case bool :
    fmt.Printf( "param #%d is a bool\n", i )
  case float64, float32 :
    fmt.Printf( "param #%d is a float\n", i )
  case int, int8, int16, int32, int64:
    fmt.Printf( "param #%d is an int\n", i )
  case uint, uint8, uint16, uint32, uint64 :
    fmt.Printf( "param #%d is an unsigned int\n", i )
  case nil:
    fmt.Printf( "param #%d is nil\n", i )
  case string:
    fmt.Printf( "param #%d is a string\n", i )
  default:
    fmt.Printf( "param #%d's type is unknown\n", i )
}
```

- The type of the evaluated value in the switch and the case must match;
- If there is no expression at all in the switch, then by default it is bool. The block that evaluates to true is executed, and none of the others are executed;
- If more than one case statements match, then the first in the lexical order is executed;
- Unlike certain other languages, each case block is independent and the code does not _fall through_ ( each of the case code blocks are like independent if-else code blocks );
- The use of curly braces for demarcating the code blocks is optional;
- Multiple expressions can be used, each separated by commas in the case statement;

In Go, the default behavior is not to fall through from one case block to the next. But it's possible to trigger that behavior, by using the **fallthrough** statement, which indicates that the case block following the current one has to be executed.

**Note**: there's a special keyword, **select**, that resembles a switch statement but it's used when the expression type for a case is a communication channel operation.

## 6.3. For

- The only loop keyword is **for**, which has a versatile syntax that allows it to replace other loop keywords usually found in mainstream languages, such as while;
- The **break** keyword terminates a loop at a point. Execution will continue at the statement following the end of the for loop block;
- The **continue** keyword skips the current iteration to the next iteration of the loop, skipping any remaining code.

**Note**: Both break and continue also accepts a label to jump to.

```c
// Like a C for
for [init]; [condition]; [post] { [block] }

// Like a C while
for [condition] { [block] }

// Loop forever, like C for( ; ; ) or C while( true )
for { [block] }

// Loop foreach, where i is index and x is the current array item.
for i, x := range [ ... ] { [block] }
```

**Note**: nested loops are allowed and break or continue without a label jump according to the loop where their located. With a label it's possible, for example, to break in a inner loop out of the outer loop.

```c
Label:
  for [init]; [condition]; [post] { 
    [block]
    for [init]; [condition]; [post] { 
      [block]
      break Label
    }
  }
```

## 6.4. While / Until

There are no **while** or **until** statements in Go.

## 6.5. Error Handling

### 6.5.1. Exceptions / Errors

### 6.5.2. Assertions

## 6.6. Goto

Goto jumps to a label which must be defined within the current function.

```c
  ...
  goto Label3
Label1:
  ...
Label2:
  ...
  goto Label1
Label3:
  ...
  goto Label2
```

**Note**: like with any other identifier the name of the label is case-sensitive.

> Use of goto statement is highly discouraged in any programming language because it makes difficult to trace the control flow of a program, making the program hard to understand and hard to modify. Any program that uses a goto can be rewritten so that it doesn't need the goto.
