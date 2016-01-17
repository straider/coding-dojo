Quick Reference Guide
=====================

# 6. Control Flow Structures

## 6.1. If

If else statements are useful decision making statements which can be used to select an option from a given set of options.

```bash
if [ EXPRESSION ]; then
  TRUE_STATEMENTS_BLOCK
fi

if [ EXPRESSION ]; then
  TRUE_STATEMENTS_BLOCK
else
  FALSE_STATEMENTS_BLOCK
fi

if [ EXPRESSION_1 ]; then
  TRUE_1_STATEMENTS_BLOCK
elif [ EXPRESSION_2 ]
  TRUE_2_STATEMENTS_BLOCK
else
  FALSE_STATEMENTS_BLOCK
fi
```

### 6.1.1. Statement Modifiers

Although there are no statement modifiers there are control operators:

- **&&**: **and** operator that executes the command to the right if, and only if, the command to the left ended successfully ( return code was 0 );
- **||**: **or** operator that executes the command to the right if, and only if, the command to the left ended without success ( return code was not 0 ).

**Note**: instead of using control operators one should use ```set -e``` and normal control flow commands.

```bash
true && echo "OK"
false && echo "NOK"

true || echo "OK"
false || echo "NOK"
```

### 6.1.2. Ternary Operator

There's no shorthand statement for ternary operator, but one can resort to short-circuit boolean operations:

```bash
$( [[ EXPRESSION ]] && $( TRUE_STATEMENT ) || $( FALSE_STATEMENT ) )

variable=$( [[ EXPRESSION ]] && echo $( TRUE_STATEMENT ) || echo $( FALSE_STATEMENT ) )
```

### 6.1.3. Elvis Operator

N/A.

## 6.2. Switch

You can use multiple if...elif statements to perform a multiway branch. However, this is not always the best solution, especially when all of the branches depend on the value of a single variable.

Unix Shell supports case...esac statement which handles exactly this situation, and it does so more efficiently than repeated if...elif statements.

The basic syntax of the case...esac statement is to give an expression to evaluate and several different statements to execute based on the value of the expression.

The interpreter checks each case against the value of the expression until a match is found. If nothing matches, a default condition will be used.

```bash
case WORD in
  PATTERN_1 )
    PATTERN_1_STATEMENTS_BLOCK
    ;;
  PATTERN_2 )
    PATTERN_2_STATEMENTS_BLOCK
    ;;
  PATTERN_3 )
    PATTERN_3_STATEMENTS_BLOCK
    ;;
  * )
    DEFAULT_STATEMENTS_BLOCK
    ;;
esac
```

When statement(s) part executes, the command ;; indicates that program flow should jump to the end of the entire case statement.

## 6.3. For

The for loop operate on lists of items. It repeats a set of commands for every item in a list.

```bash
for item in WORD_1 WORD_2 ... WORD_N; do
  STATEMENTS_BLOCK
done
```

The foor loop can also work with sequences / ranges. There are 3 variants, where [FIRST] is the first number in the sequence / range and [LAST] is the last number in the sequence / range:

```bash
for (( i = [FIRST]; i <= [LAST]; i++ )); do
  STATEMENTS_BLOCK
done

for item in {[FIRST]..[LAST]}; do
  STATEMENTS_BLOCK
done

for item in $( seq [FIRST] [LAST] ); do
  STATEMENTS_BLOCK
done
```

All the loops support nesting concept which means you can put one loop inside another similar or different loops. This nesting can go upto unlimited number of times based on your requirement.

The ```break``` statement is used to terminate the execution of the entire loop, after completing the execution of all of the lines of code up to the break statement. It then steps down to the code following the end of the loop.
The break command can also be used to exit from a nested loop using this format ```break number```, where number specifies the nth enclosing loop to exit from.

The ```continue``` statement is similar to the break command, except that it causes the current iteration of the loop to exit, rather than the entire loop. This statement is useful when an error has occurred but you want to try to execute the next iteration of the loop. Like with the break statement, an integer argument can be given to the continue command to skip commands from nested loops.

## 6.4. While / Until

The while loop enables you to execute a set of commands repeatedly until some condition occurs. It is usually used when you need to manipulate the value of a variable repeatedly.

```bash
while EXPRESSION; do
  STATEMENTS_BLOCK
done
```

The while loop is perfect for a situation where you need to execute a set of commands while some condition is true. Sometimes you need to execute a set of commands until a condition is true.

```bash
until EXPRESSION; do
  STATEMENTS_BLOCK
done
```

All the loops support nesting concept which means you can put one loop inside another similar or different loops. This nesting can go upto unlimited number of times based on your requirement.

## 6.5. Error Handling

### 6.5.1. Exceptions / Errors

### 6.5.2. Assertions
