Quick Reference Guide
=====================

# 7. Functions

A function is a block of organized, reusable code that is used to perform a single, related action. Functions provide better modularity and a high degree of code reusing. A function takes none, one or more inputs and produces a result, which can be returned to the function's caller or not.

## 7.1. main()

There's no ```main()``` method in Python but there's a way to make sure that some code only executes if the script is the top level script:

```python
...
if __name__ == '__main__' :
  ...
end
```

## 7.2. Signature and Body

- A function definition is a compound statement consisting of a header and a body;
- The header includes the keyword **def**, a sequence of parameters enclosed by parentheses, followed by a colon "**:**";
- The body consists of a sequence of statements, all indented in the same way;
- The keyword **pass** can be used in the body of a function to cause the function to do nothing. This can be useful when you know you will need a function, but are not quite sure how you want it to work;
- The first statement of a function can be an optional statement - the documentation string of the function or docstring.

```python
def method_without_arguments() :
  pass
```

```python
def method_with_arguments( argument1, argument2 ) :
  return argument1, argument2
```

```python
def method_with_argument_with_default_value( argument1, argument2 = 'default2', argument3 = 'default3' ) :
  return argument1, argument2, argument3
```

**Note**: the arguments with default values comes in last, in the method signature definition.

## 7.3. Scope

In regards to a function a variable can either be local or global. Local variables with the same identifier as global variables shadow the global variable value inside the function, therefor keeping the global value unchanged.

To reference a global variable inside a function it's required to declare it as global in the first statements of the function declaration.

```python
count = 0

def increment_counter() :
  global count
  count += 1

increment_counter()
print count
```

## 7.4. Function Call

> To evaluate a function call, replace the function's parameters in the body of the function by their associated values in the call and execute the body of the function;

> All parameters (arguments) in the Python language are passed by reference. It means if you change what a parameter refers to within a function, the change also reflects back in the calling function.

You can call a function by using the following types of formal arguments:

- **Required arguments**: required arguments are the arguments passed to a function in correct positional order. Here, the number of arguments in the function call should match exactly with the function definition;
- **Keyword arguments**: Keyword arguments are related to the function calls. When you use keyword arguments in a function call, the caller identifies the arguments by the parameter name. This allows you to skip arguments or place them out of order because the Python interpreter is able to use the keywords provided to match the values with parameters;
- **Default arguments**: A default argument is an argument that assumes a default value if a value is not provided in the function call for that argument;
- **Variable-length argument**: You may need to process a function for more arguments than you specified while defining the function. These arguments are called variable-length arguments and are not named in the function definition, unlike required and default arguments.

```python
method_without_arguments()
```

```python
method_with_arguments( 'value1', 'value2' )
method_with_arguments( argument1 = 'value1', argument2 = 'value2' )
method_with_arguments( argument2 = 'value2', argument1 = 'value1' )
```

```python
method_with_argument_with_default_value( 'value1', 'value2', 'value3' )
method_with_argument_with_default_value( 'value1' )
method_with_argument_with_default_value( argument1 = 'value1', argument2 = 'value2', argument3 = 'value3' )
```

## 7.5. Variadic Functions

It's possible to call a function with a variable number of arguments, but the variable-length argument placeholder must be the last one.

The asterisk "*" ( called the splat argument ) actually takes all arguments sent to the method and assigns them to an list.

```python
def method_with_variable_number_of_arguments( *arguments ) :
  return arguments

method_with_variable_number_of_arguments( 1, 2, 3 )                 # (1, 2, 3)
method_with_variable_number_of_arguments( 'a', 'e', 'i', 'o', 'u' ) # ('a', 'e', 'i', 'o', 'u')
```

```python
def method_with_first_and_tail( first, *tail ) :
  return first, tail

method_with_first_and_tail( 1, 2, 3 )                 # (1, (2, 3))
method_with_first_and_tail( 'a', 'e', 'i', 'o', 'u' ) # ('a', ('e', 'i', 'o', 'u'))
```

The double asterisk "**" actually takes all arguments sent to the method as a pair of key-values and assigns them to a dictionary.

```python
def method_with_variable_number_of_pairs( **arguments ) :
  return arguments

method_with_variable_number_of_pairs( key1 = 'value1', key2 = 'value2' ) # {'key2': 'value2', 'key1': 'value1'}
```

```python
def method_with_list_and_dictionary( *list, **dictionary ) :
  return list, dictionary

method_with_list_and_dictionary( 1, 2, 3, key1 = 'value1', key2 = 'value2' ) # ((1, 2, 3), {'key2': 'value2', 'key1': 'value1'})
```

## 7.6. Return Values

- Functions may return a value using the keyword **return** or have a side effect ( e.g., print );
- A return statement with no arguments is the same as ```return None```.
