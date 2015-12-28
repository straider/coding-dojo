Quick Reference Guide
=====================

# 3. The Basics

## 3.1. Variables

Variables are references to values. A variable can be created, by assigning a value, and can be deleted. In essence is a mere pointer to the data itself. The value can be a number, a string, a file or any other type of data.

The variable doesn't have a type, therefor programming in Shell is said to be dynamically typed.

The name of variables can only contain letters, upppercase or lowercase, numbers and the underscore character "_".

> Unsetting or deleting a variable tells the shell to remove the variable from the list of variables that it tracks. Once you unset a variable, you would not be able to access stored value in the variable.

```bash
unset variable_name
```

There are 3 kinds of variables:

- **Local**: a local variable exists only in the scope of the current instance of the shell. It does not exist to other programs outside the of current script;
- **Environment**: an environment variable exists in the scope of the current instance and to any child processes of that instance;
- **Shell**: a shell variable is a special variable, set by the shell, that is necessary for the shell to function properly. The table below presents most of the shell variables that are useful to scripts:

| Variable | Description |
|----------|-------------|
| $0       | The absolute filename of the top level script. |
| $n       | 9 positional command line arguments, from $1 to $9, where each corresponds to an argument passed in the script invocation. |
| $#       | The count of command line arguments passed to the script. |
| $*       | A string with all arguments, separated by space. **Note**: all arguments are wrapped with double quotes. |
| $@       | A list with all arguments. **Note**: each argument is wrapped with double quotes. |
| $?       | The exit status of the last command executed. |
| $$       | The process id ( **pid** ) of the top level script. **Note**: every child process will have this same pid. |
| $!       | The process id of the last background command. |

> Exit status is a numerical value returned by every command upon its completion. As a rule, most commands return an exit status of 0 if they were successful, and 1 if they were unsuccessful.

### 3.1.1. Single Declaration

Variables are created automatically when a value is assigned.

```bash
variable_name=variable_value
```

A variable can point to a scalar value, that can hold only value at a time, or to a compound value ( a list of values ), that can hold multiple values.

If a variable is accessed before it has a value assigned to it then the value will fallback to an empty string, unless the option ```set -u``` is enabled. If it's enabled then an error will be raised.

The value of a variable is accessed by prefixing the variable name with the _sigil_ dollar sign, "$".

```bash
echo $variable_name

echo ${variable_name}
```

**Note**: variables have no type and the same variable can point to different types of data in the same script, at different times.

### 3.1.2. Multiple Declaration

```bash
var1=a var2=b var3=c
```

### 3.1.3. Type Inference
 
### 3.1.4. Type Conversion

### 3.1.5. Multiple Assignment
 
### 3.1.6. Function Type Variables

If a scalar variable holds the name of a function then it can be used to call that function. The ```eval``` statement can be used, to construct the command, execute it and evaluate the result.

```bash
function my_function() {
  echo "Executing MyFunction..."
  echo $(( RANDOM ))
}

my_variable=my_function
$my_variable

eval ${my_variable}
```

### 3.1.7. Scope

The scope of variables is always global to every block of code being executed. Programming is Shell is said to follow a dynamic scope way, instead of a lexical scope.

### 3.1.8. Variable Expansion

Variable substitution enables the shell programmer to manipulate the value of a variable based on its state.

Here is the following table for all the possible substitutions:

| Form            | Description |
|-----------------|-------------|
| ${var}          | Use the value pointed by variable var. |
| ${var:=word}    | If var is null or unset, var is set to word. |
| ${var:-word}    | If var is null or unset, word is substituted for value of var. The value of var does not change. |
| ${var:+word}    | If var unset, word is substituted for value of var. The value of var does not change. |
| ${var:?message} | If var is null or unset, message is printed to standard error. This checks that variables are set correctly. |
| ${!var}         | The value of var is expanded before the final variable value is used. |

## 3.2 Constants

There is no concept of constant. But with the ```readonly``` statement and some naming convention it's possible to work as if the shell handles constants. A variable marked as read-only can be assigned only once, before the ```readonly``` statement acts on it. Any variable marked this way cannot be unset.

### 3.2.1. Single Declaration

```bash
PI=3.14
readonly PI

PI=3.1416 # PI: readonly variable
unset PI  # unset: PI: cannot unset: readonly variable
```

### 3.2.2. Multiple Declaration

```bash
CONST1=a CONST2=b CONST3=c
readonly CONST1 CONST2 CONST3
```

### 3.2.3. Type Inference

## 3.3. Pointers

There is no pointer concept in Shell.

But a variable may hold the name of another variable that can be used as a reference.

```bash
var1=value
var2=var1

echo ${!var2}
```

## 3.4. Named Types
