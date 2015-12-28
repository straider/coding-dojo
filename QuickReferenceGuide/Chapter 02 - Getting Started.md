Quick Reference Guide
=====================

# 2. Getting Started

In essence, a shell script is an ordered list of commands to execute sequentially, by an Unix special command: the **shell interpreter**. These commands are usually the Unix commands that the user is allowed to execute. But the script can also have control structures, scalar and array variables and functions.

The first line of a script can be used to state which interpreter to use and is called the shebang line.

```bash
#!/usr/bin/env bash
```

**Note**: if a script has no shebang line then, by convention, the interpreter will execute the code as shell script. This becomes a problem only when the language used is another language, such as Perl or Python, instead of Shell.

## 2.1. Comments

```bash
# One-line comment
```

```bash
: <<END_OF_COMMENT
Multi-line
comment
that spans across
many lines
END_OF_COMMENT
```

**Note**: the colon statement is a pseudo-command that does nothing and as such it allows a DocHere string to be used as multi-line comment.

## 2.2. Statements

## 2.3. Keywords and Identifiers

## 2.4. Loading Sources

In order to load one script from another script one has to use the ```source``` statement ( or the shorthand notation: ```.``` ):

```bash
source properties.sh

. functions.sh
```

## 2.5. Console Input / Output

### 2.5.1. Console Output 101

The shell offers the ```echo``` statement to ask input to the user:

```bash
echo "Hello, World!"
```

Another statement, more powerful, is the ```printf``` statement, which allows for output formatting:

```bash
printf "%s is %02d years old\n" "José" 44
```

### 2.5.2. Console Input 101

The shell offers the ```read``` statement to ask input to the user:

```bash
echo "What's your name?"
read name
echo "Hello, $name!"

echo "How old are you?"
read age
echo "You're $age years old."
```

### 2.5.3. Command Line Arguments 101

The arguments passed to the program are positional arguments, from $1 to $9 ( $0 holds the current script name or function ). But this doesn't mean that it's limited to handle just 9 arguments. It's possible to handle many more arguments, by issuing the ```shift``` statement. This will cause the first argument to be lost and all other arguments shift one position to the left, which will allow the next argument to be at position 9.

```bash
while [ $# -gt 0 ]; do
  echo "Number of Arguments: $# - $1"
  shift
done
```

There are special variables to handle command line arguments:

| Variable | Description |
|----------|-------------|
| $#       | Holds the total number of arguments. |
| $*       | Holds all arguments as one argument separated by whitespace. |
| $@       | Holds all arguments as a list of string value. |

```bash
echo "Number of Arguments: $#"

echo 'Handling arguments with $*'
for argument in $*; do
  echo $argument
done

echo 'Handling arguments with $@'
for argument in $@; do
  echo $argument
done

echo 'Handling arguments with "$*"'
for argument in "$*"; do
  echo $argument
done

echo 'Handling arguments with "$@"'
for argument in "$@"; do
  echo $argument
done
```

**Note**: the difference between $* and $@ is visible when used inside double quotes.

## 2.6. UTF-8 Encoding
