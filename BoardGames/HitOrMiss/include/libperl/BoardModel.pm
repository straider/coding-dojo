package BoardModel;

use strict;
use warnings;

use Exporter qw( import );

our $VERSION     = v1.00.00;
our @EXPORT_OK   = qw( create_board clear_board is_valid_row is_valid_column get_piece set_piece );
our @EXPORT      = qw( create_board clear_board is_valid_row is_valid_column get_piece set_piece );
our %EXPORT_TAGS = ();

use Storable;

sub create_board ( $$ ) {
  my $number_of_rows    = shift || 0;
  my $number_of_columns = shift || $number_of_rows;

  my @board = ();
  for ( 1 .. $number_of_rows ) {
    my @row = ();
    for ( 1 .. $number_of_columns ) {
      push( @row, '' );
    }
    push( @board, \@row );
  }

  return @board;
}

sub clear_board ( \@ ) {
  my $dirty_board = shift || [];

  my $dirty_board_size = scalar @$dirty_board;

  my @clean_board = ();
  if ( $dirty_board_size > 0 ) {
    foreach my $row_index ( 1 .. $dirty_board_size ) {
      my $dirty_row = @$dirty_board[ $row_index - 1 ];
      my @clean_row = map( { '' } @$dirty_row );
      push( @clean_board, \@clean_row );
    }
  }

  return @clean_board;
}

sub is_valid_row ( \@$ ) {
  my $board     = shift || [];
  my $row_index = shift || 0;

  my $row_count = scalar @$board;
  my $result    = ( $row_index > 0 and $row_index <= $row_count );

  return $result;
}

sub is_valid_column ( \@$ ) {
  my $board        = shift || [];
  my $column_index = shift || 0;

  my $row_count = scalar @$board;

  my $result = '';

  if ( $row_count > 0 ) {
    my $first_row    = @$board[ 0 ];
    my $column_count = scalar @$first_row;

    $result = ( $column_index > 0 and $column_index <= $column_count );
  }

  return $result;
}

sub get_piece ( \@$$ ) {
  my $board        = shift;
  my $row_index    = shift || 0;
  my $column_index = shift || 0;

  if ( is_valid_row( @$board, $row_index ) and is_valid_column( @$board, $column_index ) ) {
    my $row  = @$board [ $row_index    - 1 ];
    my $cell = @$row   [ $column_index - 1 ];
    return $cell;
  } else {
    return '';
  }
}

sub set_piece ( \@$$$ ) {
  my $old_board    = shift || [];
  my $row_index    = shift || 0;
  my $column_index = shift || 0;
  my $piece        = shift;

  my $new_board = Storable::dclone( $old_board );

  if ( is_valid_row( @$new_board, $row_index ) and is_valid_column( @$new_board, $column_index ) ) {
    my $row = @$new_board[ $row_index - 1 ];
    @$row[ $column_index - 1 ] = $piece;
  }

  return @$new_board;
}

1;
