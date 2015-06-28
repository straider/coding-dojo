Quick Reference Guide
=====================

# 6. Control Flow Structures

## 6.1. If

- Conditional statements are compound statements consisting one or more clauses headed by the keywords if, elif, and else;
- Each if or elif clause is followed by a boolean expression and a colon ":";
- If the boolean expression for a clause is True, the body of that clause is executed;
- The body of a clause has to be indented and the indentation must be coherent.

```python
# One-way decision path
if [EXPRESSION] :
  [STATEMENT_IF_TRUE]
  ...
```

```python
# Two-way decision paths
if [EXPRESSION] :
  [STATEMENT_IF_TRUE]
  ...
else :
  [STATEMENT_OTHERWISE]
  ...
```

```python
# Multi-way decision paths
if [EXPRESSION] :
  [STATEMENT_IF_TRUE]
  ...
elif [EXPRESSION] :
  [STATEMENT_ELSE_IF_TRUE]
  ...
else :
  [STATEMENT_OTHERWISE]
  ...
```

> If the suite of an if clause consists only of a single line, it may go on the same line as the header statement.

```python
if True : print 'Hello, World!'
```

Nested ifs are allowed:

```python
if [EXPRESSION] :
  ...
  if [EXPRESSION] :
    [STATEMENT_ELSE_IF_TRUE]
    ...
  else :
    [STATEMENT_OTHERWISE]
    ...
  ...
else :
  [STATEMENT_OTHERWISE]
  ...
```

### 6.1.1. Statement Modifiers

Python does not allow if statement modifiers.

## 6.2. Switch

Multi-way decision paths coded with if..elif..else may be too cumbersome. When that happens it's time to use switch statement.

Usually switch statements have one downside when compared with if..elif..else statements: there can only be one variable and the case conditions must comply with variable's type. But usually there's also an upside: while if..elif..else only allows one of possible paths to be followed - and its code block to execute - the switch may allow several case block codes to be followed, which is known as case fall-through.

## 6.3. For

## 6.4. While, Until

### 6.1.1. Statement Modifiers

## 6.5. Error Handling

> Python provides two very important features to handle any unexpected error in programs and to add debugging capabilities in them:
- Exception Handling:
- Assertions:

## 6.5.1. Exceptions

> An exception is an event, which occurs during the execution of a program that disrupts the normal flow of the program's instructions. In general, when a Python script encounters a situation that it cannot cope with, it raises an exception. An exception is a Python object that represents an error. When a Python script raises an exception, it must either handle the exception immediately otherwise it terminates and quits.

```python
try :
  ...
except [ExceptionI] :
  ...
except [ExceptionII] :
  ...
except ( [ExceptionIII], [ExceptionIV], [ExceptionV] ) :
  ...
else :
  ...
finally :
  ...
```

> Here are few important points about the above-mentioned syntax:
- A single **try** statement can have multiple **except** statements. This is useful when the try block contains statements that may throw different types of exceptions;
- You can also provide a generic except clause, which handles any exception;
- After the except clause(s), you can include an **else** clause. The code in the else-block executes if the code in the try-block does not raise an exception;
- You can use a **finally** block along with a try-block. The finally-block is a place to put any code that must execute, whether the try-block raised an exception or not. 

> **Note**: The else-block is a good place for code that does not need the try block's protection.

> An exception can have an argument, which is a value that gives additional information about the problem. The contents of the argument vary by exception. You capture an exception's argument by supplying a variable in the except clause.

```python
try :
  ...
except [Exception], [Argument] :
  ...
except ( [ExceptionA], [ExceptionB], [ExceptionC] ), [Argument] :
  ...
```

> This variable receives the value of the exception mostly containing the cause of the exception. The variable can receive a single value or multiple values in the form of a tuple. This tuple usually contains the error string, the error number, and an error location.

> You can raise exceptions in several ways by using the **raise** statement. The general syntax for the raise statement is as follows.

```python
raise [Exception [, args [, traceback]]]
```

> Here, Exception is the type of exception and argument is a value for the exception argument. The argument is optional; if not supplied, the exception argument is None. The final argument, traceback, is also optional ( and rarely used in practice ), and, if present, is the traceback object used for the exception.

## 6.5.2. Assertions

> An assertion is a sanity-check that you can turn on or turn off when you are done with your testing of the program. The easiest way to think of an assertion is to liken it to a raise-if statement ( or to be more accurate, a raise-if-not statement ). An expression is tested, and if the result comes up false, an exception is raised. Assertions are carried out by the **assert** statement, the newest keyword to Python, introduced in version 1.5. Programmers often place assertions at the start of a function to check for valid input, and after a function call to check for valid output.

> When it encounters an assert statement, Python evaluates the accompanying expression, which is hopefully true. If the expression is false, Python raises an **AssertionError** exception. The syntax for assert is:

```python
assert Expression[, Arguments]
```

> If the assertion fails, Python uses **ArgumentExpression** as the argument for the AssertionError. AssertionError exceptions can be caught and handled like any other exception using the try-except statement, but if not handled, they will terminate the program and produce a traceback.
