package BoardController;

use strict;
use warnings;

use Exporter qw( import );

our $VERSION     = v1.00.00;
our @EXPORT_OK   = qw( initialize_board reset_board show_board is_valid_cell is_hit mark_cell );
our @EXPORT      = qw( initialize_board reset_board show_board is_valid_cell is_hit mark_cell );
our %EXPORT_TAGS = ();

use BoardModel v1.00.00;
use BoardView v1.00.00;

my $PIECE_HIDDEN = 'x';
my $PIECE_HIT    = 'X';
my $PIECE_MISS   = 'O';

my @board;
my $number_of_rows;
my $number_of_columns;

sub set_mark () {
  my $random_row    = int( rand( $number_of_rows    ) ) + 1;
  my $random_column = int( rand( $number_of_columns ) ) + 1;

  @board = set_piece( @board, $random_row, $random_column, $PIECE_HIDDEN );
}

sub initialize_board ( $$ ) {
  $number_of_rows    = shift || 0;
  $number_of_columns = shift || 0;

  my $result = '';

  if ( $number_of_rows > 0 and $number_of_columns > 0 ) {
    @board  = create_board( $number_of_rows, $number_of_columns );
    $result = "${number_of_rows}x${number_of_columns}";
  }

  return $result;
}

sub reset_board () {
  my $result = '';

  if ( $number_of_rows > 0 and $number_of_columns > 0 ) {
    @board = clear_board( @board );

    set_mark();

    $result = "${number_of_rows}x${number_of_columns}";
  }

  return $result;
}

sub show_board () {
  my @board_lines = build_board_lines( @board );

  foreach my $line ( @board_lines ) {
    print $line, "\n";
  }

  return @board_lines;
}

sub is_valid_cell ( $$ ) {
  my $row_number    = shift || 0;
  my $column_letter = shift || '';

  my $result = '';

  if ( $row_number > 0 and $column_letter ne '' ) {
    my $column_number = ord( uc( $column_letter ) ) - ord( 'A' ) + 1;
    $result = ( is_valid_row( @board, $row_number ) and is_valid_column( @board, $column_number ) );
  }

  return $result;
}

sub is_hit ( $$ ) {
  my $row_number    = shift || 0;
  my $column_letter = shift || '';

  my $result = '';

  if ( is_valid_cell( $row_number, $column_letter ) ) {
    my $column_number = ord( $column_letter ) - ord( 'A' ) + 1;

    $result = get_piece( @board, $row_number, $column_number ) eq $PIECE_HIDDEN;
  }

  return $result;
}

sub mark_cell ( $$ ) {
  my $row_number    = shift || 0;
  my $column_letter = shift || '';

  my $result = '';

  if ( is_valid_cell( $row_number, $column_letter ) ) {
    my $column_number = ord( $column_letter ) - ord( 'A' ) + 1;
    my $piece         = get_piece( @board, $row_number, $column_number );
    my $is_free       = ( $piece ne $PIECE_HIT and $piece ne $PIECE_MISS );
    if ( $is_free ) {
      $piece  = is_hit( $row_number, $column_letter ) ? $PIECE_HIT : $PIECE_MISS;
      @board  = set_piece( @board, $row_number, $column_number, $piece );
      $result = 1;
    }
  }

  return $result;
}

1;
