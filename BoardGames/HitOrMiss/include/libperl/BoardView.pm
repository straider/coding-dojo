package BoardView;

use strict;
use warnings;

use Exporter qw( import );

our $VERSION     = v1.00.00;
our @EXPORT_OK   = qw( build_board_lines );
our @EXPORT      = qw( build_board_lines );
our %EXPORT_TAGS = ();

use BoardModel;

sub build_separator_line ( $ ) {
  my $row_size = shift || 0;

  my $line = '';
  if ( $row_size > 0 ) {
    $line .= '   ';
    $line .= '+---' x $row_size;
    $line .= '+';
  }

  return $line;
}

sub build_header_line ( $ ) {
  my $row_size = shift || 0;

  my $line = '';
  if ( $row_size > 0 ) {
    $line .= '   ';
    my $letter = 'A';
    for ( 1 .. $row_size ) {
      $line .= "  $letter ";
      $letter++;
    }
    $line .= ' ';
  }

  return $line;
}

sub build_row_line ( \@$ ) {
  my $board     = shift || [];
  my $row_index = shift || 0;

  my $board_size = scalar @$board;

  my $line = '';
  if ( $board_size > 0 and is_valid_row( @$board, $row_index ) ) {
    $line .= " $row_index ";

    my $row      = @$board[ $row_index - 1 ];
    my $row_size = scalar @$row;

    for my $cell_index ( 1 .. $row_size ) {
      my $cell = get_piece( @$board, $row_index, $cell_index );
      $cell = '.' if ( $cell eq '' or $cell eq 'x' );

      $line .= "| $cell ";
    }
    $line .= '|';
  }

  return $line;
}

sub build_board_lines ( \@ ) {
  my $board = shift || [];

  my $board_size = scalar @$board;
  if ( $board_size > 0 ) {
    my @lines     = ();
    my $first_row = @$board[ 0 ];
    my $row_size  = scalar @$first_row;

    my $separator_line = build_separator_line( $row_size );

    my $header_line = build_header_line( $row_size );
    push( @lines, $header_line    );
    push( @lines, $separator_line );

    for my $row_index ( 1 .. $board_size ) {
      my $row = @$board[ $row_index - 1 ];
      my $row_line = build_row_line( @$board, $row_index );
      push( @lines, $row_line       );
      push( @lines, $separator_line );
    }

    return @lines;
  } else {
    return '';
  }

}

1;
