Quick Reference Guide
=====================

# 7. Functions

> A Perl subroutine or function is a group of statements that together performs a task. Perl uses the terms subroutine, method and function interchangeably.

## 7.1. main()

```perl
__PACKAGE__ -> main() unless caller;

sub main {
  .. # Main block of statements
}
```

## 7.2. Signature and Body

```perl
sub my_subroutine {
  .. # Block of statements for the subroutine

  return [VALUE];
}
```

**Note**: Because Perl compiles the program before executing it, it doesn't matter where the subroutine is declared: before or after its first call.

### 7.2.1. Default Values

To handle arguments with default value one has to use the ```||``` operator.

```perl
sub my_subroutine {
  my $variable = shift || 'DefaultValue';

  .. # Block of statements for the subroutine

  return [VALUE];
}
```

### 7.2.2. Named Arguments

To handle named arguments the solution is to pass the arguments inside an hash.

```perl
sub my_subroutine {
  my %arguments = @_;

  .. # Block of statements for the subroutine

  return [VALUE];
}
```

### 7.2.3. Subroutine Prototype

> A subroutine prototype tells Perl what sort of arguments it's expecting. This can be used to check to ensure that the user is passing the right number of parameters, and it can also change the way Perl reads a program. Prototypes come between the name and the block of the subroutine definition, in brackets.

```perl
sub my_subroutine ($$) {
  my ( $a, $b ) = ( shift, shift );

  .. # Block of statements for the subroutine

  return [VALUE];
}
```

### 7.2.4. Subroutine Forward Definition, with References

> When using prototypes one needs to ensure that Perl gets to read the prototype before using the subroutine, and to do this, one can use a forward definition at the top of the program.

```perl
sub my_subroutine_with_3_scalars ($$$);
sub my_subroutine_with_2_arrays (\@\@);
sub my_subroutine_with_1_hash (\%\%);
sub my_subroutine_with_scalar_and_code ($\&);
```

## 7.3. Scope

> By default, all variables in Perl are global variables, which means they can be accessed from anywhere in the program. But it's possible to create private variables, called lexical variables, at any time with the ```my``` operator. The ```my``` operator confines a variable to a particular region of code in which it can be used and accessed. Outside that region, this variable cannot be used or accessed. This region is called its scope.

> A **lexical scope** is usually a block of code with a set of braces around it, such as those defining the body of the subroutine or those marking the code blocks of if, while, for, foreach, and eval statements.

> The ```local``` is mostly used when the current value of a variable must be visible to called subroutines. A ```local``` just gives temporary values to global ( meaning package ) variables. This is known as **dynamic scoping**. This operator works by saving the current values of those variables in its argument list on a hidden stack and restoring them upon exiting the block, subroutine, or eval.

> There are another type of lexical variables, which are similar to private variables but they maintain their state and they do not get reinitialized upon multiple calls of the subroutines. These variables are defined using the ```state``` operator ( available since Perl 5.9.4 ).

## 7.4. Function Call

```perl
my_subroutine( [LIST_OF_ARGUMENTS] )
```

> One can pass various arguments to a subroutine like in any other programming language and they can be acessed inside the function using the special array ```@_```. Thus the first argument to the function is in ```$_[ 0 ]```, the second is in ```$_[ 1 ]```, and so on.

> **Note**: one can pass arrays and hashes as arguments like any scalar but passing more than one array or hash normally causes them to lose their separate identities. So it's best to use references to pass any array or hash.

> Because the ```@_``` variable is an array, it can be used to supply lists to a subroutine. However, because of the way in which Perl accepts and parses lists and arrays, it can be difficult to extract the individual elements from ```@_```. To pass a list along with other scalar arguments make sure it is the last argument.

> When passing a hash to a subroutine or operator that accepts a list then it is automatically translated into a list of key/value pairs.

```perl
sub print_hash {
  my ( %hash ) = @_;

  foreach my $key ( sort( keys( %hash ) ) ) {
    my $value = $hash{ $key };
    print "Key: ${key}; Value: ${value}\n";
  }
}

my %currencies = ( 'pt' => '€', 'uk' => '£', 'us' => '$' );
print_hash( %currencies );
```

> **Note**: Unlike almost every other major programming language, Perl calls by reference. This means that the variables or values available inside the body of a subroutine are not copies of the originals. They are the originals.

## 7.5. Variadic Functions

## 7.6. Return Values

> It's possible to return a value from a subroutine like in any other programming language. If there's no explicit value to return from a subroutine then whatever calculation is last performed in a subroutine is automatically also the return value.

> It's possible to return arrays and hashes from the subroutine like any scalar but returning more than one array or hash normally causes them to lose their separate identities. So it's best to use references to return any array or hash from a function.

> The context of a subroutine or statement is defined as the type of return value that is expected. This allows to use a single function that returns different values based on what the caller is expecting to receive.
