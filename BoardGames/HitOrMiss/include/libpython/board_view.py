def build_separator_line( board_size ) :
  line = None

  if board_size > 0 :
    line = '   '

    line += '+---' * board_size
    line += '+'

  return line

def build_header_line( board_size ) :
  line = None

  if board_size > 0 :
    line   = '   '
    letter = 0
    for _ in range( board_size ) :
      line += '  {0} '.format( chr( letter + ord( 'A' ) ) )
      letter += 1
    line += ' '

  return line

def build_row_line( board, row_number ) :
  line = None

  if row_number in range( 1, len( board ) + 1 ) :
    line = ' {0} '.format( row_number )
    row  = board[ row_number - 1 ]

    for column_index in range( len( row ) ) :
      piece = row[ column_index ]
      piece = piece if ( piece != 'x' and piece != '' ) else '.'

      line += '| {0} '.format( piece )
    line += '|'

  return line

def build_board_lines( board ) :
  lines = None

  if type( board ) is list :
    board_size = len( board )
    if board_size > 0 :
      lines     = list()
      first_row = board[ 0 ]
      row_size  = len( first_row )

      lines.append( build_header_line    ( row_size ) )
      lines.append( build_separator_line ( row_size ) )

      for row_number in range( 1, board_size + 1 ) :
        lines.append( build_row_line       ( board, row_number ) )
        lines.append( build_separator_line ( row_size          ) )

  return lines

