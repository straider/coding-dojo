#!/usr/bin/env perl

use strict;
use warnings;

printf "%04d\n"  , 5       ;
printf "%04o\n"  , 020     ;
printf "%04x\n"  , 0xFF    ;
printf "%04.2f\n", 1.2345  ;
printf "%07.5e\n", 1.2345  ;
printf "%10s\n"  , 'string';
