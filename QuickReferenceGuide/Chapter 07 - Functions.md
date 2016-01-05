Quick Reference Guide
=====================

# 7. Functions

Shell functions provide a structure to split complex code logic into simpler and smaller units of code. These units of code allow for a high-decoupling with low-cohesion, which is a general and common programming best practice.

Every function will always return an error level number, which by convention should be 0 to signal success and non zero otherwise.

## 7.1. main()

## 7.2. Signature and Body

To define a function it's necessary to simultaneous provide its signature and its body. Other languages may allow the signature to be define beforehand and will only execute the logic in the body when called upon.

```bash
function_name() {
  STATEMENTS_BLOCK
}
```

**Note**: the name of the function must always be followed with parenthesis.

Just by looking at the signature one will not known if the function handles one or more arguments or even if it doesn't handle any argument. The arguments are handled much like the command-line arguments: from $1 to $9 and using the command ```shift```.

To remove a function from the scope one must use the command ```unset```:

```bash
unset -f function_name
```

## 7.3. Scope

A function definition is global to the script being executed by the shell interpreter. This means that any function defined at the top level or defined in a lower level _sourced_ script will be visible to the entire code.

## 7.4. Function Call

After defining a function the Shell interpreter will accept its name as it does for any valid command. So, to call the function named _function_name()_ one just needs to issue the command ```function_name```, without the parenthesis:

```bash
function greet() {
  echo "Hi"
}

xpto

function add() {
  operand1=$1
  operand2=$2
  echo $(( $1 + $2 ))
}

add 3 5
```

**Note*: a function that calls itself is considered a recursive function.

## 7.5. Variadic Functions

A variadic function is a function that can handle a variable number of arguments. Since the function signature does not force any fixed number of arguments then one can use variable-substitution or treat the entire set of arguments as an array.

```bash
function greet() {
  message="$1"
  name="${2:-World}"

  printf "${message}" "$name"
}

greet "Hello, %s!"
greet "Greetings, %s!" Earthling
```

## 7.6. Return Values

As mentioned before, each function returns an error level number. This return code should be used to evaluate if the function terminated successfully or not.

To force the function to return the execution to its caller one can issue the command ```return```. But bare in mind that one can also issue the command ```exit```, followed by the return code, but this will cause the termination of the program and not just the function.

In more advanced scenarios it may be useful to handle other values, such as string, from the execution of the function but to do this one has to resort to command-substitution:

```bash
function concatenate() {
  operand1=$1
  operand2=$2
  return_value="$1$2"
  echo ${return_value}
}

result=$( concatenate Prefix Suffix )
echo $result
```
