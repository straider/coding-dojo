package ScoreModel;

use strict;
use warnings;

use Exporter qw( import );

our $VERSION     = v1.00.00;
our @EXPORT_OK   = qw( create_score add_games add_hits add_misses get_games get_hits get_misses );
our @EXPORT      = qw( create_score add_games add_hits add_misses get_games get_hits get_misses );
our %EXPORT_TAGS = ();

my $GAMES_KEY  = 'games' ;
my $HITS_KEY   = 'hits'  ;
my $MISSES_KEY = 'misses';

sub create_score () {
  my %score = ( $GAMES_KEY => 0, $HITS_KEY => 0, $MISSES_KEY => 0 );

  return %score;
}

sub add_value ( \%$ ) {
  my $score = shift || {};
  my $key   = shift || '';

  my %new_score = %$score;
  $new_score{ $key } = $new_score{ $key } + 1;

  return %new_score;
}

sub add_games ( \% ) {
  my $score = shift || {};

  return add_value( %$score, $GAMES_KEY );
}

sub add_hits ( \% ) {
  my $score = shift || {};

  return add_value( %$score, $HITS_KEY );
}

sub add_misses ( \% ) {
  my $score = shift || {};

  return add_value( %$score, $MISSES_KEY );
}

sub get_value ( \%$ ) {
  my $score = shift || {};
  my $key   = shift || '';

  return $score->{ $key };
}

sub get_games ( \% ) {
  my $score = shift || {};

  return get_value( %$score, $GAMES_KEY );
}

sub get_hits ( \% ) {
  my $score = shift || {};

  return get_value( %$score, $HITS_KEY );
}

sub get_misses ( \% ) {
  my $score = shift || {};

  return get_value( %$score, $MISSES_KEY );
}

1;
