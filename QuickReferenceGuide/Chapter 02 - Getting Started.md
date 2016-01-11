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

The interpreter reads commands from its input, which is usually given by the user on a command line session or from a file ( script ). Each line of input that is read is treated as a command: an instruction to be executed. Each line is split into words separated by whitespace. The first word is the name of the command to be executed and all remaining words are arguments to be passed to that command.

### 2.2.1. Types of Statements

- **Aliases** are word that are mapped to strings, usually a shorten version of a long statements. Aliases cannot be used within scripts;
- **Functions** are names that are mapped to a set of commands, usually a compound statement ( sequence of commands between curly braces: ```{ ... }```;
- **Builtins** are commands built into the interpreter;
- **Keywords** are like builtins, but special parsing rules apply to them;
- **Executables**, also known as external commands or applications, are programs that can be executed by referring to their absolute file path or simply by their name if their location are defined inside the PATH environment variable;
- **Pipelines** are a convenient way of "connecting" two commands by way of linking the first process' standard output to the second process' standard input.

**Note**: a compound statement is either a block of commands, between curly braces, or a list / sequence of commands separated by semi-colon.

### 2.2.2. HereDoc

HereDoc is an additional form of I/O redirection that provides a way to include content that will be given to the standard input of a command:

```bash
[COMMAND] <<[TOKEN]
  multi-line content
  to be used as standard input to the command above
[TOKEN]
```

[TOKEN] can be any string of characters and the token that closes the HereDoc must start at column 1 ( no identation ) and must also match the one that starts it. If the token is single quoted than no substituions are performed on the content. If its

**Note**: one can use ```<<``` or ```<<-``` to redirect the standard output. The difference between them is in the way that tab character is handled: the first doesn't ignore leading tabs while the second ignores leading tabs ( but not whitespace ).

### 2.2.3. HereString

HereString is like HereDoc, an additional form of I/O redirection, that is useful to pass strings as input to commands and does not require a token:

```bash
[COMMAND] <<<"
  multi-line content
  to be used as standard input to the command above
"
```

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

## 2.7. Interpreter Options

Its considered good practice to enable the options -e and -u on each program:

* **ErrorExit**: exits immediately if a pipeline, which may consist of a single simple command, a list, or a compound command returns a non-zero status;
* **DoNotAllowUnset**: treats unset variables and parameters other than the special parameters ‘@’ or ‘*’ as an error when performing parameter expansion.

```bash
#!/usr/bin/env sh

set -e
set -u

set -eu

set -o errexit # Same as set -e.
set -o nounset # Same as set -u.

shopt -s -o errexit nounset # Same as set -eu, but only in Bash.
```

It's also possible to disable shell options:

```bash
set +e
set +u

set +eu

set +o errexit # Same as set +e.
set +o nounset # Same as set +u.

shopt -u -o errexit nounset # Same as set +eu, but only in Bash.
```

**Note**: the command ```shopt``` only exists with Bash, not with Ksh or other Shell interpreters.
