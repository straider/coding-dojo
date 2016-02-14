package ScoreView;

use strict;
use warnings;

use Exporter qw( import );

our $VERSION     = v1.00.00;
our @EXPORT_OK   = qw( build_score_lines );
our @EXPORT      = qw( build_score_lines );
our %EXPORT_TAGS = ();

use ScoreModel v1.00.00;

sub build_score_lines ( \% ) {
  my $score = shift || {};

  my @lines  = ();
  my $games  = get_games  ( %$score ) || 0;
  my $hits   = get_hits   ( %$score ) || 0;
  my $misses = get_misses ( %$score ) || 0;

  push( @lines, 'Game Results:'                      );
  push( @lines, sprintf( "\tGames Played......... %2d"        , $games  ) );
  push( @lines, sprintf( "\tPlayer has won....... %2d time(s)", $hits   ) );
  push( @lines, sprintf( "\tPlayer has miss...... %2d time(s)", $misses ) );

  return @lines;
}

1;
