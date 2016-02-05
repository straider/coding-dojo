#!/usr/bin/env perl

use strict;
use warnings;

print sprintf( "%04d\n"  , 5        );
print sprintf( "%04o\n"  , 020      );
print sprintf( "%04x\n"  , 0xFF     );
print sprintf( "%04.2f\n", 1.2345   );
print sprintf( "%07.5e\n", 1.2345   );
print sprintf( "%10s\n"  , 'string' );
