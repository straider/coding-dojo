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

sub initialize_board ( $$ ) {
}

sub reset_board () {
}

sub show_board () {
}

sub is_valid_cell ( $$ ) {
}

sub is_hit ( $$ ) {
}

sub mark_cell ( $$ ) {
}

1;
