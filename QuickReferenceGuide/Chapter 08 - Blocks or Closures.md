Quick Reference Guide
=====================

# 8. Blocks

Ruby term for **closures** is **blocks**. It's a way of creating methods without name, just like anonymous functions or lambdas in Python.

> Blocks are not objects, and this is one of the very few exceptions to the "everything is an object" rule in Ruby.

```ruby
block_name {
  ...
}

block_name do
  ...
end

block_name do | argument1, argument2 |
  ...
end
```

- Blocks are chunks of code that can be associated with method invocations, almost as if they were parameters;
- Any method can be called with a block as an implicit argument. Inside the method, one can call the block using the **yield** keyword with a value;
- Blocks can have their own arguments;
- A code block's return value ( like that of a method ) is the value of the last expression evaluated in the code block. This return value is made available inside the method: it comes through as the return value of yield;
- For each block there is a function with the same name that can be used to invoke the block.

> The code in the block is not executed at the time it is encountered. Instead, Ruby remembers the context in which the block appears ( the local variables, the current object, and so on ) and then enters the method.

**Note**: The method ```block_given?``` returns true if **yield** would execute a block in the current context.

When calling a block inside a method one can use the keyword **yield**, with or without arguments ( it depends if the block has "goal-keeper" variables or not ).

```ruby
def example_method
  i = 0
  puts 'First message...'
  i += 1
  yield i
  i += 1
  puts 'Second message...'
  yield i
  return i
end

example_method { | x | puts "Block called #{ x } time(s)" }
```

Another way is to define the last argument starting with "&" to refer to the block and then use method ```block.call()```, with or without arguments, to invoke the block.

```ruby
def example_method( i, &block )
  puts 'First message...'
  i += 1
  block.call( i )
  i += 1
  puts 'Second message...'
  block.call( i )
  return i
end

example_method( 0 ) { | x | puts "Block called #{ x } time(s)" }
```

There are two special blocks:
- BEGIN { ... }: the block of code inside will be executed before the main code of the program executes or before the source file is loaded;
- END { ... }: the block of code inside will be executed after the main code of the program, unless an exception was raised in the main code.

```ruby
puts "This is main Ruby Program"

BEGIN {
   puts "Initializing Ruby Program"
}

END {
   puts "Terminating Ruby Program"
}
```

**Note**: a program may have multiple BEGIN { ... } and END { ... } blocks. The BEGIN { ... } are executed in the order they are found; the END { ... } blocks are executed in reverse order.

```ruby
puts "This is main Ruby Program"

BEGIN {
   puts "First Initialization of Ruby Program"
}

BEGIN {
   puts "Second Initialization of Ruby Program"
}

END {
   puts "First Termination of Ruby Program"
}

END {
   puts "Second Termination of Ruby Program"
}
```

## 8.1. Lambdas

Since blocks are not objects it would be helpful to have a way of making them manageable as objects, like everything else in Ruby. To do that there's a keyword, **lambda**, that basically creates an anonymous method. This lambda methods are useful to be referenced by variables.

```ruby
divisible_by_n = lambda { | number, n | number % n == 0 }
divisible_by_n.call( 15, 5 )
divisible_by_n.call( 15, 2 )
```

Lambdas are useful because one cannot pass methods to a method neither can a method return another method. But one can pass blocks to methods and a method can return a block.

After Ruby 1.9 there are two ways to create the same lambda:

```ruby
divisible_by_n = lambda { | number, n | number % n == 0 }
divisible_by_n = -> ( number, n ) { number % n == 0 }
```

## 8.2. Procs

```ruby
divisible_by_n = Proc.new { | number, n | number % n == 0 }
divisible_by_n.call( 15, 5 )
divisible_by_n.call( 15, 2 )
```

Lambdas and **Procs** are similar: they both allow a block to be referenced by a variable, to be passed as the last argument to a method or to be returned by a method.

But there are some differences:
- Lambda checks that every argument is defined between _goal-poles_, if not then it raises an exception; A proc does not check and allows arguments to be used without being defined between _goal-poles_;
- When using **return** in the block then Lambda returns the value to the calling method; Proc returns from the method that called it.

```ruby
def check_by_proc
  number = 12
  divisible_by_n = Proc.new { | n | return number % n == 0 ? 'yes' : 'no' }
  result = divisible_by_n.call( number, 4 )
  puts 'Never goes here'
  result
end
puts check_by_proc

def check_by_lambda_raises_exception
  number = 12
  divisible_by_n = lambda { | n | return number % n == 0 ? 'yes' : 'no' }
  result = divisible_by_n.call( number, 4 ) # Causes an exception 'ArgumentError: wrong number of arguments (2 for 1)'
  puts 'Exception Raised'
  result
end
puts check_by_lambda_raises_exception

def check_by_lambda
  number = 12
  divisible_by_n = lambda { | number, n | return number % n == 0 ? 'yes' : 'no' }
  result = divisible_by_n.call( number, 4 )
  puts 'It goes through here'
  result
end
puts check_by_lambda
```

Procs can be created in one of two ways:

```ruby
divisible_by_n = Proc.new { | number, n | number % n == 0 }
divisible_by_n = proc     { | number, n | number % n == 0 }
```

## 8.3. List Comprehension
