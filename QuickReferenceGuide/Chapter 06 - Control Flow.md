Quick Reference Guide
=====================

# 6. Control Flow Structures

## 6.1. If

```ruby
if [CONDITION_TRUE_1] then
  [STATEMENTS_BLOCK_WHEN_TRUE_1]
elsif [CONDITION_TRUE_2] then
  [STATEMENTS_BLOCK_WHEN_TRUE_2]
else
  [STATEMENTS_BLOCK_WHEN_OTHERWISE]
end
```

**Note**: the keywords and statement blocks ```elsif``` and ```else``` are optional.

**Note**: Ruby offers a Ternary Operator ``` variable = [CONDITION] ? [VALUE_IF_TRUE] : [VALUE_IF_FALSE]```

```ruby
unless [CONDITION_FALSE]
  [STATEMENTS_BLOCK_WHEN_FALSE]
else
  [STATEMENTS_BLOCK_WHEN_OTHERWISE]
end
```

### 6.1.1. Statement Modifiers

These two control flow structures, **if** and **unless**, can be used as suffix of other statements to enable or disable the execution of those statements.

```ruby
puts 'Something if true' if [CONDITION]
puts 'Something unless false' unless [CONDITION]
```

### 6.1.2. Ternary Operator

### 6.1.3. Elvis Operator

## 6.2. Switch

```ruby
case
  when [CONDITION_TRUE_1] then [STATEMENTS_BLOCK_WHEN_TRUE_1]
  when [CONDITION_TRUE_2] then [STATEMENTS_BLOCK_WHEN_TRUE_2]
  else [STATEMENTS_BLOCK_WHEN_OTHERWISE]
end
```

## 6.3. For

```ruby
for [VARIABLE] in [RANGE] do
  [STATEMENTS_BLOCK]
end

for i in 1 .. 10 do
  puts i
end
```

```ruby
for [VARIABLE_1, VARIABLE_2] in [ ARRAY_OF_ARRAY] do
  [STATEMENTS_BLOCK]
end

for i, j in [ [ 1, 2 ], [ 3, 4 ], [ 5, 6 ] ] do
  p [ i, j ]
end
```

- **break** terminates the most internal loop;
- **next** skips rest of iteration and jumps to the start of next iteration in the most internal loop;
- **redo** restarts the iteration, without checking most internal loop's condition.

### 6.3.1. times()

```ruby
5.times do | value |
  puts value
end
```

**Note**: ```times()``` will return the last iterated value, and always starts at 0.

### 6.3.2. upto()

```ruby
1.upto( 5 ) do | value |
  puts value
end
```

**Note**: ```upto()``` will return the start value.

### 6.3.3. downto()

```ruby
5.downto( 1 ) do | value |
  puts value
end
```

**Note**: ```downto()``` will return the start value.

### 6.3.4. step()

```ruby
( 1 .. 10 ).step( 2 ) do | value |
  puts value
end

1.step( 10, 2 ) do | value |
  puts value
end
```

**Note**: ```step()``` will return the range or the start value.

## 6.4. While / Until

```ruby
while [CONDITION_TRUE] do
  [STATEMENTS_BLOCK]
end
```

```ruby
until [CONDITION_FALSE] do
  [STATEMENTS_BLOCK]
end
```

### 6.4.1. Statement Modifiers

These two control flow structures, **while** and **until**, can be used as suffix of other statements.

## 6.5. Error Handling

### 6.5.1. Exceptions / Errors

> An exception is a special kind of object, an instance of the class **Exception** or a descendant of that class that represents some kind of exceptional condition; it indicates that something has gone wrong. When this occurs, an exception is raised ( or thrown ).

> By default, Ruby programs terminate when an exception occurs. But it is possible to declare exception handlers. An exception handler is a block of code that is executed if an exception occurs during the execution of some other block of code.

> Raising an exception means stopping normal execution of the program and transferring the flow-of-control to the exception handling code where you either deal with the problem that's been encountered or exit the program completely. Which of these happens - dealing with it or aborting the program - depends on whether you have provided a rescue clause ( rescue is a fundamental part of the Ruby language ). If you haven't provided such a clause, the program terminates; if you have, control flows to the rescue clause.

```ruby
begin
  ...
rescue [HighLevelException]
  ...
rescue [MidLevelException]
  ...
rescue [LowLevelException]
  ...
else
  ...
ensure
  ...
end
```

- The code between **begin** and **rescue** is protected against the exceptions being caught;
- A rescue clause with no parameter list defaults to catching **StandardError**;
- The code of **else** only executes, after the **begin**..**rescue** code, only if no exception was raised;
- The code of **ensure** always executes, after everything else;
- The **raise** keyword raises an Exception in the current code block. If no exception is passed as an argument it then raises a **RuntimeError** with the given message;
- The **retry** keyword causes the block of code where the caught exception was raised to execute again ( restart );
- Map the Exception object to a variable within the rescue clause to interrogate a rescued exception about its message and backtrace.

> The Exception class defines two methods that return details about the exception:

- The ```message()``` method returns a string that may provide human-readable details about what went wrong;
- The ```backtrace()``` method returns an array of strings that represent the call stack at the point that the exception was raised.

```ruby
begin
  raise 'A test exception.'
rescue Exception => e
  puts e.message
  puts e.backtrace.inspect
end
```

There is another mechanism to be used when things go has expected: the **throw** .. **catch**.

```ruby
throw [:symbol_label]
...
catch [:symbol_label]
...
end
```

It's possible to define application specific exceptions, by sub-classing one of the exceptions classes ( usually: **StandardError** ).

```ruby
class MyException < StandardError  
end

raise MyException, 'Program specific exception'
```

### 6.5.2. Assertions
