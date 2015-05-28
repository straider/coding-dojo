Quick Reference Guide
=====================

# 7. Functions

Since everything in Ruby is an object it makes more sense to use the term **method** instead of **function**. A method is an unit of code that is declared once and called many times.

## 7.1. main()

There's no ```main()``` method in Ruby but there's a way to make sure that some code only executes if the script is the top level script:

```ruby
...
if __FILE__ = $0
  ...
end
```

## 7.2. Signature and Body

```ruby
def method_without_arguments()
  ...
end

def method_with_arguments( argument1, argument2 )
  ...
end

def method_with_argument_with_default_value( argument1, argument2 = 'default', argument 3 )
  ...
end
```

- Use **def** and **end** to declare a method;
- Parameters are simply a list of local variable names in parentheses;
- Parameters can have default values, by adding the assignment operator and its value to a parameter on the method declaration;
- "?", "!" and "=" are the characters allowed as method name suffixes:
  - "?": used to name methods that act as queries;
  - "!": used to name methods that are "dangerous" ( **bang** methods );
  - "=": used to name setter methods.
- **alias** creates a new name that refers to an existing method;
- **undef** cancels the method definition.

```ruby
def some_method( ... )
  ...
end

alias legacy_method some_method
```

**Attention**: methods have to be declared the statements that calls them.

## 7.3. Scope

## 7.4. Function Call

## 7.5. Variadic Functions

The asterisk "*" ( called the splat argument ) actually takes all arguments sent to the method and assigns them to an array.

```ruby
def method_with_variable_number_of_arguments( *arguments )
  ...
end

def method_with_variable_number_of_arguments( first, *tail )
  ...
end

def method_with_variable_number_of_arguments( *head, last )
  ...
end

def method_with_variable_number_of_arguments( first, *middle, last )
  ...
end
```

## 7.6. Return Values

- Every method returns the value on its last evaluated line;
- The **return** keyword, although optional, should be used when returning values other than the last one evaluated;
- It's possible to return multiple values, of different types, but in fact what happens is that an array containing those values is returned.
