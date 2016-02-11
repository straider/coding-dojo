package BoardModel;

use strict;
use warnings;

use Exporter qw( import );

our $VERSION     = v1.00.00;
our @EXPORT_OK   = qw( create_board clear_board is_valid_row is_valid_column get_piece set_piece );
our @EXPORT      = qw( create_board clear_board is_valid_row is_valid_column get_piece set_piece );
our %EXPORT_TAGS = ();

sub create_board ( $$ ) {
}

sub clear_board ( \@ ) {
}

sub is_valid_row ( \@$ ) {
}

sub is_valid_column ( \@$ ) {
}

sub get_piece ( \@$$ ) {
}

sub set_piece ( \@$$$ ) {
}

1;
