package DataComparator;

use strict;
use warnings;

use Exporter qw( import );

our $VERSION     = v1.00.00;
our @EXPORT_OK   = qw( compare_boards compare_board_lines compare_scores compare_score_lines );
our @EXPORT      = qw( compare_boards compare_board_lines compare_scores compare_score_lines );
our %EXPORT_TAGS = ();

sub compare_boards ( \@\@ ) {
  my $left_board  = shift;
  my $right_board = shift;

  my $left_board_size  = scalar @$left_board ;
  my $right_board_size = scalar @$right_board;
  my $same_size        = ( $left_board_size == $right_board_size );

  my $match = 1;

  if ( $same_size and $left_board_size > 0 ) {

    OUTER_LOOP:
    for my $row_index ( 0 .. $left_board_size - 1 ) {
      my $left_row  = @$left_board  [ $row_index ];
      my $right_row = @$right_board [ $row_index ];

      my $left_row_size = scalar @$left_row;
      INNER_LOOP:
      for my $column_index ( 0 .. $left_row_size - 1 ) {
        my $left_cell  = @$left_row  [ $column_index ];
        my $right_cell = @$right_row [ $column_index ];

        if ( $left_cell ne $right_cell ) {
          print "At ( $row_index, $column_index ): Left Cell = '$left_cell'; Right Cell = '$right_cell'\n";
          $match = '';
          last OUTER_LOOP;
        }
      }
    }
  } elsif ( ! $same_size ) {
    print "Left Board Size = $left_board_size; Right Board Size = $right_board_size\n";
  }

  return $same_size && $match;
}

sub compare_board_lines ( \@\@ ) {
  my $left_board_lines  = shift;
  my $right_board_lines = shift;

  my $left_board_lines_size  = scalar @$left_board_lines ;
  my $right_board_lines_size = scalar @$right_board_lines;
  my $same_size              = ( $left_board_lines_size == $right_board_lines_size );

  my $match = 1;

  if ( $same_size and $left_board_lines_size > 0 ) {
    for my $lines_index ( 0 .. $left_board_lines_size - 1 ) {
      my $left_line  = @$left_board_lines  [ $lines_index ];
      my $right_line = @$right_board_lines [ $lines_index ];

      if ( $left_line ne $right_line ) {
        print "Left Line = $left_line vs. Right Line = $right_line\n";
        $match = '';
        last;
      }
    }
  } elsif ( ! $same_size ) {
    print "Left Board Lines Size = $left_board_lines_size; Right Board Lines Size = $right_board_lines_size\n";
  }

  return $same_size && $match;
}

sub compare_scores ( \%\% ) {
  my $left_score  = shift;
  my $right_score = shift;

  my @score_keys = ( 'games', 'hits', 'misses' );

  my @sorted_score_keys = sort( @score_keys           );
  my @sorted_left_keys  = sort( keys( %$left_score  ) );
  my @sorted_right_keys = sort( keys( %$right_score ) );

  my $sorted_score_hash = join( '|', @sorted_score_keys );
  my $sorted_left_hash  = join( '|', @sorted_left_keys  );
  my $sorted_right_hash = join( '|', @sorted_right_keys );

  my $match = ( scalar @sorted_left_keys == scalar @sorted_right_keys );

  if ( $sorted_score_hash eq $sorted_left_hash and $sorted_score_hash eq $sorted_right_hash ) {
    foreach my $key ( @sorted_score_keys ) {
      if ( $left_score->{ $key } != $right_score->{ $key } ) {
        print "LeftScoreValue for $key = $left_score->{ $key } vs. RightScoreValue for $key = $right_score->{ $key }\n";
        $match = '';
        last;
      }
    }
  }

  return $match;
}

sub compare_score_lines ( \@\@ ) {
  my $left_score_lines  = shift;
  my $right_score_lines = shift;

  my $left_score_lines_size  = scalar @$left_score_lines ;
  my $right_score_lines_size = scalar @$right_score_lines;
  my $same_size              = ( $left_score_lines_size == $right_score_lines_size );

  my $match = 1;

  if ( $same_size ) {
    for my $lines_index ( 0 .. $left_score_lines_size - 1 ) {
      my $left_line  = @$left_score_lines  [ $lines_index ];
      my $right_line = @$right_score_lines [ $lines_index ];

      if ( $left_line ne $right_line ) {
        print "Left Line = $left_line vs. Right Line = $right_line\n";
        $match = '';
        last;
      }
    }
  } elsif ( ! $same_size ) {
    print "Left Score Lines Size = $left_score_lines_size; Right Score Lines Size = $right_score_lines_size\n";
  }

  return $same_size && $match;
}

1;
