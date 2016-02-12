#!/usr/bin/env perl

use strict;
use warnings;

use File::Basename qw( dirname );
use File::Spec::Functions qw( catdir );
use FindBin;
use lib catdir( dirname( $FindBin::Bin ), 'include/libperl' );

use Test::Simple tests => 9;

use ScoreModel v1.00.00;
use DataComparator v1.00.00;

my @score_keys        = ( 'games', 'hits', 'misses' );
my %start_score       = ( 'games' => 0, 'hits' => 0, 'misses' => 0 );
my %first_score_hit   = ( 'games' => 1, 'hits' => 1, 'misses' => 0 );
my %second_score_miss = ( 'games' => 2, 'hits' => 1, 'misses' => 1 );
my %second_score_hit  = ( 'games' => 2, 'hits' => 2, 'misses' => 1 );
my %third_score_miss  = ( 'games' => 3, 'hits' => 2, 'misses' => 2 );
my %third_score_hit   = ( 'games' => 3, 'hits' => 3, 'misses' => 2 );

my %created_score = create_score();

my %add_game_1      = add_games  ( %created_score   );
my %add_game_1_hit  = add_hits   ( %add_game_1      );

my %add_game_2      = add_games  ( %add_game_1_hit  );
my %add_game_2_miss = add_misses ( %add_game_2      );
my %add_game_2_hit  = add_hits   ( %add_game_2_miss );

my %add_game_3      = add_games  ( %add_game_2_hit  );
my %add_game_3_miss = add_misses ( %add_game_3      );
my %add_game_3_hit  = add_hits   ( %add_game_3_miss );

ok ( compare_scores( %created_score  , %start_score       ) == 1, 'create_score()'                             );
ok ( compare_scores( %add_game_1_hit , %first_score_hit   ) == 1, 'add_games () and add_hits() for 1st game'   );
ok ( compare_scores( %add_game_2_miss, %second_score_miss ) == 1, 'add_games () and add_misses() for 2nd game' );
ok ( compare_scores( %add_game_2_hit , %second_score_hit  ) == 1, 'add_hits  () for 2nd game'                  );
ok ( compare_scores( %add_game_3_miss, %third_score_miss  ) == 1, 'add_games () and add_misses() for 3rd game' );
ok ( compare_scores( %add_game_3_hit , %third_score_hit   ) == 1, 'add_hits  () for 3rd game'                  );

ok ( get_games  ( %third_score_hit ) == 3, 'get_games  () for 3rd game' );
ok ( get_hits   ( %third_score_hit ) == 3, 'get_hits   () for 3rd game' );
ok ( get_misses ( %third_score_hit ) == 2, 'get_misses () for 3rd game' );
