package GameController;

use strict;
use warnings;

use Exporter qw( import );

our $VERSION     = v1.00.00;
our @EXPORT_OK   = qw( play_game );
our @EXPORT      = qw( play_game );
our %EXPORT_TAGS = ();

use POSIX;

use BoardController v1.00.00;
use ScoreController v1.00.00;

my $maximum_attempts = 0;
my $moves_played     = 0;

sub initialize_game ( $$ ) {
  my $number_of_rows    = shift || 0;
  my $number_of_columns = shift || 0;

  $maximum_attempts = POSIX::ceil( $number_of_rows * $number_of_columns / 2 );
  $moves_played     = 0;

  initialize_score();

  return initialize_board( $number_of_rows, $number_of_columns );
}

sub reset_game () {
  $moves_played = 0;

  store_games();

  return reset_board();
}

sub print_board () {
  return show_board();
}

sub is_valid_digit( $ ) {
  my $character = shift || '';

  my $result = '';

  if ( length( $character ) == 1 ) {
    $result = ( $character =~ /[1-9]/ );
  }

  return $result;
}

sub is_valid_letter( $ ) {
  my $character = shift || '';

  my $result = '';

  if ( length( $character ) == 1 ) {
    $result = ( lc( $character ) =~ /[a-z]/ );
  }

  return $result;
}

sub ask_cell_reference () {
  my $input;

  my $is_digit_letter = '';
  my $is_letter_digit = '';
  my $is_valid_input  = '';

  until ( $is_valid_input ) {
    print 'Enter a cell reference: ';
    $input = <STDIN>;
    chomp( $input );

    if ( length( $input ) == 2 ) {
      $is_digit_letter = ( is_valid_digit  ( substr( $input, 0, 1 ) ) and is_valid_letter ( substr( $input, 1, 1 ) ) );
      $is_letter_digit = ( is_valid_letter ( substr( $input, 0, 1 ) ) and is_valid_digit  ( substr( $input, 1, 1 ) ) );
      $is_valid_input  = ( $is_digit_letter or $is_letter_digit );
    }

    if ( ! $is_valid_input ) {
      print "Invalid Cell Reference!\n";
    }
  }

  my $row_number    = ( $is_digit_letter ) ? int( substr( $input, 0, 1 ) ) : int( substr( $input, 1, 1 ) );
  my $column_number = ( $is_letter_digit ) ?  uc( substr( $input, 0, 1 ) ) :  uc( substr( $input, 1, 1 ) );

  return ( $row_number, $column_number );
}

sub is_valid_cell_reference ( $$ ) {
  my $row_number    = shift || 0;
  my $column_letter = shift || '';

  return is_valid_cell( $row_number, $column_letter );
}

sub put_piece ( $$ ) {
  my $row_number    = shift || 0;
  my $column_letter = shift || '';

  my $is_valid_move = mark_cell( $row_number, $column_letter );
  $moves_played++ if ( $is_valid_move );

  return $is_valid_move;
}

sub is_win ( $$ ) {
  my $row_number    = shift || 0;
  my $column_letter = shift || '';

  return is_hit( $row_number, $column_letter );
}

sub has_no_more_attempts () {
  return ( $moves_played >= $maximum_attempts );
}

sub ask_play_again () {
  my $input;

  my $is_valid_input  = '';
  until ( $is_valid_input ) {
    print 'Do you wish to play again? ';
    $input = <STDIN>;
    chomp( $input );

    $is_valid_input = ( length( $input ) >= 1 );
    if ( ! $is_valid_input ) {
      print "Invalid Answer!\n";
    }
  }

  return $input;
}

sub is_valid_answer ( $ ) {
  my $answer = shift || '';

  my $first_letter = substr( $answer, 0, 1 );

  return ( lc( $first_letter ) eq 'y' or lc( $first_letter ) eq 'n' );
}

sub print_score () {
  return show_score();
}

sub play_game ( $$ ) {
  my $number_of_rows    = shift || 0;
  my $number_of_columns = shift || 0;

  initialize_game( $number_of_rows, $number_of_columns );

  my $answer = '';

  do {
    reset_game();

    my $end_game_condition = '';
    until ( $end_game_condition ) {
      print_board();

      my $row_number;
      my $column_letter;

      do {
        ( $row_number, $column_letter ) = ask_cell_reference();
      } while ( ! is_valid_cell_reference( $row_number, $column_letter ) );

      my $is_win_condition = is_win    ( $row_number, $column_letter );
      my $is_valid_move    = put_piece ( $row_number, $column_letter );
      if ( $is_win_condition ) {
        store_hits();
      } else {
        store_misses() if ( $is_valid_move );
      }

      $end_game_condition = ( $is_win_condition or has_no_more_attempts() );
    }

    print_board();
    do {
      $answer = ask_play_again();
    } while ( ! is_valid_answer( $answer ) );
  } while ( lc( substr( $answer, 0 , 1 ) ) eq 'y' );

  print_score();
}

1;
