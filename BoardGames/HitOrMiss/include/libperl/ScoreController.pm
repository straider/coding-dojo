package ScoreController;

use strict;
use warnings;

use Exporter qw( import );

our $VERSION     = v1.00.00;
our @EXPORT_OK   = qw( initialize_score show_score store_games store_hits store_misses );
our @EXPORT      = qw( initialize_score show_score store_games store_hits store_misses );
our %EXPORT_TAGS = ();

use ScoreModel v1.00.00;
use ScoreView v1.00.00;

my %score;

sub initialize_score () {
  %score = create_score();
}

sub show_score () {
  my @score_lines = build_score_lines( %score );

  foreach my $line ( @score_lines ) {
    print $line, "\n";
  }

  return @score_lines;
}

sub store_games () {
  %score = add_games( %score );
}

sub store_hits () {
  %score = add_hits( %score );
}

sub store_misses () {
  %score = add_misses( %score );
}

1;
