Quick Reference Guide
=====================

# 6. Control Flow Structures

## 6.1. Decision Statements

### 6.1.1. If / Unless

> An if statement consists of a boolean expression followed by one or more statements. An if statement can be followed by an optional else statement. An if statement can be followed by an optional elsif statement and then by an optional else statement.

> **Note**: Once an elsif succeeds, none of the remaining elsif's or else's will be tested.

```perl
if ( [BOOLEAN_EXPRESSION] ) {
  ... # Block of statements, if true
}

if ( [BOOLEAN_EXPRESSION] ) {
  ... # Block of statements, if true
} else {
  ... # Block of statements, if false
}

if ( [BOOLEAN_EXPRESSION_1] ) {
  ... # Block of statements, if true 1
} elsif ( [BOOLEAN_EXPRESSION_2] ) {
  ... # Block of statements, if true 2
} else {
  ... # Block of statements, if false
}
```

> An unless statement consists of a boolean expression followed by one or more statements. An unless statement can be followed by an optional else statement. An unless statement can be followed by an optional elsif statement and then by an optional else statement.

> **Note**: Once an elsif succeeds, none of the remaining elsif's or else's will be tested.

```perl
unless ( [BOOLEAN_EXPRESSION] ) {
  ... # Block of statements, if false
}

unless ( [BOOLEAN_EXPRESSION] ) {
  ... # Block of statements, if false
} else {
  ... # Block of statements, if true
}

unless ( [BOOLEAN_EXPRESSION] ) {
  ... # Block of statements, if false
} elsif ( [BOOLEAN_EXPRESSION_1] ) {
  ... # Block of statements, if true 1
} elsif ( [BOOLEAN_EXPRESSION_2] ) {
  ... # Block of statements, if true 2
} else {
  ... # Block of statements, otherwise
}
```

#### 6.1.1.1. Ternary Operator

```perl
my $variable = [BOOLEAN_EXPRESSION] ? [VALUE_IF_TRUE] : [VALUE_IF_FALSE];
```

#### 6.1.1.2. Elvis Operator

> The null coalescing operator, alsknown as Logical Defined-Or operator in Perl, is a binary operator and thus evaluates its operands at most once. In Perl (starting with version 5.10), the operator is ```//```

```perl
my $undefined;
my $defined = $undefined // 'Was undefined';
print $define, "\n";

my $default;
$default //= 'Default';
print $default, "\n";
```

### 6.1.2. Switch / Given

> A switch statement allows a variable to be tested for equality against a list of values. Each value is called a case, and the variable being switched on is checked for each switch case.

> **Note**: a switch case implementation is dependent on Switch module and Switch module has been implemented using Filter::Util::Call and Text::Balanced and requires both these modules to be installed.

```perl
use Switch;
use feature "switch";
use 5.14;

switch ( [SCALAR_ARGUMENT] ) {
  case [SCALAR_VALUE] {
    ... # Block of statements when is a match
  }
  else {
    ... # Block of statements when no match found
  }
}
```

> If a case block executes an untargeted **next**, control is immediately transferred to the statement after the case statement (i.e., usually another case), rather than out of the surrounding switch block. Not every case needs to contain a next. If no next appears, the flow of control will not fall through subsequent cases.

> Under the "switch" feature, Perl gains the experimental keywords ```given```, ```when```, ```default```, ```continue```, and ```break```.

```perl
use v5.10.1;
for ( $var ) {
  when ( /^abc/ ) { $option = 1 }
  when ( /^def/ ) { $option = 2 }
  when ( /^xyz/ ) { $option = 3 }
  default         { $option = 0 }
}

use v5.10.1;
given ( $var ) {
  when ( /^abc/ ) { $option = 1 }
  when ( /^def/ ) { $option = 2 }
  when ( /^xyz/ ) { $option = 3 }
  default         { $option = 0 }
}
```

> **Note**: The foreach is the non-experimental way to set a topicalizer.

```perl
use v5.14;
for ( $var ) {
  $option = 1 when ( /^abc/ );
  $option = 2 when ( /^def/ );
  $option = 3 when ( /^xyz/ );
  default { $option = 0 }
}

use v5.14;
given ( $var ) {
  $option = 1 when ( /^abc/ );
  $option = 2 when ( /^def/ );
  $option = 3 when ( /^xyz/ );
  default { $option = 0 }
}
```

> The arguments to ```given``` and ```when``` are in scalar context, and ```given``` assigns the ```$_``` variable as its topic value. Due to an unfortunate bug in how ```given``` was implemented between Perl 5.10 and 5.16, under those implementations the version of ```$_``` governed by ```given``` is merely a lexically scoped copy of the original, not a dynamically scoped alias to the original, as it would be if it were a ```foreach```. This bug was fixed in Perl 5.18 but note that my ```$_``` is now deprecated and will warn unless warnings have been disabled.

### 6.1.3. Statement Modifiers

> Any simple statement may optionally be followed by an ```if```, ```unless``` or ```when``` modifier, just before the terminating semicolon (or block ending).

### 6.1.4. Goto

Perl does support a goto statement. There are three forms:

- ```goto``` [LABEL]: jumps to the statement labeled with [LABEL] and resumes execution from there;
- ```goto``` [EXPRESSION]: is just a generalization of ```goto``` [LABEL]. It expects the expression to return a label name and then jumps to that labeled statement;
- ```goto``` [&NAME]: it substitutes a call to the named subroutine for the currently running subroutine.

## 6.2. Loop Statements

### 6.2.1. For / Foreach

> The ```for``` loop executes a sequence of statements multiple times and abbreviates the code that manages the loop variable. The ```foreach``` loop iterates over a normal list value and sets the iterated variable to be each element of the list in turn.

```perl
for ( [INITIALIZE_STEP]; [STOP_CONDITION_STEP]; [INCREMENT_OR_DECREMENT_STEP] ) {
  ... # Block of statements to repeat
}
```

- The initialize step is executed first, and only once. This step allows one to declare and initialize any loop control variables. It is not required, as long as a semicolon appears;
- Next, the condition step evaluates: if it is true, the body of the loop is executed; if it is false, the body of the loop does not execute and flow of control jumps to the next statement just after the for loop;
- After the body of the for loop executes, the flow of control jumps back up to the increment or decrement step. This statement allows one to update any loop control variables. This statement can be left blank, as long as a semicolon appears after the condition.

```perl
foreach [VARIABLE] ( [@LIST] ) {
  ... # Block of statements to repeat
}
```

### 6.2.2. While / Until

> The ```while``` loop repeats a statement or group of statements while a given condition is true. It tests the condition before executing the loop body. The ```until``` loop repeats a statement or group of statements until a given condition becomes false. It tests the condition before executing the loop body. The ```do .. while``` loop is like a ```while``` loop, except that it tests the condition at the end of the loop body.

```perl
while ( [CONDITION] ) {
  ... # Block of statements to repeat
}
```

```perl
until ( [CONDITION] ) {
  ... # Block of statements to repeat
}
```

**Note**: the key point of the ```while``` or ```until``` loops is that the loop might not ever run.

```perl
do {
  ... # Block of statements to repeat
} while ( [CONDITION] );

```

**Note**: the key point of the ```do .. while``` loop is that the loop runs at least once.

### 6.2.3. Statement Modifiers

> Any simple statement may optionally be followed by a ```for```, ```foreach```, ```while``` or ```until``` modifier, just before the terminating semicolon (or block ending).

### 6.2.4. Loop Control Statements

> Loop control statements change the execution from its normal sequence. When execution leaves a scope, all automatic objects that were created in that scope are destroyed.

- The ```next``` statement starts the next iteration of the loop. One can provide a [LABEL] with ```next``` statement where [LABEL] is the label ```for``` a loop. A ```next``` statement can be used inside a nested loop where it will be applicable to the nearest loop if a [LABEL] is not specified. If there is a ```continue``` block on the loop, it is always executed just before the condition is about to be evaluated;
- The ```redo``` statement restarts the loop block without evaluating the conditional again. One can provide a [LABEL] with ```redo``` statement where [LABEL] is the label for a loop. A ```redo``` statement can be used inside a nested loop where it will be applicable to the nearest loop if a [LABEL] is not specified. If there is any ```continue``` block on the loop, then it will not be executed before evaluating the condition;
- When a ```last``` statement is found inside a loop, the loop is immediately terminated and the program control resumes at the statement following the loop. You can provide a [LABEL] with ```last``` statement where [LABEL] is the label for a loop. A ```last``` statement can be used inside a nested loop where it will be applicable to the nearest loop if a [LABEL] is not specified. If there is any ```continue``` block on the loop, then it is not executed;
- A ```continue``` block, is always executed just before the conditional is about to be evaluated again;

```perl
foreach [VARIABLE] ( [@LIST] ) {
  .. # Statements to repeat
} continue {
  .. # Statements to execute at the end of the loop
}
```

```perl
while ( [CONDITION] ) {
  .. # Statements to repeat
} continue {
  .. # Statements to execute at the end of the loop
}
```

## 6.3. Error Handling

### 6.3.1. Exceptions / Errors

### 6.3.2. Assertions
