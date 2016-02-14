#!/usr/bin/env perl

use strict;
use warnings;

use File::Basename qw( dirname );
use File::Spec::Functions qw( catdir );
use FindBin;
use lib catdir( dirname( $FindBin::Bin ), 'include/libperl' );

use Test::More tests => 4;

use_ok 'ScoreView v1.00.00';
use ScoreView v1.00.00;

my %start_score = ( 'games' => 0, 'hits' => 0, 'misses' =>  0 );
my %final_score = ( 'games' => 3, 'hits' => 2, 'misses' => 10 );
my %wrong_score = ( 'wins' => 2, 'losses' => 10 );

my @start_score_lines = ( 'Game Results:'
                        , "\tGames Played.........  0"
                        , "\tPlayer has won.......  0 time(s)"
                        , "\tPlayer has miss......  0 time(s)"
                        );
my @final_score_lines = ( 'Game Results:'
                        , "\tGames Played.........  3"
                        , "\tPlayer has won.......  2 time(s)"
                        , "\tPlayer has miss...... 10 time(s)"
                        );
my @wrong_score_lines = ( 'Game Results:'
                        , "\tGames Played.........  0"
                        , "\tPlayer has won.......  0 time(s)"
                        , "\tPlayer has miss......  0 time(s)"
                        );

my @start_score_result = build_score_lines( %start_score );
my @final_score_result = build_score_lines( %final_score );
my @wrong_score_result = build_score_lines( %wrong_score );

is_deeply ( \@start_score_result, \@start_score_lines, 'build_score_lines() using score at start' );
is_deeply ( \@final_score_result, \@final_score_lines, 'build_score_lines() using score at final' );
is_deeply ( \@wrong_score_result, \@wrong_score_lines, 'build_score_lines() using a bad score'    );
