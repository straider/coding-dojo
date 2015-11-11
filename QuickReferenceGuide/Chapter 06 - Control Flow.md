Quick Reference Guide
=====================

# 6. Control Flow Structures

## 6.1. If

> The **if-then** statement is the simplest form of control statement, frequently used in decision making and changing the control flow of the program execution. Syntax for if-then statement is:

```pascal
if [CONDITION] then
  [STATEMENTS];
```

Where condition is a Boolean or relational condition and statements is a simple or compound statement.

> An **if-then** statement can be followed by an optional **else** statement, which executes when the Boolean expression is false. Syntax for the if-then-else statement is:

```pascal
if [CONDITION] then
  [STATEMENTS_IF_TRUE]
else 
  [STATEMENTS_ELSE_FALSE];
```

> The syntax of an **if-then-else if-then-else** statement in Pascal programming language is:

```pascal
if [CONDITION_1] then 
  [STATEMENTS_WHEN_1]
else if [CONDITION_2] then 
  [STATEMENTS_WHEN_2]
else if [CONDITION_3] then 
  [STATEMENTS_WHEN_3]
else 
  [STATEMENTS_WHEN_ELSE];
```

> It is always legal in Pascal programming to nest if-else statements, which means you can use one if or else if statement inside another if or else if statement(s). Pascal allows nesting to any level, however, if depends on Pascal implementation on a particular system. You can nest else if-then-else in the similar way as you have nested if-then statement. Please note that, the nested if-then-else constructs gives rise to some ambiguity as to which else statement pairs with which if statement. _The rule is that the else keyword matches the first if keyword ( searching backwards ) not already matched by an else keyword_.

The syntax for a nested if statement is as follows:

```pascal
if [CONDITION_OUTER] then
  if [CONDITION_INNER] then 
    [STATEMENTS_WHEN_INNER_TRUE]
  else
    [STATEMENTS_WHEN_INNER_FALSE];
else
  [STATEMENTS_ELSE_OUTER];
```

**Note**: Pascal assumes any non-zero and non-nil values as true, and if it is either zero or nil, then it is assumed as false value.

### 6.1.1. Statement Modifiers

There are no statement modifiers in Pascal for **if** statements.

### 6.1.2. Ternary Operator

### 6.1.3. Elvis Operator

## 6.2. Switch

> The syntax of the case statement is:

```pascal
case [EXPRESSION] of
  L1 : S1;
  L2 : S2;
  ...
  Ln : Sn;
else
  [STATEMENTS_ELSE]
end;
```

Where, L1, L2... are case labels or input values, which could be integers, characters, boolean or enumerated data items. S1, S2, ... are Pascal statements, each of these statements may have one or more than one case label associated with it.

> The expression is called the case selector or the case index. The case index may assume values that correspond to the case labels. The case statement must always have an end statement associated with it.

> The following rules apply to a case statement:
- The expression used in a case statement must have an integral or enumerated type or be of a class type in which the class has a single conversion function to an integral or enumerated type;
- You can have any number of case statements within a case. Each case is followed by the value to be compared to and a colon;
- The case label for a case must be the same data type as the expression in the case statement, and it must be a constant or a literal;
- The compiler will evaluate the case expression. If one of the case label's value matches the value of the expression, the statement that follows this label is executed. After that, the program continues after the final end;
- If none of the case label matches the expression value, the statement list after the else or otherwise keyword is executed. This can be an empty statement list. If no else part is present and no case constant matches the expression value, program flow continues after the final end;
- The case statements can be compound statements ( i.e., a **begin** ... **end** block ).

## 6.3. Loops

There are no statement modifiers in Pascal for any of the loop statements.

### 6.3.1. For

> A **for-do** loop is a repetition control structure that allows you to efficiently write a loop that needs to execute a specific number of times. The syntax for the for-do loop in Pascal is as follows:

```pascal
for [VARIABLE_NAME] := [INITIAL_VALUE] (down) to [FINAL_VALUE] do 
  [STATEMENTS];
```

Where, the VARIABLE_NAME specifies a variable of ordinal type, called control variable or index variable; INITIAL_VALUE and FINAL_VALUE values are values that the control variable can take; and statements is the body of the for-do loop that could be a simple statement or a group of statements.

> The syntax for a nested for-do loop statement in Pascal is as follows:

```pascal
for [OUTER_VARIABLE_NAME] := [OUTER_INITIAL_VALUE] (down) to [OUTER_FINAL_VALUE] do
  for [INNER_VARIABLE_NAME] := [INNER_INITIAL_VALUE] (down) to [INNER_FINAL_VALUE] do
  [STATEMENTS]
```

### 6.3.2. While / Until

> A **while-do** loop statement in Pascal allows repetitive computations till some test condition is satisfied. In other words, it repeatedly executes a target statement as long as a given condition is true. The syntax of a while-do loop is:

```pascal
while [CONDITION] do [STATEMENTS];
```

Where, condition is a Boolean or relational expression whose value would be true or false and statements is a simple statement or group of statements within **begin** ... **end** block.

> The syntax for a nested while-do loop statement in Pascal is as follows:

```pascal
while [CONDITION_OUTER] do
  while [CONDITION_INNER] do [STATEMENTS]
```

> Unlike for and while loops, which test the loop condition at the top of the loop, the **repeat-until** loop in Pascal checks its condition at the bottom of the loop. A repeat-until loop is similar to a while loop, except that is guaranteed to execute at least one time. The syntax of a repeat-until loop is:

```pascal
repeat
  [STATEMENTS]
until [CONDITION];
```

> The syntax for a nested repeat-until loop Pascal is as follows:

```pascal
repeat
  repeat
    [STATEMENTS]
  until [CONDITION_INNER];
until [CONDITION_OUTER];
```

### 6.3.3. Break

> The **break** statement in Pascal has the following two usages:
- When the break statement is encountered inside a loop, the loop is immediately terminated and program control resumes at the next statement following the loop;
- It can be used to terminate a case in the case statement;
- If you are using nested loops then the break statement will stop the execution of the innermost loop and start executing the next line of code after the block.

### 6.3.4. Continue

> The **continue** statement in Pascal works somewhat like the break statement. Instead of forcing termination, however, continue forces the next iteration of the loop to take place, skipping any code in between.

> For the for-do loop, continue statement causes the conditional test and increment portions of the loop to execute. For the while-do and repeat-until loops, continue statement causes the program control to pass to the conditional tests.

### 6.3.5. Goto

> A **goto** statement in Pascal provides an unconditional jump from the goto to a labeled statement in the same function.

> Use of goto statement is highly discouraged in any programming language because it makes difficult to trace the control flow of a program, making the program hard to understand and hard to modify. Any program that uses a goto can be rewritten so that it doesn't need the goto.

> The syntax for a goto statement in Pascal is as follows:

```pascal
...
[LABEL]:
  [STATEMENTS];
goto [LABEL];
...
```

Here, label must be an unsigned integer label, whose value can be from 1 to 9999.

## 6.5. Error Handling

### 6.5.1. Exceptions / Errors

### 6.5.2. Assertions
